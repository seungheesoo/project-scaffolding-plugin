# Project Scaffolding Plugin

풀스택 프로젝트 디렉토리 구조를 자동으로 생성하는 Claude Code 플러그인입니다.

## 지원 스택

| Frontend | Backend | Infra |
|----------|---------|-------|
| React (Vite) | Node.js (Express) | Docker |
| Next.js | Java (Spring Boot) | GitLab CI |
| Vue 3 (Vite) | Python (FastAPI) | |

## 설치

```bash
# 로컬 테스트
claude --plugin-dir ./project-scaffolding-plugin

# 마켓플레이스 설치
claude plugin install project-scaffolding@marketplace-name
```

## 명령어

### /scaffold
프로젝트 구조 생성

```bash
/project-scaffolding:scaffold
```

### /workspace
작업 workspace 선택

```bash
/project-scaffolding:workspace
```

## 생성되는 구조

```
{project}/
├── .claude/role/       # workspace별 에이전트 역할 정의
├── frontend/           # Frontend 선택 시
├── backend/            # Backend 선택 시
├── docker/             # Docker 선택 시
├── docker-compose.yml  # Docker 선택 시
├── config/
├── docs/
├── .gitignore
├── .gitlab-ci.yml      # GitLab CI 선택 시
├── README.md
└── CLAUDE.md
```

## 라이선스

MIT
