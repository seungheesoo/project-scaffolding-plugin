# React (Vite) Template

`npm create vite@latest` 실행 후 생성/수정할 파일들입니다.

---

## 생성 파일

### frontend/src/app/index.tsx
```tsx
import { StrictMode } from 'react'
import { RouterProvider } from 'react-router-dom'
import { QueryProvider } from './providers'
import { router } from './router'
import './styles/global.scss'

export function App() {
  return (
    <StrictMode>
      <QueryProvider>
        <RouterProvider router={router} />
      </QueryProvider>
    </StrictMode>
  )
}
```

### frontend/src/app/providers/index.ts
```typescript
export { QueryProvider } from './QueryProvider'
```

### frontend/src/app/providers/QueryProvider.tsx
```tsx
import {
  QueryClient,
  QueryClientProvider,
  QueryCache,
  MutationCache,
} from '@tanstack/react-query'
import { ReactNode, useState } from 'react'

export function QueryProvider({ children }: { children: ReactNode }) {
  const [queryClient] = useState(
    () =>
      new QueryClient({
        queryCache: new QueryCache({
          onError: (error, query) => {
            console.error('[Query Error]', {
              queryKey: query.queryKey,
              error: error.message,
            })
          },
        }),
        mutationCache: new MutationCache({
          onError: (error, variables, context, mutation) => {
            console.error('[Mutation Error]', {
              mutationKey: mutation.options.mutationKey,
              variables,
              error: error.message,
            })
          },
        }),
        defaultOptions: {
          queries: {
            staleTime: 60 * 1000,
            retry: 1,
          },
        },
      })
  )

  return (
    <QueryClientProvider client={queryClient}>{children}</QueryClientProvider>
  )
}
```

### frontend/src/app/router/index.tsx
```tsx
import { createBrowserRouter } from 'react-router-dom'
import { HomePage } from '@pages/home'

export const router = createBrowserRouter([
  {
    path: '/',
    element: <HomePage />,
  },
])
```

### frontend/src/app/styles/global.scss
```scss
@import "tailwindcss";

@theme {
  --color-background: hsl(0 0% 100%);
  --color-foreground: hsl(0 0% 3.9%);
  --color-card: hsl(0 0% 100%);
  --color-card-foreground: hsl(0 0% 3.9%);
  --color-popover: hsl(0 0% 100%);
  --color-popover-foreground: hsl(0 0% 3.9%);
  --color-primary: hsl(0 0% 9%);
  --color-primary-foreground: hsl(0 0% 98%);
  --color-secondary: hsl(0 0% 96.1%);
  --color-secondary-foreground: hsl(0 0% 9%);
  --color-muted: hsl(0 0% 96.1%);
  --color-muted-foreground: hsl(0 0% 45.1%);
  --color-accent: hsl(0 0% 96.1%);
  --color-accent-foreground: hsl(0 0% 9%);
  --color-destructive: hsl(0 84.2% 60.2%);
  --color-destructive-foreground: hsl(0 0% 98%);
  --color-border: hsl(0 0% 89.8%);
  --color-input: hsl(0 0% 89.8%);
  --color-ring: hsl(0 0% 3.9%);
  --radius: 0.5rem;
  --radius-lg: var(--radius);
  --radius-md: calc(var(--radius) - 2px);
  --radius-sm: calc(var(--radius) - 4px);
}

.dark {
  --color-background: hsl(0 0% 3.9%);
  --color-foreground: hsl(0 0% 98%);
  --color-card: hsl(0 0% 3.9%);
  --color-card-foreground: hsl(0 0% 98%);
  --color-popover: hsl(0 0% 3.9%);
  --color-popover-foreground: hsl(0 0% 98%);
  --color-primary: hsl(0 0% 98%);
  --color-primary-foreground: hsl(0 0% 9%);
  --color-secondary: hsl(0 0% 14.9%);
  --color-secondary-foreground: hsl(0 0% 98%);
  --color-muted: hsl(0 0% 14.9%);
  --color-muted-foreground: hsl(0 0% 63.9%);
  --color-accent: hsl(0 0% 14.9%);
  --color-accent-foreground: hsl(0 0% 98%);
  --color-destructive: hsl(0 62.8% 30.6%);
  --color-destructive-foreground: hsl(0 0% 98%);
  --color-border: hsl(0 0% 14.9%);
  --color-input: hsl(0 0% 14.9%);
  --color-ring: hsl(0 0% 83.1%);
}

* {
  border-color: var(--color-border);
}

body {
  background-color: var(--color-background);
  color: var(--color-foreground);
  font-feature-settings: "rlig" 1, "calt" 1;
}
```

### frontend/src/pages/home/index.tsx
```tsx
export function HomePage() {
  return (
    <div className="flex min-h-screen items-center justify-center">
      <h1 className="text-4xl font-bold">Hello, World!</h1>
    </div>
  )
}
```

