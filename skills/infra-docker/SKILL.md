---
name: infra-docker
description: Docker 설정을 추가합니다. Dockerfile(Frontend, Backend), docker-compose.yml, nginx.conf를 생성합니다.
user-invocable: true
---

# infra-docker

Docker 설정을 추가합니다.

## 역할
- Dockerfile 생성 (Frontend, Backend 각각)
- docker-compose.yml 생성
- nginx.conf 생성 (React/Vite 선택 시)

## 생성 파일

### Frontend Dockerfile
| 선택 | 파일 |
|------|------|
| React (Vite) | `docker/Dockerfile.frontend` (nginx 기반) |
| Next.js | `docker/Dockerfile.frontend` (standalone 모드) |

### Backend Dockerfile
| 선택 | 파일 |
|------|------|
| Node.js (Express) | `docker/Dockerfile.backend` |
| Java (Spring Boot) | `docker/Dockerfile.backend` (Gradle multi-stage) |
| Python (FastAPI) | `docker/Dockerfile.backend` (uvicorn) |

### docker-compose.yml
Frontend/Backend 선택 조합에 따라 적절한 서비스 구성 생성

### nginx.conf
React (Vite) 선택 시에만 생성 (SPA 라우팅 지원)

## 템플릿

[template.md](template.md) - Docker 관련 파일 boilerplate

## 사용법

이 skill은 `/scaffold` 명령어에서 Infra "Docker" 선택 시 자동으로 호출됩니다.
