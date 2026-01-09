# MSW Boilerplate

Mock Service Worker 설정 파일입니다.

## 디렉토리 구조

**React (Vite)**:
```
frontend/src/mocks/
├── handlers.ts     # API 핸들러 정의
├── browser.ts      # 브라우저 워커 설정
└── index.ts        # 초기화 함수
```

**Next.js**:
```
frontend/src/mocks/
├── handlers.ts     # API 핸들러 정의
├── browser.ts      # 브라우저 워커 설정
└── index.ts        # 초기화 함수
```

---

## frontend/src/mocks/handlers.ts
```typescript
import { http, HttpResponse } from 'msw'

export const handlers = [
  // 예시: GET /api/health
  http.get('/api/health', () => {
    return HttpResponse.json({ status: 'ok' })
  }),

  // 예시: GET /api/users
  http.get('/api/users', () => {
    return HttpResponse.json([
      { id: 1, name: 'John Doe', email: 'john@example.com' },
      { id: 2, name: 'Jane Doe', email: 'jane@example.com' },
    ])
  }),

  // 예시: POST /api/users
  http.post('/api/users', async ({ request }) => {
    const body = await request.json()
    return HttpResponse.json(
      { id: Date.now(), ...body },
      { status: 201 }
    )
  }),
]
```

## frontend/src/mocks/browser.ts
```typescript
import { setupWorker } from 'msw/browser'
import { handlers } from './handlers'

export const worker = setupWorker(...handlers)
```

## frontend/src/mocks/index.ts
```typescript
export async function initMocks() {
  if (import.meta.env.DEV) {
    const { worker } = await import('./browser')
    await worker.start({
      onUnhandledRequest: 'bypass',
    })
  }
}
```

## frontend/src/mocks/index.ts (disabled)
```typescript
// MSW가 비활성화된 상태입니다.
// Backend 없이 개발 시 아래 주석을 해제하세요.

export async function initMocks() {
  // if (import.meta.env.DEV) {
  //   const { worker } = await import('./browser')
  //   await worker.start({
  //     onUnhandledRequest: 'bypass',
  //   })
  // }
}
```

---

## frontend/src/mocks/index.ts (Next.js)
```typescript
export async function initMocks() {
  if (process.env.NODE_ENV === 'development') {
    const { worker } = await import('./browser')
    await worker.start({
      onUnhandledRequest: 'bypass',
    })
  }
}
```

## frontend/src/mocks/index.ts (Next.js, disabled)
```typescript
// MSW가 비활성화된 상태입니다.
// Backend 없이 개발 시 아래 주석을 해제하세요.

export async function initMocks() {
  // if (process.env.NODE_ENV === 'development') {
  //   const { worker } = await import('./browser')
  //   await worker.start({
  //     onUnhandledRequest: 'bypass',
  //   })
  // }
}
```

