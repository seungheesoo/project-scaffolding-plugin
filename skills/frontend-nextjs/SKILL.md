---
name: frontend-nextjs
description: Next.js (App Router) 프론트엔드 프로젝트 구조를 생성합니다. Next.js 15, Feature-Sliced Design 아키텍처, shadcn/ui, Tailwind CSS, TypeScript 설정을 포함합니다.
user-invocable: true
---

# frontend-nextjs

Next.js (App Router) 프론트엔드 프로젝트 구조를 생성합니다.

## 역할
- Next.js 15 + App Router 프로젝트 설정
- Feature-Sliced Design (FSD) 아키텍처 (app/, pages/ 레이어 제외)
- shadcn/ui + Tailwind CSS 설정
- TypeScript 설정

## 생성 파일

```
frontend/
├── app/                        # App Router (라우팅 + 레이아웃)
│   ├── layout.tsx
│   ├── page.tsx
│   ├── loading.tsx
│   ├── error.tsx
│   ├── not-found.tsx
│   └── api/
│       └── health/route.ts
├── src/
│   ├── widgets/                # 독립적 UI 블록
│   ├── features/               # 사용자 기능
│   ├── entities/               # 비즈니스 엔티티
│   └── shared/                 # 공용 모듈
│       ├── api/
│       ├── ui/
│       ├── lib/
│       ├── styles/
│       │   └── global.scss      # Tailwind + CSS 변수
│       └── config/
├── public/
├── package.json
├── next.config.ts
├── tailwind.config.ts
├── postcss.config.mjs
├── tsconfig.json
└── components.json
```

## 템플릿

[template.md](template.md) - Next.js 프로젝트 전체 boilerplate

## 테마 적용

global.scss의 CSS 변수는 선택된 테마 skill에서 제공하는 값으로 교체됩니다.

| 테마 | Skill |
|------|-------|
| shadcn/ui Neutral | theme-neutral |
| Lime-Cyan Dark | theme-lime-cyan |

## 사용법

이 skill은 `/scaffold` 명령어에서 Frontend로 "Next.js" 선택 시 자동으로 호출됩니다.
