# Frontend Workspace

## 역할
- UI 컴포넌트 개발
- 페이지 및 라우팅 구현
- 상태 관리 및 API 연동
- 스타일링 및 반응형 처리

## 아키텍처: Feature-Sliced Design (FSD)

### 레이어 구조

**React (Vite)** - 전체 FSD 레이어 사용:
```
src/
├── app/        # 앱 초기화, 프로바이더, 라우터
├── pages/      # 페이지 컴포넌트 (라우트 단위)
├── widgets/    # 독립적 UI 블록 (Header, Sidebar 등)
├── features/   # 사용자 액션 (auth, comment, cart 등)
├── entities/   # 비즈니스 엔티티 (user, product, order)
└── shared/     # 공용 유틸, UI 키트, API 클라이언트
```

**Next.js (App Router)** - `app/`, `pages/` 레이어 제외 (App Router가 담당):
```
app/            # Next.js App Router (라우팅, 레이아웃, 페이지)
src/
├── widgets/    # 독립적 UI 블록
├── features/   # 사용자 액션
├── entities/   # 비즈니스 엔티티
└── shared/     # 공용 모듈
```

### 의존성 규칙
- **단방향 의존성**: 상위 레이어만 하위 레이어 import 가능
- React: app → pages → widgets → features → entities → shared
- Next.js: app/ → widgets → features → entities → shared
- 같은 레이어 간 import 금지 (features끼리 서로 참조 X)

### 슬라이스 내부 구조
각 슬라이스(기능/엔티티)는 세그먼트로 분리:
```
features/auth/
├── ui/         # 컴포넌트
├── model/      # 상태, 스토어, 타입
├── api/        # API 호출
├── lib/        # 유틸리티
└── index.ts    # Public API (외부 노출용)
```

### Barrel 파일 (Public API)
모든 모듈은 `index.ts` barrel 파일을 통해 export:

**슬라이스 barrel** (`features/auth/index.ts`):
```typescript
// UI 컴포넌트
export { LoginForm } from './ui/LoginForm'
export { SignupForm } from './ui/SignupForm'

// 모델 (상태, 타입)
export { useAuthStore } from './model/store'
export type { User, AuthState } from './model/types'

// API
export { login, logout } from './api/auth'
```

**세그먼트 barrel** (`features/auth/ui/index.ts`):
```typescript
export { LoginForm } from './LoginForm'
export { SignupForm } from './SignupForm'
```

**import 규칙**:
```typescript
// Good - barrel 파일에서 import
import { LoginForm, useAuthStore } from '@features/auth'

// Bad - 내부 파일 직접 import
import { LoginForm } from '@features/auth/ui/LoginForm'
```

**주의**: 순환 참조 방지를 위해 같은 슬라이스 내에서는 상대 경로 사용

## 코드 컨벤션

### 공통 (TypeScript 필수)
- 언어: TypeScript (strict 모드)
- 포맷터: Prettier
- 린터: ESLint

### 경로 Alias 규칙
내부 모듈 import 시 반드시 경로 alias 사용:

**공통 Alias (React + Next.js)**:
| Alias | 경로 | 용도 |
|-------|------|------|
| `@shared` | `src/shared` | 공용 모듈 |
| `@entities` | `src/entities` | 비즈니스 엔티티 |
| `@features` | `src/features` | 사용자 기능 |
| `@widgets` | `src/widgets` | 독립 UI 블록 |

**React (Vite) 전용**:
| Alias | 경로 | 용도 |
|-------|------|------|
| `@pages` | `src/pages` | 페이지 컴포넌트 |
| `@app` | `src/app` | 앱 초기화, 라우터 |

**Next.js (App Router)**: `@pages`, `@app` 사용 안함 - `app/` 디렉토리가 라우팅 담당

```typescript
// Good - alias 사용
import { Button } from '@shared/ui'
import { useUser } from '@entities/user'

// Bad - 상대 경로로 다른 레이어 접근
import { Button } from '../../shared/ui'
import { useUser } from '../../../entities/user'
```

**예외**: 같은 슬라이스 내부에서는 상대 경로 사용 (순환 참조 방지)

### Import 순서
파일 상단의 import문은 아래 순서로 그룹화하고, 그룹 사이에 빈 줄 삽입:

1. **프레임워크**: `react`, `next`, `next/*` 등 프레임워크 core 모듈
2. **외부 라이브러리**: `react-router-dom`, `zod`, `@tanstack/*` 등 node_modules
3. **내부 모듈 (FSD 레이어 순서: 하위 → 상위, alias 사용)**:
   - `@shared/*` - 공용 레이어
   - `@entities/*` - 엔티티 레이어
   - `@features/*` - 기능 레이어
   - `@widgets/*` - 위젯 레이어
   - `@pages/*` - 페이지 레이어
   - `@app/*` - 앱 레이어
