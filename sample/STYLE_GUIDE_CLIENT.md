# M4Labs 스타일 가이드

바이브 코딩으로 동일한 디자인 시스템을 적용하기 위한 스타일 가이드입니다.

---

## 1. 컬러 시스템

### Primary (라임 그린 계열)
메인 액션, CTA 버튼, 강조 요소에 사용

| 용도 | HEX | RGB |
|------|-----|-----|
| **주색 (Main)** | `#D6FB64` | 214, 251, 100 |
| 밝은 톤 | `#E1FC94` | 225, 252, 148 |
| 어두운 톤 | `#C2F400` | 194, 244, 0 |
| 매우 밝은 | `#F8FFE6` | 248, 255, 230 |

### Secondary (시안/스카이블루 계열)
보조 액션, 링크, 정보성 요소에 사용

| 용도 | HEX | RGB |
|------|-----|-----|
| **주색 (Main)** | `#64D5FB` | 100, 213, 251 |
| 밝은 톤 | `#A7E6FC` | 167, 230, 252 |
| 어두운 톤 | `#00AAF8` | 0, 170, 248 |
| 매우 밝은 | `#DDF5FE` | 221, 245, 254 |

### Success (초록 계열)
성공, 완료, 긍정적 상태에 사용

| 용도 | HEX | RGB |
|------|-----|-----|
| **주색 (Main)** | `#14D450` | 20, 212, 80 |
| 밝은 톤 | `#5DDD74` | 93, 221, 116 |
| 어두운 톤 | `#00CB27` | 0, 203, 39 |

### Danger (오렌지-레드 계열)
오류, 경고, 삭제 등 위험 상태에 사용

| 용도 | HEX | RGB |
|------|-----|-----|
| **주색 (Main)** | `#FA5820` | 250, 88, 32 |
| 밝은 톤 | `#FB8964` | 251, 137, 100 |
| 어두운 톤 | `#D34313` | 211, 67, 19 |

### Warning (옐로우-오렌지 계열)
주의, 대기 상태에 사용

| 용도 | HEX | RGB |
|------|-----|-----|
| **주색 (Main)** | `#FAC239` | 250, 194, 57 |
| 밝은 톤 | `#FCD564` | 252, 213, 100 |
| 어두운 톤 | `#F6932C` | 246, 147, 44 |

### Neutral (중립/배경 계열)
배경, 테두리, 비활성 상태에 사용

| 용도 | HEX |
|------|-----|
| 검정 (기본 배경) | `#000000` |
| 다크 그레이 | `#27282B` |
| 그레이 | `#3C3E41` |
| 라이트 그레이 | `#576370` |
| 테이블 헤더 | `#3E4042` |
| 테이블 바디 | `#28292D` |

### 투명도 색상
```css
/* 흰색 투명도 */
--white-100: rgba(255, 255, 255, 1)
--white-80: rgba(255, 255, 255, 0.8)
--white-60: rgba(255, 255, 255, 0.6)
--white-40: rgba(255, 255, 255, 0.4)
--white-20: rgba(255, 255, 255, 0.2)
--white-10: rgba(255, 255, 255, 0.1)
--white-5: rgba(255, 255, 255, 0.05)

/* 검정 투명도 */
--black-100: rgba(0, 0, 0, 1)
--black-80: rgba(0, 0, 0, 0.8)
--black-60: rgba(0, 0, 0, 0.6)
--black-40: rgba(0, 0, 0, 0.4)
--black-20: rgba(0, 0, 0, 0.2)
--black-10: rgba(0, 0, 0, 0.1)
```

---

## 2. 그래디언트

### 메인 그래디언트 (Primary ↔ Secondary)
```css
background: linear-gradient(
  90deg,
  #00C4F9 0%,     /* Secondary */
  #36D2D4 25%,
  #6BE0AF 50%,
  #A1ED89 75%,
  #D6FB64 100%    /* Primary */
);
```

### 다크 배경 그래디언트
```css
/* 메인 레이아웃 배경 */
background: linear-gradient(287.56deg, #121212 0%, #1F2126 100%);

/* 다크 블랙 */
background: linear-gradient(120deg, #333738 0%, #1A1A1A 100%);
```

