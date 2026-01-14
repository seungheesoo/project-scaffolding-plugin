# Next.js (App Router) Template

create-next-app 실행 후 생성/수정할 파일들입니다.

---

## 생성 파일

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
const API_BASE_URL = process.env.NEXT_PUBLIC_API_URL || '/api'

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
  const url = new URL(`${API_BASE_URL}${endpoint}`, 'http://localhost')
  if (params) {
    Object.entries(params).forEach(([key, value]) => {
      if (value !== undefined && value !== null) {
        url.searchParams.append(key, String(value))
      }
    })
  }

  const fetchUrl = `${API_BASE_URL}${endpoint}${url.search}`

  const response = await fetch(fetchUrl, {
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

### frontend/src/shared/lib/providers/index.ts
```typescript
export { QueryProvider } from './QueryProvider'
```

### frontend/src/shared/lib/providers/QueryProvider.tsx
```tsx
'use client'

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

### frontend/src/shared/lib/utils.ts
```typescript
import { type ClassValue, clsx } from 'clsx'
import { twMerge } from 'tailwind-merge'

export function cn(...inputs: ClassValue[]) {
  return twMerge(clsx(inputs))
}
```

### frontend/src/shared/styles/global.scss
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

### frontend/app/loading.tsx
```tsx
export default function Loading() {
  return (
    <div className="flex min-h-screen items-center justify-center">
      <div className="text-muted-foreground">Loading...</div>
    </div>
  )
}
```

### frontend/app/error.tsx
```tsx
'use client'

export default function Error({
  error,
  reset,
}: {
  error: Error & { digest?: string }
  reset: () => void
}) {
  return (
    <div className="flex min-h-screen flex-col items-center justify-center gap-4">
      <h2 className="text-2xl font-semibold text-destructive">Something went wrong!</h2>
      <button
        onClick={() => reset()}
        className="rounded-md bg-primary px-4 py-2 text-primary-foreground hover:bg-primary/90"
      >
        Try again
      </button>
    </div>
  )
}
```

### frontend/app/not-found.tsx
```tsx
import Link from 'next/link'

export default function NotFound() {
  return (
    <div className="flex min-h-screen flex-col items-center justify-center gap-4">
      <h2 className="text-2xl font-semibold">Not Found</h2>
      <p className="text-muted-foreground">Could not find requested resource</p>
      <Link
        href="/"
        className="rounded-md bg-primary px-4 py-2 text-primary-foreground hover:bg-primary/90"
      >
        Return Home
      </Link>
    </div>
  )
}
```

### frontend/app/api/health/route.ts
```typescript
import { NextResponse } from 'next/server'

export async function GET() {
  return NextResponse.json({ status: 'ok' })
}
```

### frontend/components.json
```json
{
  "$schema": "https://ui.shadcn.com/schema.json",
  "style": "default",
  "rsc": true,
  "tsx": true,
  "tailwind": {
    "config": "",
    "css": "src/shared/styles/global.scss",
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

### tsconfig.json

파일을 읽고 `compilerOptions.paths` 객체에 아래 항목들을 병합 (기존 paths 유지):

```json
"@widgets/*": ["src/widgets/*"],
"@features/*": ["src/features/*"],
"@entities/*": ["src/entities/*"],
"@shared/*": ["src/shared/*"]
```

### app/layout.tsx

파일을 읽고 아래 수정사항을 적용:

**1. CSS import 문 변경:**
```tsx
// 기존 (패턴: './globals.css' 또는 './global.css' 등)
import './globals.css'

// 변경
import '@shared/styles/global.scss'
```

**2. QueryProvider import 추가:**
```tsx
import { QueryProvider } from '@shared/lib/providers'
```

**3. body 내부를 QueryProvider로 감싸기:**
```tsx
// 기존
<body className={...}>{children}</body>

// 변경
<body className={...}>
  <QueryProvider>{children}</QueryProvider>
</body>
```