4. **상대 경로**: `./`, `../` 같은 슬라이스 내부 모듈
5. **스타일**: `.css`, `.scss`, `.module.css` 파일

```typescript
// 1. 프레임워크
import { useState, useEffect } from 'react'

// 2. 외부 라이브러리
import { useForm } from 'react-hook-form'
import { z } from 'zod'

// 3. 내부 모듈 (alias 사용, FSD 레이어 순서: shared → app)
import { Button, Input } from '@shared/ui'
import { apiClient } from '@shared/api'
import { useUser } from '@entities/user'
import { LoginForm } from '@features/auth'
import { Header } from '@widgets/header'
import { router } from '@app/router'

// 4. 상대 경로 (같은 슬라이스 내부만 허용)
import { useLocalState } from './model/store'
import type { Props } from './types'

// 5. 스타일
import styles from './Component.module.css'
```

### 네이밍
- 컴포넌트: PascalCase (예: `UserProfile.tsx`)
- 훅/유틸: camelCase (예: `useAuth.ts`, `formatDate.ts`)
- 상수: UPPER_SNAKE_CASE (예: `API_BASE_URL`)
- 타입/인터페이스: PascalCase + 접미어 (예: `UserResponse`, `AuthState`)
- 폴더: kebab-case 또는 camelCase (프로젝트 내 일관성 유지)

### 컴포넌트 구조
- 한 파일 = 한 컴포넌트 (예외: 작은 서브 컴포넌트)
- Props 타입 정의 필수 (`interface Props {}`)
- named export 사용 (`export function Component()`) - barrel 파일 호환

### 상태 관리
- 로컬 상태: useState
- 전역 상태: Zustand
- 서버 상태: React Query

#### Zustand 스토어 (클라이언트 상태)

스토어 위치: 각 feature/entity의 `model/store.ts`

```typescript
// features/auth/model/store.ts
import { create } from 'zustand'
import { devtools } from 'zustand/middleware'
import { immer } from 'zustand/middleware/immer'
import type { User } from './types'

interface AuthState {
  user: User | null
  isAuthenticated: boolean
  setUser: (user: User | null) => void
  logout: () => void
}

export const useAuthStore = create<AuthState>()(
  devtools(
    immer((set) => ({
      user: null,
      isAuthenticated: false,
      setUser: (user) =>
        set((state) => {
          state.user = user
          state.isAuthenticated = !!user
        }),
      logout: () =>
        set((state) => {
          state.user = null
          state.isAuthenticated = false
        }),
    }))
  )
)
```

```typescript
// features/cart/model/store.ts
import { create } from 'zustand'
import { devtools } from 'zustand/middleware'
import { immer } from 'zustand/middleware/immer'
import type { CartItem } from './types'

interface CartState {
  items: CartItem[]
  addItem: (item: CartItem) => void
  removeItem: (id: string) => void
  updateQuantity: (id: string, quantity: number) => void
  clearCart: () => void
  totalPrice: () => number
}

export const useCartStore = create<CartState>()(
  devtools(
    immer((set, get) => ({
      items: [],
      addItem: (item) =>
        set((state) => {
          const existing = state.items.find((i) => i.id === item.id)
          if (existing) {
            existing.quantity += 1
          } else {
            state.items.push({ ...item, quantity: 1 })
          }
        }),
      removeItem: (id) =>
        set((state) => {
          const index = state.items.findIndex((i) => i.id === id)
          if (index !== -1) state.items.splice(index, 1)
        }),
      updateQuantity: (id, quantity) =>
        set((state) => {
          const item = state.items.find((i) => i.id === id)
          if (item) item.quantity = quantity
        }),
      clearCart: () =>
        set((state) => {
          state.items = []
        }),
      totalPrice: () =>
        get().items.reduce((sum, item) => sum + item.price * item.quantity, 0),
    }))
  )
)
```

#### React Query (서버 상태)

쿼리/뮤테이션 위치: 각 feature/entity의 `api/` 세그먼트

**타입 정의** (`model/types.ts`):
```typescript
// entities/user/model/types.ts
export interface User {
  id: string
  name: string
  email: string
  createdAt: string
}

export interface UserFilters {
  search?: string
  role?: string
  page?: number
  limit?: number
}

export interface PaginatedResponse<T> {
  data: T[]
  meta: {
    total: number
    page: number
    limit: number
    totalPages: number
  }
}

export type CreateUserInput = Pick<User, 'name' | 'email'>
export type UpdateUserInput = Partial<CreateUserInput>
```

