---
name: theme-neutral
label: "shadcn/ui Neutral"
option-description: "shadcn/ui 기본 테마, 라이트/다크 모드 지원"
description: shadcn/ui Neutral 테마를 적용합니다. 라이트/다크 모드 지원, 무채색 기반 스타일 가이드를 제공합니다.
user-invocable: true
---

# theme-neutral

shadcn/ui Neutral 테마를 적용합니다.

## 역할
- 스타일 가이드 제공 (.claude/style-guide.md)
- CSS 변수는 boilerplate 기본값 사용 (교체 불필요)

## 테마 특징
- **라이트/다크 모드 지원**: CSS 변수로 자동 전환
- **Neutral 톤**: 무채색 기반으로 콘텐츠 강조
- **shadcn/ui 기본 스타일**: 커스터마이징 없이 바로 사용

## 적용 규칙

| 파일 | 동작 |
|------|------|
| `global.scss` | 교체 없음 (boilerplate 기본값 사용) |
| `tailwind.config.ts` | 수정 없음 |
| `.claude/style-guide.md` | [style-guide.md](style-guide.md)의 `## 스타일 가이드` 헤딩부터 파일 끝까지 **복사** |

## 템플릿

[style-guide.md](style-guide.md) - 스타일 가이드 (CSS 변수는 boilerplate 기본값 사용)

## 사용법

`/scaffold` 명령어에서 Theme 선택 시 자동으로 호출됩니다.
