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
@tailwind base;
@tailwind components;
@tailwind utilities;

@layer base {
  :root {
    --background: 0 0% 100%;
    --foreground: 0 0% 3.9%;
    --card: 0 0% 100%;
    --card-foreground: 0 0% 3.9%;
    --popover: 0 0% 100%;
    --popover-foreground: 0 0% 3.9%;
    --primary: 0 0% 9%;
    --primary-foreground: 0 0% 98%;
    --secondary: 0 0% 96.1%;
    --secondary-foreground: 0 0% 9%;
    --muted: 0 0% 96.1%;
    --muted-foreground: 0 0% 45.1%;
    --accent: 0 0% 96.1%;
    --accent-foreground: 0 0% 9%;
    --destructive: 0 84.2% 60.2%;
    --destructive-foreground: 0 0% 98%;
    --border: 0 0% 89.8%;
    --input: 0 0% 89.8%;
    --ring: 0 0% 3.9%;
    --radius: 0.5rem;
  }

  .dark {
    --background: 0 0% 3.9%;
    --foreground: 0 0% 98%;
    --card: 0 0% 3.9%;
    --card-foreground: 0 0% 98%;
    --popover: 0 0% 3.9%;
    --popover-foreground: 0 0% 98%;
    --primary: 0 0% 98%;
    --primary-foreground: 0 0% 9%;
    --secondary: 0 0% 14.9%;
    --secondary-foreground: 0 0% 98%;
    --muted: 0 0% 14.9%;
    --muted-foreground: 0 0% 63.9%;
    --accent: 0 0% 14.9%;
    --accent-foreground: 0 0% 98%;
    --destructive: 0 62.8% 30.6%;
    --destructive-foreground: 0 0% 98%;
    --border: 0 0% 14.9%;
    --input: 0 0% 14.9%;
    --ring: 0 0% 83.1%;
  }
}

@layer base {
  * {
    @apply border-border;
  }
  body {
    @apply bg-background text-foreground;
    font-feature-settings: "rlig" 1, "calt" 1;
  }
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

### frontend/tailwind.config.ts
```typescript
import type { Config } from 'tailwindcss'
import tailwindcssAnimate from 'tailwindcss-animate'

const config: Config = {
  darkMode: ['class'],
  content: ['./index.html', './src/**/*.{ts,tsx}'],
  theme: {
    extend: {
      colors: {
        background: 'hsl(var(--background))',
        foreground: 'hsl(var(--foreground))',
        card: {
          DEFAULT: 'hsl(var(--card))',
          foreground: 'hsl(var(--card-foreground))',
        },
        popover: {
          DEFAULT: 'hsl(var(--popover))',
          foreground: 'hsl(var(--popover-foreground))',
        },
        primary: {
          DEFAULT: 'hsl(var(--primary))',
          foreground: 'hsl(var(--primary-foreground))',
        },
        secondary: {
          DEFAULT: 'hsl(var(--secondary))',
          foreground: 'hsl(var(--secondary-foreground))',
        },
        muted: {
          DEFAULT: 'hsl(var(--muted))',
          foreground: 'hsl(var(--muted-foreground))',
        },
        accent: {
          DEFAULT: 'hsl(var(--accent))',
          foreground: 'hsl(var(--accent-foreground))',
        },
        destructive: {
          DEFAULT: 'hsl(var(--destructive))',
          foreground: 'hsl(var(--destructive-foreground))',
        },
        border: 'hsl(var(--border))',
        input: 'hsl(var(--input))',
        ring: 'hsl(var(--ring))',
      },
      borderRadius: {
        lg: 'var(--radius)',
        md: 'calc(var(--radius) - 2px)',
        sm: 'calc(var(--radius) - 4px)',
      },
    },
  },
  plugins: [tailwindcssAnimate],
}

export default config
```

### frontend/postcss.config.mjs
```javascript
const config = {
  plugins: {
    tailwindcss: {},
    autoprefixer: {},
  },
}

export default config
```

### frontend/components.json
```json
{
  "$schema": "https://ui.shadcn.com/schema.json",
  "style": "default",
  "rsc": false,
  "tsx": true,
  "tailwind": {
    "config": "tailwind.config.ts",
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

파일을 읽고 `resolve.alias` 객체를 추가 (기존 plugins 유지):

```typescript
import path from 'path'

// defineConfig 내부에 추가:
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
