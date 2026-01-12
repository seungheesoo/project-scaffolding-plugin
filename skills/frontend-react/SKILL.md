---
name: frontend-react
description: React (Vite) 프론트엔드 프로젝트 구조를 생성합니다. Feature-Sliced Design 아키텍처, shadcn/ui, Tailwind CSS, TypeScript 설정을 포함합니다.
user-invocable: true
---

# frontend-react

React (Vite) 프론트엔드 프로젝트 구조를 생성합니다.

## 역할
- React + Vite 프로젝트 설정
- Feature-Sliced Design (FSD) 아키텍처
- shadcn/ui + Tailwind CSS 설정
- TypeScript 설정

## 생성 파일

```
frontend/
├── src/
│   ├── app/                    # 앱 초기화, 프로바이더, 라우터
│   │   ├── providers/
│   │   ├── router/
│   │   ├── styles/
│   │   │   └── global.css      # Tailwind + CSS 변수
│   │   └── index.tsx
│   ├── pages/                  # 페이지 컴포넌트
│   ├── widgets/                # 독립적 UI 블록
│   ├── features/               # 사용자 기능
│   ├── entities/               # 비즈니스 엔티티
│   └── shared/                 # 공용 모듈
│       ├── api/
│       ├── ui/
│       ├── lib/
│       └── config/
├── public/
├── index.html
├── package.json
├── vite.config.ts
├── tailwind.config.ts
├── postcss.config.mjs
├── tsconfig.json
├── components.json
└── eslint.config.mjs
```

## 템플릿

[template.md](template.md) - React 프로젝트 전체 boilerplate

## 테마 적용

global.css의 CSS 변수는 선택된 테마 skill에서 제공하는 값으로 교체됩니다.

| 테마 | Skill |
|------|-------|
| shadcn/ui Neutral | theme-neutral |
| Lime-Cyan Dark | theme-lime-cyan |

## 사용법

이 skill은 `/scaffold` 명령어에서 Frontend로 "React (Vite)" 선택 시 자동으로 호출됩니다.
