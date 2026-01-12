---
name: theme-lime-cyan
description: Lime-Cyan Dark 테마를 적용합니다. 다크 테마 전용, Primary 라임 그린(#D6FB64), Secondary 시안(#64D5FB) CSS 변수와 Tailwind 확장 색상을 제공합니다.
user-invocable: true
---

# theme-lime-cyan

Lime-Cyan Dark 테마를 적용합니다.

## 역할
- CSS 변수 제공 (global.css 교체용)
- Tailwind 확장 색상 제공
- 스타일 가이드 제공 (.claude/style-guide.md)

## 테마 특징
- **다크 테마 전용**: 배경 #121212 ~ #1F2126
- **Primary**: 라임 그린 (#D6FB64)
- **Secondary**: 시안 (#64D5FB)
- **그래디언트**: Secondary → Primary (시안 → 라임)

## 적용 방법

### 1. CSS 변수 교체
global.css의 첫 번째 `@layer base` 블록 (`:root` 포함)을 스타일 가이드의 `## CSS 변수` 섹션 내용으로 교체합니다.

### 2. Tailwind 확장 색상
tailwind.config.ts의 `colors` 객체에 `## Tailwind 확장 색상` 섹션 내용을 추가합니다.

### 3. 스타일 가이드 생성
`.claude/style-guide.md` 파일에 `## 스타일 가이드` 섹션부터 파일 끝까지 복사합니다.

## 템플릿

[style-guide.md](style-guide.md) - CSS 변수, Tailwind 확장, 컴포넌트 패턴

## global.css 경로 (프레임워크별)

| Frontend | global.css 경로 |
|----------|----------------|
| React (Vite) | `frontend/src/app/styles/global.css` |
| Next.js | `frontend/src/shared/styles/global.css` |

## 사용법

이 skill은 `/scaffold` 명령어에서 Theme으로 "Lime-Cyan Dark" 선택 시 자동으로 호출됩니다.
