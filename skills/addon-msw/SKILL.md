---
name: addon-msw
description: Mock Service Worker (MSW) 설정을 추가합니다. MSW 핸들러, 브라우저 워커 설정, Entry 파일 수정을 포함합니다.
user-invocable: true
---

# addon-msw

Mock Service Worker (MSW) 설정을 추가합니다.

## 역할
- MSW 핸들러 설정
- 브라우저 워커 설정
- Entry 파일 수정 (main.tsx 또는 layout.tsx)

## 생성 파일

### 공통
- `frontend/src/mocks/handlers.ts`
- `frontend/src/mocks/browser.ts`
- `frontend/src/mocks/index.ts`

### React (Vite)
- `frontend/src/main.tsx` (덮어쓰기)

### Next.js
- `frontend/app/layout.tsx` (덮어쓰기)
- `frontend/app/providers/MSWProvider.tsx`

## MSW 상태

| Backend 선택 | MSW 상태 |
|-------------|---------|
| 사용 안함 | **활성화** (바로 사용 가능) |
| 선택함 | **비활성화** (주석 처리, 필요 시 활성화) |

## 템플릿

[template.md](template.md) - MSW 관련 파일 boilerplate

## 사용법

이 skill은 `/scaffold` 명령어에서 MSW "설정" 선택 시 자동으로 호출됩니다.
Frontend 선택이 필수이며, `frontend/`가 이미 존재하면 호출되지 않습니다.
