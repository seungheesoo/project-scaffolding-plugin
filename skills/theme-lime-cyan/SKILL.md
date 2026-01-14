---
name: theme-lime-cyan
label: "Lime-Cyan Dark"
option-description: "라임-시안 그래디언트, 다크 모드 전용"
description: Lime-Cyan Dark 테마를 적용합니다. 다크 테마 전용, Primary 라임 그린(#D6FB64), Secondary 시안(#64D5FB) CSS 변수와 Tailwind 확장 색상을 제공합니다.
user-invocable: true
---

# theme-lime-cyan

Lime-Cyan Dark 테마를 적용합니다.

## 역할
- CSS 변수 제공 (global.scss 교체용)
- Tailwind 확장 색상 제공
- 스타일 가이드 제공 (.claude/style-guide.md)

## 테마 특징
- **다크 테마 전용**: 배경 #121212 ~ #1F2126
- **Primary**: 라임 그린 (#D6FB64)
- **Secondary**: 시안 (#64D5FB)
- **그래디언트**: Secondary → Primary (시안 → 라임)

## 적용 규칙

| 파일 | 동작 |
|------|------|
| `global.scss` | [style-guide.md](style-guide.md)의 `## CSS 변수 (global.scss 전체)` 내용으로 **전체 교체** |
| `.claude/style-guide.md` | `## 스타일 가이드` 헤딩부터 파일 끝까지 **복사** |

> **Note**: Tailwind v4에서는 `@theme` 지시어에 정의된 `--color-*` 변수가 자동으로 유틸리티 클래스로 변환됩니다. `tailwind.config.ts` 수정이 필요 없습니다.

**global.scss 경로**:
| Frontend | 경로 |
|----------|------|
| React (Vite) | `frontend/src/app/styles/global.scss` |
| Next.js | `frontend/src/shared/styles/global.scss` |

## 템플릿

[style-guide.md](style-guide.md) - CSS 변수, Tailwind 확장 색상, 스타일 가이드

## 사용법

`/scaffold` 명령어에서 Theme 선택 시 자동으로 호출됩니다.