**Query Key 팩토리 패턴** (`api/keys.ts`):
```typescript
// entities/user/api/keys.ts
import type { UserFilters } from '../model/types'

export const userKeys = {
  all: ['users'] as const,
  lists: () => [...userKeys.all, 'list'] as const,
  list: (filters?: UserFilters) => [...userKeys.lists(), filters] as const,
  details: () => [...userKeys.all, 'detail'] as const,
  detail: (id: string) => [...userKeys.details(), id] as const,
}
```

**쿼리 훅** (`api/queries.ts`):
```typescript
// entities/user/api/queries.ts
import { useQuery, useInfiniteQuery } from '@tanstack/react-query'
import { apiClient } from '@shared/api'
import { userKeys } from './keys'
import type { User, UserFilters, PaginatedResponse } from '../model/types'

export function useUsersQuery(filters?: UserFilters) {
  return useQuery({
    queryKey: userKeys.list(filters),
    queryFn: () =>
      apiClient<PaginatedResponse<User>>('/users', {
        params: filters,
      }),
  })
}

export function useUserQuery(id: string) {
  return useQuery({
    queryKey: userKeys.detail(id),
    queryFn: () => apiClient<User>(`/users/${id}`),
    enabled: !!id,
  })
}

// 무한 스크롤
export function useUsersInfiniteQuery(filters?: Omit<UserFilters, 'page'>) {
  return useInfiniteQuery({
    queryKey: userKeys.list(filters),
    queryFn: ({ pageParam = 1 }) =>
      apiClient<PaginatedResponse<User>>('/users', {
        params: { ...filters, page: pageParam },
      }),
    initialPageParam: 1,
    getNextPageParam: (lastPage) =>
      lastPage.meta.page < lastPage.meta.totalPages
        ? lastPage.meta.page + 1
        : undefined,
  })
}
```

**뮤테이션 훅** (`api/mutations.ts`):
```typescript
// entities/user/api/mutations.ts
import { useMutation, useQueryClient } from '@tanstack/react-query'
import { apiClient } from '@shared/api'
import { userKeys } from './keys'
import type { User, CreateUserInput, UpdateUserInput } from '../model/types'

export function useCreateUserMutation() {
  const queryClient = useQueryClient()

  return useMutation({
    mutationFn: (data: CreateUserInput) =>
      apiClient<User>('/users', {
        method: 'POST',
        body: data,
      }),
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: userKeys.lists() })
    },
  })
}

export function useUpdateUserMutation() {
  const queryClient = useQueryClient()

  return useMutation({
    mutationFn: ({ id, data }: { id: string; data: UpdateUserInput }) =>
      apiClient<User>(`/users/${id}`, {
        method: 'PATCH',
        body: data,
      }),
    onSuccess: (_, { id }) => {
      queryClient.invalidateQueries({ queryKey: userKeys.detail(id) })
      queryClient.invalidateQueries({ queryKey: userKeys.lists() })
    },
  })
}

export function useDeleteUserMutation() {
  const queryClient = useQueryClient()

  return useMutation({
    mutationFn: (id: string) =>
      apiClient(`/users/${id}`, { method: 'DELETE' }),
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: userKeys.lists() })
    },
  })
}
```

**낙관적 업데이트 예시**:
```typescript
// features/todo/api/mutations.ts
import { useMutation, useQueryClient } from '@tanstack/react-query'
import { apiClient } from '@shared/api'
import { todoKeys } from './keys'
import type { Todo } from '../model/types'

export function useToggleTodoMutation() {
  const queryClient = useQueryClient()

  return useMutation({
    mutationFn: ({ id, completed }: { id: string; completed: boolean }) =>
      apiClient<Todo>(`/todos/${id}`, {
        method: 'PATCH',
        body: { completed },
      }),
    onMutate: async ({ id, completed }) => {
      // 진행 중인 쿼리 취소
      await queryClient.cancelQueries({ queryKey: todoKeys.detail(id) })

      // 이전 데이터 백업
      const previous = queryClient.getQueryData<Todo>(todoKeys.detail(id))

      // 낙관적 업데이트
      queryClient.setQueryData<Todo>(todoKeys.detail(id), (old) =>
        old ? { ...old, completed } : old
      )

      return { previous, id }
    },
    onError: (_, __, context) => {
      // 에러 시 롤백
      if (context?.previous) {
        queryClient.setQueryData(todoKeys.detail(context.id), context.previous)
      }
    },
    onSettled: (_, __, { id }) => {
      // 완료 후 캐시 무효화
      queryClient.invalidateQueries({ queryKey: todoKeys.detail(id) })
    },
  })
}
```

