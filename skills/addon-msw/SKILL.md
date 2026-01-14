---
name: addon-msw
description: Mock Service Worker (MSW) 설정을 추가합니다. MSW 핸들러, 브라우저 워커 설정, Entry 파일 수정을 포함하며, 주석 처리된 상태로 생성됩니다.
user-invocable: true
---

# addon-msw

Mock Service Worker (MSW) 설정을 추가합니다. 주석 처리된 상태로 생성됩니다.

## 프로세스

### 1단계: 의존성 추가

```bash
npm install --prefix {project}/frontend msw --save-dev
```

### 2단계: 파일 생성

[template.md](template.md) 참고하여 파일 생성:

**공통:**
- `frontend/src/mocks/handlers.ts`
- `frontend/src/mocks/browser.ts`
- `frontend/src/mocks/index.ts` (React/Next.js 버전 구분)

**React (Vite):**
- `frontend/src/main.tsx` (덮어쓰기)

**Next.js:**
- `frontend/app/layout.tsx` (덮어쓰기)
- `frontend/src/shared/lib/providers/index.ts` (덮어쓰기)
- `frontend/src/shared/lib/providers/MSWProvider.tsx`

### 3단계: MSW 초기화 안내

파일 생성 완료 후 사용자에게 안내:

```
MSW 설정이 완료되었습니다.
사용하려면 아래 명령어를 실행하세요:

npx msw init public --save

그 후 layout.tsx (또는 main.tsx)에서 MSWProvider 주석을 해제하세요.
```

## 사용법

이 skill은 `/scaffold` 명령어에서 MSW "설정" 선택 시 자동으로 호출됩니다.
