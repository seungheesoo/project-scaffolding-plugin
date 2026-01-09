# Lime-Cyan Dark 테마

다크 모드 기반의 라임-시안 그래디언트 테마입니다.

## 테마 정보
- **이름**: Lime-Cyan Dark
- **모드**: 다크 모드 전용
- **Primary**: 라임 그린 (#D6FB64)
- **Secondary**: 시안 (#64D5FB)

## CSS 변수

다크 모드 전용 테마이므로 `:root`에 다크 값을 직접 적용합니다 (`.dark` 블록 없음).

```css
@layer base {
  :root {
    /* Primary - 라임 그린 */
    --primary: 74 90% 69%;
    --primary-foreground: 0 0% 0%;

    /* Secondary - 시안 */
    --secondary: 195 95% 70%;
    --secondary-foreground: 0 0% 0%;

    /* Background - 다크 */
    --background: 220 6% 10%;
    --foreground: 0 0% 100%;

    /* Card */
    --card: 220 6% 13%;
    --card-foreground: 0 0% 100%;

    /* Popover */
    --popover: 220 6% 13%;
    --popover-foreground: 0 0% 100%;

    /* Muted */
    --muted: 220 6% 18%;
    --muted-foreground: 0 0% 60%;

    /* Accent */
    --accent: 220 6% 18%;
    --accent-foreground: 0 0% 100%;

    /* Destructive - 오렌지 레드 */
    --destructive: 15 95% 55%;
    --destructive-foreground: 0 0% 100%;

    /* Border & Input */
    --border: 0 0% 20%;
    --input: 0 0% 20%;
    --ring: 74 90% 69%;

    /* Radius */
    --radius: 0.5rem;

    /* Success */
    --success: 145 83% 45%;
    --success-foreground: 0 0% 0%;

    /* Warning */
    --warning: 40 95% 60%;
    --warning-foreground: 0 0% 0%;
  }
}
```

## Tailwind 확장 색상

`tailwind.config.ts`의 `theme.extend.colors`에서 `destructive` 다음에 추가:

```typescript
success: {
  DEFAULT: 'hsl(var(--success))',
  foreground: 'hsl(var(--success-foreground))',
},
warning: {
  DEFAULT: 'hsl(var(--warning))',
  foreground: 'hsl(var(--warning-foreground))',
},
```