### frontend/src/shared/index.ts
```typescript
// API
export { apiClient } from './api'

// UI 컴포넌트
export * from './ui'

// 유틸리티
export * from './lib'
```

### frontend/src/shared/api/index.ts
```typescript
export { apiClient } from './client'
```

### frontend/src/shared/api/client.ts
```typescript
const API_BASE_URL = import.meta.env.VITE_API_URL || '/api'

interface ApiClientOptions extends Omit<RequestInit, 'body'> {
  params?: Record<string, unknown>
  body?: unknown
}

export async function apiClient<T>(
  endpoint: string,
  options?: ApiClientOptions
): Promise<T> {
  const { params, body, ...fetchOptions } = options ?? {}

  // Query string 생성
  const url = new URL(`${API_BASE_URL}${endpoint}`, window.location.origin)
  if (params) {
    Object.entries(params).forEach(([key, value]) => {
      if (value !== undefined && value !== null) {
        url.searchParams.append(key, String(value))
      }
    })
  }

  const response = await fetch(url.toString(), {
    headers: {
      'Content-Type': 'application/json',
      ...fetchOptions.headers,
    },
    body: body ? JSON.stringify(body) : undefined,
    ...fetchOptions,
  })

  if (!response.ok) {
    throw new Error(`API Error: ${response.status}`)
  }

  return response.json()
}
```

### frontend/src/shared/ui/index.ts
```typescript
// 공용 UI 컴포넌트 export
// export { Button } from './Button'
// export { Input } from './Input'
```

### frontend/src/shared/lib/index.ts
```typescript
export { cn } from './utils'
```

### frontend/src/shared/lib/utils.ts
```typescript
import { type ClassValue, clsx } from 'clsx'
import { twMerge } from 'tailwind-merge'

export function cn(...inputs: ClassValue[]) {
  return twMerge(clsx(inputs))
}
```

### frontend/components.json
```json
{
  "$schema": "https://ui.shadcn.com/schema.json",
  "style": "default",
  "rsc": false,
  "tsx": true,
  "tailwind": {
    "config": "",
    "css": "src/app/styles/global.scss",
    "baseColor": "neutral",
    "cssVariables": true
  },
  "aliases": {
    "components": "@shared/ui",
    "utils": "@shared/lib/utils",
    "ui": "@shared/ui",
    "lib": "@shared/lib",
    "hooks": "@shared/lib/hooks"
  },
  "iconLibrary": "lucide"
}
```

---

## 수정 지시

파일을 읽고, 아래 지시에 따라 수정합니다. 경로는 `{project}/frontend/` 기준입니다.

### vite.config.ts

파일을 읽고 아래 수정사항을 적용:

**1. Tailwind v4 플러그인 import 추가:**
```typescript
import tailwindcss from '@tailwindcss/vite'
```

**2. plugins 배열에 Tailwind 추가 (기존 react() 유지):**
```typescript
plugins: [react(), tailwindcss()],
```

**3. resolve.alias 객체 추가:**
```typescript
import path from 'path'

resolve: {
  alias: {
    '@': path.resolve(__dirname, './src'),
    '@app': path.resolve(__dirname, './src/app'),
    '@pages': path.resolve(__dirname, './src/pages'),
    '@widgets': path.resolve(__dirname, './src/widgets'),
    '@features': path.resolve(__dirname, './src/features'),
    '@entities': path.resolve(__dirname, './src/entities'),
    '@shared': path.resolve(__dirname, './src/shared'),
  },
},
```

선택적으로 `server.proxy` 추가 (Backend 연동 시):

```typescript
server: {
  port: 5173,
  proxy: {
    '/api': {
      target: 'http://localhost:3000',
      changeOrigin: true,
    },
  },
},
```

### tsconfig.json

파일을 읽고 `compilerOptions`에 아래 항목들을 추가/병합:

**1. `baseUrl` 추가:**
```json
"baseUrl": ".",
```

**2. `paths` 객체 추가:**
```json
"paths": {
  "@/*": ["src/*"],
  "@app/*": ["src/app/*"],
  "@pages/*": ["src/pages/*"],
  "@widgets/*": ["src/widgets/*"],
  "@features/*": ["src/features/*"],
  "@entities/*": ["src/entities/*"],
  "@shared/*": ["src/shared/*"]
}
```

### src/main.tsx

파일을 읽고 import 및 render 부분을 변경:

```tsx
// 기존 (Vite 기본 생성)
import { StrictMode } from 'react'
import { createRoot } from 'react-dom/client'
import App from './App.tsx'
import './index.css'

createRoot(document.getElementById('root')!).render(
  <StrictMode>
    <App />
  </StrictMode>,
)

// 변경
import { createRoot } from 'react-dom/client'
import { App } from '@app/index'

createRoot(document.getElementById('root')!).render(<App />)
```

### index.html

파일을 읽고 `<html>` 태그의 lang 속성 변경:

```html
// 기존
<html lang="en">

// 변경
<html lang="ko">
```
