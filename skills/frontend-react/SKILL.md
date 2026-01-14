---
name: frontend-react
description: React (Vite) 프론트엔드 프로젝트 구조를 생성합니다. Feature-Sliced Design 아키텍처, shadcn/ui, Tailwind CSS, TypeScript 설정을 포함합니다.
user-invocable: true
---

# frontend-react

React (Vite) 프론트엔드 프로젝트 구조를 생성합니다.

## 역할
- React 19 + Vite 프로젝트 생성
- Feature-Sliced Design (FSD) 아키텍처 구성
- shadcn/ui + Tailwind CSS 설정
- TypeScript 설정

## 프로세스

### 1단계: 프로젝트 생성

```bash
npm create vite@latest {project}/frontend -- --template react-ts
```

### 2단계: FSD 구조 추가

```bash
mkdir -p {project}/frontend/src/app/providers
mkdir -p {project}/frontend/src/app/router
mkdir -p {project}/frontend/src/app/styles
mkdir -p {project}/frontend/src/pages/home
mkdir -p {project}/frontend/src/widgets
mkdir -p {project}/frontend/src/features
mkdir -p {project}/frontend/src/entities
mkdir -p {project}/frontend/src/shared/api
mkdir -p {project}/frontend/src/shared/ui
mkdir -p {project}/frontend/src/shared/lib
mkdir -p {project}/frontend/src/shared/config
```

### 3단계: 파일 생성

[template.md](template.md)의 `## 생성 파일` 섹션을 참고하여 `{project}/frontend/` 내에 아래 파일들을 생성:

| 파일 | 설명 |
|------|------|
| `src/app/index.tsx` | 앱 루트 컴포넌트 |
| `src/app/providers/index.ts` | Provider barrel |
| `src/app/providers/QueryProvider.tsx` | React Query Provider |
| `src/app/router/index.tsx` | 라우터 설정 |
| `src/app/styles/global.scss` | Tailwind + CSS 변수 |
| `src/pages/home/index.tsx` | 랜딩 페이지 |
| `src/shared/index.ts` | shared 레이어 export |
| `src/shared/api/index.ts` | API export |
| `src/shared/api/client.ts` | API 클라이언트 |
| `src/shared/ui/index.ts` | UI 컴포넌트 export |
| `src/shared/lib/index.ts` | 유틸리티 export |
| `src/shared/lib/utils.ts` | cn 함수 |
| `components.json` | shadcn/ui 설정 |

### 4단계: 기존 파일 수정

[template.md](template.md)의 `## 수정 지시` 섹션을 참고하여 `{project}/frontend/` 내의 파일들을 수정:

| 파일 | 수정 내용 |
|------|----------|
| `vite.config.ts` | Tailwind v4 플러그인 추가, `resolve.alias`에 FSD alias 추가 |
| `tsconfig.json` | `baseUrl` 추가, `compilerOptions.paths`에 FSD alias 병합 |
| `src/main.tsx` | App import 경로를 `@app/index`로 변경 |
| `index.html` | lang 속성을 `ko`로 변경 |

### 5단계: 파일 정리

`{project}/frontend/src/` 내 Vite 기본 파일 삭제 (존재하는 경우):

```bash
rm -f {project}/frontend/src/App.tsx
rm -f {project}/frontend/src/App.css
rm -f {project}/frontend/src/index.css
```

### 6단계: 의존성 추가

```bash
npm install --prefix {project}/frontend react-router-dom zustand immer @tanstack/react-query clsx tailwind-merge class-variance-authority lucide-react react-hook-form @hookform/resolvers zod
npm install --prefix {project}/frontend -D @tailwindcss/vite sass
```

## 템플릿

[template.md](template.md) - 생성할 파일 내용 및 수정 지시

## 테마 적용

global.scss의 CSS 변수는 선택된 테마 skill에서 제공하는 값으로 교체됩니다.

| 테마 | Skill |
|------|-------|
| shadcn/ui Neutral | theme-neutral |
| Lime-Cyan Dark | theme-lime-cyan |

## 사용법

이 skill은 `/scaffold` 명령어에서 Frontend로 "React (Vite)" 선택 시 자동으로 호출됩니다.
