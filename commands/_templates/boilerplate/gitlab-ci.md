# GitLab CI Boilerplate

## .gitlab-ci.yml (Node.js Backend 선택 시)
```yaml
stages:
  - lint
  - test
  - build
  - deploy

variables:
  NODE_VERSION: "20"

.node_cache: &node_cache
  cache:
    key: ${CI_COMMIT_REF_SLUG}
    paths:
      - node_modules/
      - frontend/node_modules/
      - backend/node_modules/

lint:
  stage: lint
  image: node:${NODE_VERSION}-alpine
  <<: *node_cache
  script:
    - cd frontend && npm ci && npm run lint
    - cd ../backend && npm ci && npm run lint
  only:
    - merge_requests
    - main
    - develop

test:
  stage: test
  image: node:${NODE_VERSION}-alpine
  <<: *node_cache
  script:
    - cd backend && npm ci && npm run test
  only:
    - merge_requests
    - main
    - develop

build:
  stage: build
  image: docker:latest
  services:
    - docker:dind
  script:
    - docker compose build
  only:
    - main
    - develop

deploy:staging:
  stage: deploy
  script:
    - echo "Deploy to staging"
  environment:
    name: staging
  only:
    - develop

deploy:production:
  stage: deploy
  script:
    - echo "Deploy to production"
  environment:
    name: production
  only:
    - main
  when: manual
```

## .gitlab-ci.yml (Spring Boot 선택 시)
```yaml
stages:
  - lint
  - test
  - build
  - deploy

variables:
  NODE_VERSION: "20"
  GRADLE_OPTS: "-Dorg.gradle.daemon=false"

lint:frontend:
  stage: lint
  image: node:${NODE_VERSION}-alpine
  cache:
    key: ${CI_COMMIT_REF_SLUG}-frontend
    paths:
      - frontend/node_modules/
  script:
    - cd frontend && npm ci && npm run lint
  only:
    - merge_requests
    - main
    - develop

test:backend:
  stage: test
  image: gradle:8-jdk21
  cache:
    key: ${CI_COMMIT_REF_SLUG}-gradle
    paths:
      - backend/.gradle/
  script:
    - cd backend && gradle test
  only:
    - merge_requests
    - main
    - develop

build:
  stage: build
  image: docker:latest
  services:
    - docker:dind
  script:
    - docker compose build
  only:
    - main
    - develop

deploy:staging:
  stage: deploy
  script:
    - echo "Deploy to staging"
  environment:
    name: staging
  only:
    - develop

deploy:production:
  stage: deploy
  script:
    - echo "Deploy to production"
  environment:
    name: production
  only:
    - main
  when: manual
```

## .gitlab-ci.yml (FastAPI 선택 시)
```yaml
stages:
  - lint
  - test
  - build
  - deploy

variables:
  NODE_VERSION: "20"
  PYTHON_VERSION: "3.11"

lint:frontend:
  stage: lint
  image: node:${NODE_VERSION}-alpine
  cache:
    key: ${CI_COMMIT_REF_SLUG}-frontend
    paths:
      - frontend/node_modules/
  script:
    - cd frontend && npm ci && npm run lint
  only:
    - merge_requests
    - main
    - develop

lint:backend:
  stage: lint
  image: python:${PYTHON_VERSION}-slim
  cache:
    key: ${CI_COMMIT_REF_SLUG}-pip
    paths:
      - backend/.venv/
  script:
    - cd backend && pip install ruff && ruff check app/
  only:
    - merge_requests
    - main
    - develop

test:backend:
  stage: test
  image: python:${PYTHON_VERSION}-slim
  cache:
    key: ${CI_COMMIT_REF_SLUG}-pip
    paths:
      - backend/.venv/
  script:
    - cd backend && pip install -r requirements.txt pytest && pytest
  only:
    - merge_requests
    - main
    - develop

build:
  stage: build
  image: docker:latest
  services:
    - docker:dind
  script:
    - docker compose build
  only:
    - main
    - develop

deploy:staging:
  stage: deploy
  script:
    - echo "Deploy to staging"
  environment:
    name: staging
  only:
    - develop

deploy:production:
  stage: deploy
  script:
    - echo "Deploy to production"
  environment:
    name: production
  only:
    - main
  when: manual
```

