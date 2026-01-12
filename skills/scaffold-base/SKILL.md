---
name: scaffold-base
description: 프로젝트 스캐폴딩의 기본 파일을 생성합니다. 공통 설정 파일(config, .gitignore, README), role 파일(.claude/role/), CLAUDE.md를 생성할 때 사용합니다.
user-invocable: true
---

# scaffold-base

프로젝트 스캐폴딩의 기본 파일을 생성합니다.

## 역할
- 공통 설정 파일 생성 (config, .gitignore, README 등)
- role 파일 생성 (.claude/role/)
- CLAUDE.md 생성

## 생성 파일

### 항상 생성
- `config/.env.example`
- `.gitignore`
- `README.md`
- `docs/README.md`
- `CLAUDE.md`
- `.claude/role/root.md`

### 조건부 생성
- `.claude/role/frontend.md` - Frontend 선택 또는 `frontend/` 존재 시
- `.claude/role/backend.md` - Backend 선택 또는 `backend/` 존재 시

## 템플릿

- [common.md](common.md) - config, .gitignore, README 등 공통 파일
- [roles/root.md](roles/root.md) - .claude/role/root.md 내용
- [roles/frontend.md](roles/frontend.md) - .claude/role/frontend.md 내용
- [roles/backend.md](roles/backend.md) - .claude/role/backend.md 내용

## 치환 규칙

| Placeholder | 치환 값 |
|-------------|--------|
| `{project}` | 프로젝트명 (kebab-case) |
| `{project-pascal}` | 프로젝트명 (PascalCase) |

## 사용법

이 skill은 `/scaffold` 명령어에서 자동으로 호출됩니다.
