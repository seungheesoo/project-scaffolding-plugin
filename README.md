# Project Scaffolding Plugin

풀스택 프로젝트 구조를 자동 생성하는 Claude Code 플러그인

## 지원 스택

| Frontend | Backend | Infra |
|----------|---------|-------|
| React (Vite) | Node.js (Express) | Docker |
| Next.js | Java (Spring Boot) | GitLab CI |
| | Python (FastAPI) | |

**특징**: FSD 아키텍처, shadcn/ui, 테마 선택, MSW, 병합 모드

## 명령어

```bash
/project-scaffolding:scaffold [project-name]   # 프로젝트 생성
/project-scaffolding:workspace [workspace]     # workspace 선택 (root/frontend/backend)
```

## 생성 구조

```
{project}/
├── .claude/role/       # workspace별 역할 정의
├── frontend/           # FSD: app/pages/widgets/features/entities/shared
├── backend/
├── docker/
├── config/
├── docs/
└── ...
```

## 설치

```bash
claude --plugin-dir ./project-scaffolding-plugin
```
