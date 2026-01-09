# 공통 Boilerplate 파일

## config/.env.example
```
# Database
DB_HOST=localhost
DB_PORT=5432
DB_NAME=myapp
DB_USER=postgres
DB_PASSWORD=

# API
API_PORT=3000
API_BASE_URL=http://localhost:3000

# Frontend (Vite)
VITE_API_URL=http://localhost:3000/api

# Frontend (Next.js)
NEXT_PUBLIC_API_URL=http://localhost:3000/api

# JWT
JWT_SECRET=
JWT_EXPIRES_IN=7d
```

## .gitignore
```
# Dependencies
node_modules/
vendor/
__pycache__/
.venv/
venv/

# Build
dist/
build/
.next/
*.jar
target/

# Environment
.env
.env.local
.env.*.local

# IDE
.idea/
.vscode/
*.swp
*.swo

# OS
.DS_Store
Thumbs.db

# Logs
*.log
logs/

# Test
coverage/
.pytest_cache/
```

## README.md (프로젝트 루트)
```markdown
# {project}

## 개요
프로젝트 설명을 작성하세요.

## 기술 스택
- Frontend:
- Backend:
- Infra:

## 시작하기

### 요구사항
- Node.js 20+
- (기타 요구사항)

### 설치
```bash
# Frontend
cd frontend && npm install

# Backend
cd backend && npm install
```

### 실행
```bash
# Frontend
cd frontend && npm run dev

# Backend
cd backend && npm run dev
```

## 프로젝트 구조
```
{project}/
├── frontend/     # Frontend 애플리케이션
├── backend/      # Backend API 서버
├── docker/       # Docker 설정
├── config/       # 환경 설정
└── docs/         # 문서
```

## 라이선스
MIT
```

## docs/README.md
```markdown
# {project} 문서

## 목차
- [API 명세](./api.md)
- [아키텍처](./architecture.md)
- [배포 가이드](./deployment.md)

## 개발 가이드
(개발 관련 문서를 이 폴더에 추가하세요)
```

## CLAUDE.md
```markdown
# Summary instructions

압축 시 현재 workspace 선택 정보를 유지하세요.
```
