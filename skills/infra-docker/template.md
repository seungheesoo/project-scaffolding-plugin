# Docker Boilerplate

## 디렉토리 구조
```
docker/
├── Dockerfile.frontend
├── Dockerfile.backend
└── nginx.conf
docker-compose.yml
```

## docker/Dockerfile.frontend (React/Vite 선택 시)
```dockerfile
# Build stage
FROM node:20-alpine AS builder
WORKDIR /app
COPY frontend/package*.json ./
RUN npm ci
COPY frontend/ .
RUN npm run build

# Production stage
FROM nginx:alpine
COPY --from=builder /app/dist /usr/share/nginx/html
COPY docker/nginx.conf /etc/nginx/conf.d/default.conf
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
```

## docker/Dockerfile.frontend (Next.js 선택 시)
```dockerfile
# Build stage
FROM node:20-alpine AS builder
WORKDIR /app
COPY frontend/package*.json ./
RUN npm ci
COPY frontend/ .
RUN npm run build

# Production stage
FROM node:20-alpine AS runner
WORKDIR /app
ENV NODE_ENV=production
COPY --from=builder /app/public ./public
COPY --from=builder /app/.next/standalone ./
COPY --from=builder /app/.next/static ./.next/static
EXPOSE 3000
CMD ["node", "server.js"]
```

## docker/Dockerfile.backend (Node.js 선택 시)
```dockerfile
FROM node:20-alpine
WORKDIR /app
COPY backend/package*.json ./
RUN npm ci --only=production
COPY backend/dist ./dist
EXPOSE 3000
CMD ["node", "dist/index.js"]
```

## docker/Dockerfile.backend (Spring Boot 선택 시)
```dockerfile
# Build stage
FROM gradle:8-jdk21 AS builder
WORKDIR /app
COPY backend/build.gradle backend/settings.gradle ./
COPY backend/src ./src
RUN gradle build -x test --no-daemon

# Production stage
FROM eclipse-temurin:21-jre-alpine
WORKDIR /app
COPY --from=builder /app/build/libs/*.jar app.jar
EXPOSE 3000
CMD ["java", "-jar", "app.jar"]
```

## docker/Dockerfile.backend (FastAPI 선택 시)
```dockerfile
FROM python:3.11-slim
WORKDIR /app
COPY backend/requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY backend/app ./app
EXPOSE 3000
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "3000"]
```

## docker/nginx.conf (React/Vite 선택 시)
```nginx
server {
    listen 80;
    server_name localhost;
    root /usr/share/nginx/html;
    index index.html;

    location / {
        try_files $uri $uri/ /index.html;
    }

    location /api {
        proxy_pass http://backend:3000;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection 'upgrade';
        proxy_set_header Host $host;
        proxy_cache_bypass $http_upgrade;
    }
}
```

## docker-compose.yml (React + Backend 선택 시)
```yaml
services:
  frontend:
    build:
      context: .
      dockerfile: docker/Dockerfile.frontend
    ports:
      - "80:80"
    depends_on:
      - backend

  backend:
    build:
      context: .
      dockerfile: docker/Dockerfile.backend
    ports:
      - "3000:3000"
    env_file:
      - ./config/.env
```

## docker-compose.yml (Next.js + Backend 선택 시)
```yaml
services:
  frontend:
    build:
      context: .
      dockerfile: docker/Dockerfile.frontend
    ports:
      - "80:3000"
    depends_on:
      - backend

  backend:
    build:
      context: .
      dockerfile: docker/Dockerfile.backend
    ports:
      - "3000:3000"
    env_file:
      - ./config/.env
```

## docker-compose.yml (React만 선택 시)
```yaml
services:
  frontend:
    build:
      context: .
      dockerfile: docker/Dockerfile.frontend
    ports:
      - "80:80"
    env_file:
      - ./config/.env
```

## docker-compose.yml (Next.js만 선택 시)
```yaml
services:
  frontend:
    build:
      context: .
      dockerfile: docker/Dockerfile.frontend
    ports:
      - "80:3000"
    env_file:
      - ./config/.env
```

## docker-compose.yml (Backend만 선택 시)
```yaml
services:
  backend:
    build:
      context: .
      dockerfile: docker/Dockerfile.backend
    ports:
      - "80:3000"
    env_file:
      - ./config/.env
```

