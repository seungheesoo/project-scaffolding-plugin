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

export async function apiClient<T>(
  endpoint: string,
  options?: RequestInit
): Promise<T> {
  const response = await fetch(`${API_BASE_URL}${endpoint}`, {
    headers: {
      'Content-Type': 'application/json',
      ...options?.headers,
    },
    ...options,
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

### frontend/src/shared/styles/global.scss
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
    "config": "tailwind.config.ts",
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

### tailwind.config.ts

파일을 읽고 아래 수정사항을 적용:

**1. 파일 상단에 import 추가:**
```typescript
import tailwindcssAnimate from 'tailwindcss-animate'
```

**2. config 객체에 `darkMode` 추가:**
```typescript
darkMode: ['class'],
```

**3. `content` 배열에 `src` 경로 추가 (기존 항목 유지):**
```typescript
'./src/**/*.{ts,tsx}',
```

**4. `theme.extend`에 `colors` 객체 추가:**
```typescript
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
```

**5. `theme.extend`에 `borderRadius` 객체 추가:**
```typescript
borderRadius: {
  lg: 'var(--radius)',
  md: 'calc(var(--radius) - 2px)',
  sm: 'calc(var(--radius) - 4px)',
},
```

**6. `plugins` 배열에 추가:**
```typescript
plugins: [tailwindcssAnimate],
```

### app/layout.tsx

파일을 읽고 CSS import 문을 찾아서 변경:

```tsx
// 기존 (패턴: './globals.css' 또는 './global.css' 등)
import './globals.css'

// 변경
import '@shared/styles/global.scss'
```
