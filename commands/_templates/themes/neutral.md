# shadcn/ui Neutral 테마

## 스타일 가이드

### 컬러 시스템

**Primary (Neutral Gray)**
| Token | Light | Dark | 용도 |
|-------|-------|------|------|
| `--primary` | `#171717` | `#FAFAFA` | 메인 액션, CTA 버튼 |
| `--primary-foreground` | `#FAFAFA` | `#171717` | 버튼 텍스트 |

**Secondary**
| Token | Light | Dark | 용도 |
|-------|-------|------|------|
| `--secondary` | `#F5F5F5` | `#262626` | 보조 버튼, 배경 |
| `--secondary-foreground` | `#171717` | `#FAFAFA` | 보조 텍스트 |

**Semantic**
| Token | 값 | 용도 |
|-------|-----|------|
| `--destructive` | `hsl(0 84.2% 60.2%)` | 에러, 삭제 |
| `--success` | 직접 정의 필요 | 성공 메시지 |
| `--warning` | 직접 정의 필요 | 경고 메시지 |

**Muted**
| Token | Light | Dark | 용도 |
|-------|-------|------|------|
| `--muted` | `#F5F5F5` | `#262626` | 비활성 배경 |
| `--muted-foreground` | `#737373` | `#A3A3A3` | 보조 텍스트, placeholder |

**Background**
| Token | Light | Dark | 용도 |
|-------|-------|------|------|
| `--background` | `#FFFFFF` | `#0A0A0A` | 페이지 배경 |
| `--foreground` | `#0A0A0A` | `#FAFAFA` | 기본 텍스트 |
| `--card` | `#FFFFFF` | `#0A0A0A` | 카드 배경 |
| `--popover` | `#FFFFFF` | `#0A0A0A` | 팝오버 배경 |

**Border**
| Token | Light | Dark | 용도 |
|-------|-------|------|------|
| `--border` | `#E5E5E5` | `#262626` | 기본 테두리 |
| `--input` | `#E5E5E5` | `#262626` | 입력 필드 테두리 |
| `--ring` | `#0A0A0A` | `#D4D4D4` | 포커스 링 |

### 타이포그래피

**폰트**: 시스템 폰트 스택 또는 `"Inter", sans-serif`

**사이즈 (Tailwind 기본)**
| Class | Size | 용도 |
|-------|------|------|
| `text-xs` | 0.75rem (12px) | 캡션, 라벨 |
| `text-sm` | 0.875rem (14px) | 작은 본문 |
| `text-base` | 1rem (16px) | 기본 본문 |
| `text-lg` | 1.125rem (18px) | 큰 본문 |
| `text-xl` | 1.25rem (20px) | 소제목 |
| `text-2xl` | 1.5rem (24px) | 제목 |
| `text-3xl` | 1.875rem (30px) | 대제목 |

**Weight**
| Class | 값 | 용도 |
|-------|-----|------|
| `font-normal` | 400 | 본문 |
| `font-medium` | 500 | 강조 |
| `font-semibold` | 600 | 버튼, 제목 |
| `font-bold` | 700 | 강한 강조 |

### 스페이싱 (Tailwind 4px 기준)

| Class | Size | 용도 |
|-------|------|------|
| `p-1`, `m-1` | 4px | 최소 간격 |
| `p-2`, `m-2` | 8px | 작은 요소 간격 |
| `p-3`, `m-3` | 12px | 인라인 요소 간격 |
| `p-4`, `m-4` | 16px | 기본 간격 |
| `p-6`, `m-6` | 24px | 컴포넌트 간격 |
| `p-8`, `m-8` | 32px | 섹션 간격 |

### 컴포넌트

**Border Radius**
| Token | Size | 용도 |
|-------|------|------|
| `--radius` | 0.5rem (8px) | 기본값 |
| `rounded-lg` | `var(--radius)` | 카드, 버튼 |
| `rounded-md` | `calc(var(--radius) - 2px)` | 입력 필드 |
| `rounded-sm` | `calc(var(--radius) - 4px)` | 태그, 뱃지 |

**그림자 (Tailwind 기본)**
| Class | 용도 |
|-------|------|
| `shadow-sm` | 미세한 입체감 |
| `shadow` | 카드, 드롭다운 |
| `shadow-md` | 모달, 팝오버 |
| `shadow-lg` | 강조 요소 |

### 컴포넌트 패턴 (shadcn/ui)

**버튼**
```tsx
// Primary
<Button>Click me</Button>
// className: bg-primary text-primary-foreground hover:bg-primary/90

// Secondary
<Button variant="secondary">Secondary</Button>
// className: bg-secondary text-secondary-foreground hover:bg-secondary/80

// Outline
<Button variant="outline">Outline</Button>
// className: border border-input bg-background hover:bg-accent

// Destructive
<Button variant="destructive">Delete</Button>
// className: bg-destructive text-destructive-foreground hover:bg-destructive/90
```

**카드**
```tsx
<Card>
  <CardHeader>
    <CardTitle>Title</CardTitle>
    <CardDescription>Description</CardDescription>
  </CardHeader>
  <CardContent>Content</CardContent>
</Card>
// className: rounded-lg border bg-card text-card-foreground shadow-sm
```

**입력 필드**
```tsx
<Input placeholder="Enter text" />
// className: border border-input bg-background rounded-md px-3 py-2
// focus: ring-2 ring-ring ring-offset-2
```

**테이블**
```tsx
<Table>
  <TableHeader>
    <TableRow>
      <TableHead>Header</TableHead>
    </TableRow>
  </TableHeader>
  <TableBody>
    <TableRow>
      <TableCell>Cell</TableCell>
    </TableRow>
  </TableBody>
</Table>
// TableHead: h-12 text-muted-foreground font-medium
// TableRow: border-b hover:bg-muted/50
```

### 다크 모드

**적용 방법**
```tsx
// HTML class 방식
<html class="dark">

// 또는 next-themes 사용
import { ThemeProvider } from 'next-themes'
<ThemeProvider attribute="class" defaultTheme="system">
```

**토글 구현**
```tsx
import { useTheme } from 'next-themes'

function ThemeToggle() {
  const { theme, setTheme } = useTheme()
  return (
    <Button onClick={() => setTheme(theme === 'dark' ? 'light' : 'dark')}>
      Toggle
    </Button>
  )
}
```

### 주요 원칙

1. **라이트/다크 모드 지원**: 모든 색상은 CSS 변수로 정의, 모드에 따라 자동 전환
2. **Neutral 톤**: 무채색 기반으로 콘텐츠 강조
3. **일관된 간격**: Tailwind 스페이싱 시스템 활용
4. **접근성**: 충분한 색상 대비, 포커스 상태 명확히 표시
5. **shadcn/ui 컴포넌트**: 필요한 컴포넌트는 `npx shadcn@latest add` 로 추가