### 글래스모피즘 (로그인 박스 등)
```css
background: linear-gradient(
  95.25deg,
  rgba(255, 255, 255, 0.2) 8.41%,
  rgba(255, 255, 255, 0.05) 91.59%
);
border: 1px solid rgba(255, 255, 255, 0.5);
backdrop-filter: blur(10px);
```

---

## 3. 타이포그래피

### 폰트 패밀리
```css
font-family: "Inter", "Pretendard Std", "Pretendard",
             "Apple Color Emoji", "Segoe UI Emoji",
             "Noto Color Emoji", sans-serif;
```

### 폰트 크기
| 토큰 | 크기 | 용도 |
|------|------|------|
| `font-size-32` | 2rem (32px) | 대형 제목 |
| `font-size-28` | 1.75rem (28px) | 제목 |
| `font-size-24` | 1.5rem (24px) | 소제목 |
| `font-size-20` | 1.25rem (20px) | 강조 텍스트 |
| `font-size-18` | 1.125rem (18px) | 큰 본문 |
| `font-size-16` | 1rem (16px) | **기본 본문** |
| `font-size-14` | 0.875rem (14px) | 작은 본문 |
| `font-size-12` | 0.75rem (12px) | 캡션 |
| `font-size-10` | 0.625rem (10px) | 라벨 |

### 폰트 두께
| 용도 | 값 |
|------|-----|
| Thin | 100 |
| Light | 300 |
| Regular | 400 |
| Medium | 500 |
| SemiBold | 600 |
| Bold | 700 |
| ExtraBold | 800 |
| Black | 900 |

### 라인 하이트
```css
--line-height-180: 1.8   /* 긴 문단 */
--line-height-160: 1.6   /* 일반 문단 */
--line-height-140: 1.4   /* 기본값 */
--line-height-120: 1.2   /* 제목, 버튼 */
```

---

## 4. 스페이싱

### 기본 단위: 8px 그리드 시스템

| 토큰 | 크기 | 용도 |
|------|------|------|
| `spacing-4` | 4px | 아이콘-텍스트 간격 |
| `spacing-8` | 8px | 인라인 요소 간격 |
| `spacing-12` | 12px | 작은 패딩 |
| `spacing-16` | 16px | 기본 패딩 |
| `spacing-24` | 24px | 섹션 패딩 |
| `spacing-32` | 32px | 큰 섹션 간격 |
| `spacing-48` | 48px | 매우 큰 간격 |
| `spacing-64` | 64px | 페이지 레벨 간격 |

---

## 5. 컴포넌트 사이즈

### 버튼/입력 필드 높이
| 토큰 | 크기 | 용도 |
|------|------|------|
| `form-height-56` | 56px | 대형 버튼 |
| `form-height-48` | 48px | 기본 버튼 |
| `form-height-40` | 40px | 중간 버튼 |
| `form-height-32` | 32px | 작은 버튼 |
| `form-height-24` | 24px | 미니 버튼 |

### Border Radius
```css
--radius-xl: 16px    /* 카드, 모달 */
--radius-md: 8px     /* 버튼, 입력 필드 */
--radius-sm: 4px     /* 태그, 뱃지 */
```

---

## 6. 그림자

### 기본 그림자
```css
box-shadow:
  0 3px 2px 0 rgba(0, 0, 0, 0.06),
  0 1px 2px 0 rgba(0, 0, 0, 0.1);
```

### 드롭다운/팝업 그림자
```css
box-shadow: 0 10px 10px rgba(0, 0, 0, 0.1);
```

### 포커스 하이라이트
```css
box-shadow: 0 0 4px rgba(0, 255, 72, 0.3);
```

---

## 7. 반응형 브레이크포인트

| 브레이크포인트 | 범위 | 용도 |
|----------------|------|------|
| Mobile | ~480px | 모바일 |
| Tablet | 481px~767px | 태블릿 |
| Desktop | 768px~1279px | 데스크톱 |
| Wide | 1280px~1439px | 와이드 데스크톱 |
| Ultra Wide | 1440px~ | 초대형 화면 |

---

## 8. 바이브 코딩 프롬프트 예시