**무한 스크롤 컴포넌트 사용 예시**:
```typescript
// widgets/user-list/ui/UserInfiniteList.tsx
import { useEffect } from 'react'
import { useInView } from 'react-intersection-observer'
import { useUsersInfiniteQuery, UserCard } from '@entities/user'

export function UserInfiniteList() {
  const { ref, inView } = useInView()
  const {
    data,
    isLoading,
    error,
    fetchNextPage,
    hasNextPage,
    isFetchingNextPage,
  } = useUsersInfiniteQuery()

  useEffect(() => {
    if (inView && hasNextPage) {
      fetchNextPage()
    }
  }, [inView, hasNextPage, fetchNextPage])

  if (isLoading) return <div>Loading...</div>
  if (error) return <div>Error: {error.message}</div>

  return (
    <div className="space-y-4">
      {data?.pages.map((page) =>
        page.data.map((user) => <UserCard key={user.id} user={user} />)
      )}

      <div ref={ref}>
        {isFetchingNextPage ? <div>Loading more...</div> : null}
      </div>
    </div>
  )
}
```

#### Barrel 파일 export

```typescript
// entities/user/index.ts
// UI
export { UserCard } from './ui/UserCard'
export { UserAvatar } from './ui/UserAvatar'

// Model (Zustand)
export { useUserStore } from './model/store'
export type { User, UserFilters, PaginatedResponse } from './model/types'

// API (React Query)
export { userKeys } from './api/keys'
export {
  useUsersQuery,
  useUserQuery,
  useUsersInfiniteQuery,
} from './api/queries'
export {
  useCreateUserMutation,
  useUpdateUserMutation,
  useDeleteUserMutation,
} from './api/mutations'
```

#### 컴포넌트에서 사용

```typescript
// widgets/user-list/ui/UserList.tsx
import { useUsersQuery, useDeleteUserMutation, UserCard } from '@entities/user'
import { useAuthStore } from '@features/auth'

export function UserList() {
  const { data: users, isLoading, error } from useUsersQuery()
  const deleteUser = useDeleteUserMutation()
  const isAuthenticated = useAuthStore((state) => state.isAuthenticated)

  if (isLoading) return <div>Loading...</div>
  if (error) return <div>Error: {error.message}</div>

  return (
    <div className="grid gap-4">
      {users?.map((user) => (
        <UserCard
          key={user.id}
          user={user}
          onDelete={isAuthenticated ? () => deleteUser.mutate(user.id) : undefined}
        />
      ))}
    </div>
  )
}
```

### 폼 처리
- 폼 관리: react-hook-form
- 스키마 검증: zod + @hookform/resolvers
- 스키마 위치: 각 feature/entity의 `model/` 세그먼트
- 스키마 네이밍: `{도메인}Schema` (예: `loginSchema`, `userFormSchema`)
- 에러 메시지: 스키마 내 `.message()`로 정의
- 공용 폼 컴포넌트: `shared/ui/`에 Input, Select 등 배치

### API 연동
- API 함수 위치: 각 feature/entity의 `api/` 세그먼트
- 공용 API 클라이언트: `shared/api/`에 axios 인스턴스 등 배치
- 서버 상태: React Query 사용
- 에러 처리: try-catch + 사용자 피드백

### 스타일링 (Tailwind CSS + shadcn/ui)
- **Tailwind CSS**: 유틸리티 기반 스타일링
- **shadcn/ui**: Radix UI 기반 컴포넌트 (복사-붙여넣기 방식)
- 반응형: 모바일 우선 (`sm:`, `md:`, `lg:` 브레이크포인트)

### shadcn/ui 컴포넌트
- 컴포넌트 위치: `shared/ui/` (FSD 구조와 통합)
- 설치: `npx shadcn@latest add [component]`
- 커스터마이징: `shared/ui/` 내 컴포넌트 파일 직접 수정
- 테마 설정: `global.scss`의 CSS 변수 조정
  - React: `src/app/styles/global.scss`
  - Next.js: `src/shared/styles/global.scss`

```typescript
// Good - shared/ui에서 import
import { Button } from '@shared/ui/button'
import { Input } from '@shared/ui/input'

// Bad - 상대 경로로 직접 접근
import { Button } from '../../../shared/ui/button'
```

### 스타일 가이드
`.claude/style-guide.md` 파일이 존재하면 해당 가이드를 참조하여 스타일링:
- 컬러 토큰, 타이포그래피, 스페이싱 등 디자인 시스템 준수
- 컴포넌트 패턴 (버튼, 카드, 입력 필드, 테이블) 참조
- CSS 변수명은 스타일 가이드의 토큰명 사용
