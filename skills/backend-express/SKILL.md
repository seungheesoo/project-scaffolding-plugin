---
name: backend-express
description: Node.js (Express + TypeScript) 백엔드 프로젝트 구조를 생성합니다. 레이어드 아키텍처(Controller, Service, Repository), ESLint, Jest 설정을 포함합니다.
user-invocable: true
---

# backend-express

Node.js (Express + TypeScript) 백엔드 프로젝트 구조를 생성합니다.

## 역할
- Express + TypeScript 프로젝트 설정
- 레이어드 아키텍처 (Controller → Service → Repository)
- ESLint, Jest 설정

## 생성 파일

```
backend/
├── src/
│   ├── controllers/
│   ├── services/
│   ├── repositories/
│   ├── middlewares/
│   ├── utils/
│   ├── types/
│   └── index.ts
├── package.json
├── tsconfig.json
└── eslint.config.mjs
```

## 템플릿

[template.md](template.md) - Express 프로젝트 전체 boilerplate

## 사용법

이 skill은 `/scaffold` 명령어에서 Backend로 "Node.js (Express)" 선택 시 자동으로 호출됩니다.