## .gitlab-ci.yml (Frontend만 선택 시)
```yaml
stages:
  - lint
  - build
  - deploy

variables:
  NODE_VERSION: "20"

.node_cache: &node_cache
  cache:
    key: ${CI_COMMIT_REF_SLUG}
    paths:
      - frontend/node_modules/

lint:
  stage: lint
  image: node:${NODE_VERSION}-alpine
  <<: *node_cache
  script:
    - cd frontend && npm ci && npm run lint
  only:
    - merge_requests
    - main
    - develop

build:
  stage: build
  image: docker:latest
  services:
    - docker:dind
  script:
    - docker compose build
  only:
    - main
    - develop

deploy:staging:
  stage: deploy
  script:
    - echo "Deploy to staging"
  environment:
    name: staging
  only:
    - develop

deploy:production:
  stage: deploy
  script:
    - echo "Deploy to production"
  environment:
    name: production
  only:
    - main
  when: manual
```

## .gitlab-ci.yml (Node.js Backend만 선택 시)
```yaml
stages:
  - lint
  - test
  - build
  - deploy

variables:
  NODE_VERSION: "20"

.node_cache: &node_cache
  cache:
    key: ${CI_COMMIT_REF_SLUG}
    paths:
      - backend/node_modules/

lint:
  stage: lint
  image: node:${NODE_VERSION}-alpine
  <<: *node_cache
  script:
    - cd backend && npm ci && npm run lint
  only:
    - merge_requests
    - main
    - develop

test:
  stage: test
  image: node:${NODE_VERSION}-alpine
  <<: *node_cache
  script:
    - cd backend && npm ci && npm run test
  only:
    - merge_requests
    - main
    - develop

build:
  stage: build
  image: docker:latest
  services:
    - docker:dind
  script:
    - docker compose build
  only:
    - main
    - develop

deploy:staging:
  stage: deploy
  script:
    - echo "Deploy to staging"
  environment:
    name: staging
  only:
    - develop

deploy:production:
  stage: deploy
  script:
    - echo "Deploy to production"
  environment:
    name: production
  only:
    - main
  when: manual
```

## .gitlab-ci.yml (Spring Boot Backend만 선택 시)
```yaml
stages:
  - test
  - build
  - deploy

variables:
  GRADLE_OPTS: "-Dorg.gradle.daemon=false"

test:
  stage: test
  image: gradle:8-jdk21
  cache:
    key: ${CI_COMMIT_REF_SLUG}-gradle
    paths:
      - backend/.gradle/
  script:
    - cd backend && gradle test
  only:
    - merge_requests
    - main
    - develop

build:
  stage: build
  image: docker:latest
  services:
    - docker:dind
  script:
    - docker compose build
  only:
    - main
    - develop

deploy:staging:
  stage: deploy
  script:
    - echo "Deploy to staging"
  environment:
    name: staging
  only:
    - develop

deploy:production:
  stage: deploy
  script:
    - echo "Deploy to production"
  environment:
    name: production
  only:
    - main
  when: manual
```

## .gitlab-ci.yml (FastAPI Backend만 선택 시)
```yaml
stages:
  - lint
  - test
  - build
  - deploy

variables:
  PYTHON_VERSION: "3.11"

lint:
  stage: lint
  image: python:${PYTHON_VERSION}-slim
  cache:
    key: ${CI_COMMIT_REF_SLUG}-pip
    paths:
      - backend/.venv/
  script:
    - cd backend && pip install ruff && ruff check app/
  only:
    - merge_requests
    - main
    - develop

test:
  stage: test
  image: python:${PYTHON_VERSION}-slim
  cache:
    key: ${CI_COMMIT_REF_SLUG}-pip
    paths:
      - backend/.venv/
  script:
    - cd backend && pip install -r requirements.txt pytest && pytest
  only:
    - merge_requests
    - main
    - develop

build:
  stage: build
  image: docker:latest
  services:
    - docker:dind
  script:
    - docker compose build
  only:
    - main
    - develop

deploy:staging:
  stage: deploy
  script:
    - echo "Deploy to staging"
  environment:
    name: staging
  only:
    - develop

deploy:production:
  stage: deploy
  script:
    - echo "Deploy to production"
  environment:
    name: production
  only:
    - main
  when: manual
```
