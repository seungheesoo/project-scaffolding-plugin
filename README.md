# Project Scaffolding Plugin

풀스택 프로젝트 디렉토리 구조를 자동으로 생성하는 Claude Code 플러그인입니다.

## 주요 기능

- **FSD 아키텍처**: Feature-Sliced Design 기반 Frontend 구조
- **shadcn/ui**: Tailwind CSS + Radix UI 컴포넌트 시스템
- **테마 선택**: shadcn/ui Neutral (라이트/다크) 또는 Lime-Cyan Dark
- **MSW**: Mock Service Worker API 모킹 환경 (선택)
- **병합 모드**: 기존 프로젝트에 누락된 구조만 추가

## 지원 스택

| Frontend | Backend | Infra |
|----------|---------|-------|
| React (Vite) | Node.js (Express) | Docker |
| Next.js | Java (Spring Boot) | GitLab CI |
| | Python (FastAPI) | |

## 설치

```bash
# 로컬 테스트
claude --plugin-dir ./project-scaffolding-plugin
```

## 명령어

### /scaffold [project-name]
프로젝트 구조 생성

```bash
/project-scaffolding:scaffold my-app
```

### /workspace [root|frontend|backend]
작업 workspace 선택

```bash
/project-scaffolding:workspace frontend
```

## 생성되는 구조

```
{project}/
├── .claude/role/           # workspace별 역할 정의
│   ├── root.md
│   ├── frontend.md         # Frontend 선택 시
│   └── backend.md          # Backend 선택 시
├── frontend/               # Frontend 선택 시 (FSD 아키텍처)
│   ├── src/
│   │   ├── app/            # 앱 초기화, 라우터 (React)
│   │   ├── pages/          # 페이지 컴포넌트 (React)
│   │   ├── widgets/        # 독립적 UI 블록
│   │   ├── features/       # 사용자 기능
│   │   ├── entities/       # 비즈니스 엔티티
│   │   └── shared/         # 공용 모듈, shadcn/ui
│   └── ...
├── backend/                # Backend 선택 시
├── docker/                 # Docker 선택 시
├── docker-compose.yml      # Docker 선택 시
├── config/.env.example
├── docs/README.md
├── .gitignore
├── .gitlab-ci.yml          # GitLab CI 선택 시
├── README.md
└── CLAUDE.md
```

## 스택별 특징

### Frontend
- **React (Vite)**: FSD 전체 레이어 (`app/pages/widgets/features/entities/shared`)
- **Next.js**: App Router + FSD (`app/` + `widgets/features/entities/shared`)
- **공통**: TypeScript, Tailwind CSS, shadcn/ui, react-hook-form + zod

### Backend
- **Express**: TypeScript, Jest, ESLint
- **Spring Boot**: Java 21, Gradle, Lombok
- **FastAPI**: Python 3.11, Pydantic, Ruff

### Infra
- **Docker**: 스택별 Dockerfile, nginx (React), docker-compose
- **GitLab CI**: lint → test → build → deploy 파이프라인

## 라이선스

MIT
