---
name: theme-neutral
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

## 적용 방법

### 1. CSS 변수
이 테마는 별도 CSS 변수를 제공하지 않습니다. boilerplate의 기본 shadcn/ui 스타일을 그대로 사용합니다.

### 2. 스타일 가이드 생성
`.claude/style-guide.md` 파일에 `## 스타일 가이드` 섹션부터 파일 끝까지 복사합니다.

## 템플릿

[style-guide.md](style-guide.md) - 컴포넌트 패턴, 디자인 가이드

## 사용법

이 skill은 `/scaffold` 명령어에서 Theme으로 "shadcn/ui Neutral" 선택 시 자동으로 호출됩니다.