### 기본 스타일 설정 프롬프트
```
이 프로젝트의 컬러 테마:
- Primary: #D6FB64 (라임 그린)
- Secondary: #64D5FB (시안/스카이블루)
- Success: #14D450 (그린)
- Danger: #FA5820 (오렌지-레드)
- Warning: #FAC239 (옐로우)
- 배경: 다크 모드 (#000000 ~ #1F2126 그래디언트)
- 텍스트: rgba(255, 255, 255, 0.6~1.0)

그래디언트: Primary ↔ Secondary 조합
폰트: Inter (sans-serif)
기본 radius: 8px
다크 모드 전용
```

### 버튼 스타일 프롬프트
```
버튼 스타일:
- Primary 버튼: 배경 #D6FB64, 텍스트 #000000
- Secondary 버튼: 배경 투명, 테두리 #64D5FB, 텍스트 #64D5FB
- 높이: 48px (기본), 32px (작은)
- border-radius: 8px
- 호버 시 약간 밝아짐
```

### 카드 스타일 프롬프트
```
카드 스타일:
- 배경: rgba(255, 255, 255, 0.05~0.1)
- 테두리: rgba(255, 255, 255, 0.1)
- border-radius: 16px
- 패딩: 24px
- 그림자: 0 3px 2px rgba(0, 0, 0, 0.06)
```

### 테이블 스타일 프롬프트
```
테이블 스타일:
- 헤더 배경: #3E4042
- 바디 배경: #28292D
- 호버 행: #2B353B
- 테두리: rgba(255, 255, 255, 0.1)
- 헤더 높이: 40px
- 행 높이: 52px
```

---

## 9. CSS 변수 복사용 스니펫

```css
:root {
  /* Primary */
  --primary: #D6FB64;
  --primary-light: #E1FC94;
  --primary-dark: #C2F400;
  --primary-rgb: 214, 251, 100;

  /* Secondary */
  --secondary: #64D5FB;
  --secondary-light: #A7E6FC;
  --secondary-dark: #00AAF8;
  --secondary-rgb: 100, 213, 251;

  /* Semantic */
  --success: #14D450;
  --danger: #FA5820;
  --warning: #FAC239;

  /* Neutral */
  --bg-primary: #000000;
  --bg-secondary: #121212;
  --bg-tertiary: #1F2126;
  --bg-card: rgba(255, 255, 255, 0.05);

  --text-primary: rgba(255, 255, 255, 1);
  --text-secondary: rgba(255, 255, 255, 0.8);
  --text-tertiary: rgba(255, 255, 255, 0.6);
  --text-disabled: rgba(255, 255, 255, 0.4);

  --border-default: rgba(255, 255, 255, 0.1);
  --border-hover: rgba(255, 255, 255, 0.2);

  /* Gradient */
  --gradient-main: linear-gradient(90deg, #00C4F9 0%, #36D2D4 25%, #6BE0AF 50%, #A1ED89 75%, #D6FB64 100%);
  --gradient-bg: linear-gradient(287.56deg, #121212 0%, #1F2126 100%);

  /* Sizing */
  --radius-sm: 4px;
  --radius-md: 8px;
  --radius-lg: 16px;

  /* Typography */
  --font-family: "Inter", "Pretendard", sans-serif;
}
```

---

## 10. 특수 컬러 조합

### M4CXR 모델 테마 (민트/청록)
```css
--m4cxr-main: #72D2D1;
--m4cxr-bg: #213332;
--m4cxr-bg-hover: #304241;
--m4cxr-border: rgba(114, 210, 209, 0.4);
```

### Deep Chest 모델 테마 (보라)
```css
--deepchest-main: #C8BDFF;
--deepchest-bg: #312C47;
--deepchest-bg-hover: #403B56;
--deepchest-border: rgba(200, 189, 255, 0.4);
```

---

## 요약

| 항목 | 값 |
|------|-----|
| **Primary** | `#D6FB64` (라임) |
| **Secondary** | `#64D5FB` (시안) |
| **배경 모드** | 다크 모드 only |
| **기본 폰트** | Inter |
| **기본 radius** | 8px |
| **기본 간격 단위** | 8px |
| **그래디언트 방향** | Secondary → Primary (좌→우) |
