---
name: frontend-nextjs
description: Next.js (App Router) 프론트엔드 프로젝트 구조를 생성합니다. Next.js 16, Feature-Sliced Design 아키텍처, shadcn/ui, Tailwind CSS, TypeScript, Biome, React Compiler 설정을 포함합니다.
user-invocable: true
---

# frontend-nextjs

Next.js (App Router) 프론트엔드 프로젝트 구조를 생성합니다.

## 역할
- Next.js 16 + App Router + Turbopack 프로젝트 생성
- Feature-Sliced Design (FSD) 아키텍처 구성
- shadcn/ui + Tailwind CSS 설정
- TypeScript + Biome + React Compiler 설정

## 프로세스

### 1단계: 프로젝트 생성

```bash
npx create-next-app@16 {project}/frontend --app --biome --react-compiler --yes
```

### 2단계: FSD 구조 추가

```bash
mkdir -p {project}/frontend/src/app/providers
mkdir -p {project}/frontend/src/pages/home
mkdir -p {project}/frontend/src/widgets
mkdir -p {project}/frontend/src/features
mkdir -p {project}/frontend/src/entities
mkdir -p {project}/frontend/src/shared/api
mkdir -p {project}/frontend/src/shared/ui
mkdir -p {project}/frontend/src/shared/lib
mkdir -p {project}/frontend/src/shared/styles
mkdir -p {project}/frontend/src/shared/config
```

### 3단계: 파일 생성

[template.md](template.md)의 `## 생성 파일` 섹션을 참고하여 `{project}/frontend/` 내에 아래 파일들을 생성:

**FSD 레이어 파일:**
| 파일 | 설명 |
|------|------|
| `src/app/index.ts` | FSD app 레이어 export |
| `src/app/providers/index.ts` | Provider barrel |
| `src/app/providers/QueryProvider.tsx` | React Query Provider |
| `src/pages/home/index.tsx` | 홈 페이지 컴포넌트 |
| `src/shared/index.ts` | shared 레이어 export |
| `src/shared/api/index.ts` | API export |
| `src/shared/api/client.ts` | API 클라이언트 |
| `src/shared/ui/index.ts` | UI 컴포넌트 export |
| `src/shared/lib/index.ts` | 유틸리티 export |
| `src/shared/lib/utils.ts` | cn 함수 |
| `src/shared/styles/global.scss` | Tailwind + CSS 변수 |

**Next.js App Router 파일:**
| 파일 | 설명 |
|------|------|
| `app/page.tsx` | 재내보내기 (`@pages/home` → default export) |
| `app/loading.tsx` | 로딩 UI (직접 구현) |
| `app/error.tsx` | 에러 UI (직접 구현) |
| `app/not-found.tsx` | 404 페이지 (직접 구현) |
| `app/api/health/route.ts` | 헬스체크 API (직접 구현) |

**설정 파일:**
| 파일 | 설명 |
|------|------|
| `components.json` | shadcn/ui 설정 |

> **Note**: `app/page.tsx`만 재내보내기, 나머지 `app/` 파일들은 직접 구현

### 4단계: 기존 파일 수정

[template.md](template.md)의 `## 수정 지시` 섹션을 참고하여 `{project}/frontend/` 내의 파일들을 수정:

| 파일 | 수정 내용 |
|------|----------|
| `tsconfig.json` | `baseUrl` 추가, `compilerOptions.paths`에 FSD alias 병합 (`@app`, `@pages` 포함) |
| `app/layout.tsx` | CSS import를 `@shared/styles/global.scss`로 변경, QueryProvider 추가 |

### 5단계: 파일 정리

`{project}/frontend/app/` 내 기존 CSS 파일 삭제 (존재하는 경우):

```bash
rm -f {project}/frontend/app/globals.css
rm -f {project}/frontend/app/global.css
```

### 6단계: 의존성 추가

```bash
npm install --prefix {project}/frontend zustand immer @tanstack/react-query clsx tailwind-merge class-variance-authority lucide-react react-hook-form @hookform/resolvers zod
npm install --prefix {project}/frontend -D sass
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

이 skill은 `/scaffold` 명령어에서 Frontend로 "Next.js" 선택 시 자동으로 호출됩니다.
