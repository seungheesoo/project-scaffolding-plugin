# M4Labs 통합 스타일 가이드

바이브 코딩으로 동일한 디자인 시스템을 적용하기 위한 스타일 가이드입니다.

---

## 1. 컬러 시스템

### Primary (라임 그린 계열)
메인 액션, CTA 버튼, 강조 요소에 사용

| Token | HEX | RGB | 용도 |
|-------|-----|-----|------|
| `--primary` | `#D6FB64` | 214, 251, 100 | **메인 액센트** |
| `--primary-hover` | `#C2F400` | 194, 244, 0 | 호버 상태 |
| `--primary-light` | `#E1FC94` | 225, 252, 148 | 밝은 톤 |
| `--primary-bg` | `#F8FFE6` | 248, 255, 230 | 매우 밝은 배경 |

### Secondary (시안/스카이블루 계열)
보조 액션, 링크, 정보성 요소에 사용

| Token | HEX | RGB | 용도 |
|-------|-----|-----|------|
| `--secondary` | `#64D5FB` | 100, 213, 251 | **주요 보조 색상** |
| `--secondary-hover` | `#00C4F9` | 0, 196, 249 | 링크, 정보 |
| `--secondary-dark` | `#00AAF8` | 0, 170, 248 | 어두운 톤 |
| `--secondary-light` | `#A7E6FC` | 167, 230, 252 | 밝은 톤 |
| `--secondary-bg` | `#DDF5FE` | 221, 245, 254 | 매우 밝은 배경 |

### Success (초록 계열)
성공, 완료, 긍정적 상태에 사용

| Token | HEX | RGB | 용도 |
|-------|-----|-----|------|
| `--success` | `#14D450` | 20, 212, 80 | **성공 메시지** |
| `--success-light` | `#5DDD74` | 93, 221, 116 | 밝은 톤 |
| `--success-dark` | `#00CB27` | 0, 203, 39 | 어두운 톤 |

### Danger (오렌지-레드 계열)
오류, 경고, 삭제 등 위험 상태에 사용

| Token | HEX | RGB | 용도 |
|-------|-----|-----|------|
| `--danger` | `#FA5820` | 250, 88, 32 | **에러, 삭제** |
| `--danger-light` | `#FB8964` | 251, 137, 100 | 밝은 톤 |
| `--danger-dark` | `#D34313` | 211, 67, 19 | 어두운 톤 |

### Warning (옐로우-오렌지 계열)
주의, 대기 상태에 사용

| Token | HEX | RGB | 용도 |
|-------|-----|-----|------|
| `--warning` | `#FAC239` | 250, 194, 57 | **경고 메시지** |
| `--warning-light` | `#FBD564` | 251, 213, 100 | 밝은 톤 |
| `--warning-dark` | `#F6932C` | 246, 147, 44 | 어두운 톤 |

### Neutral - White (투명도 기반)
| Token | 값 | 용도 |
|-------|-----|------|
| `--white-100` | `rgba(255, 255, 255, 1)` | 완전 불투명 |
| `--white-80` | `rgba(255, 255, 255, 0.8)` | 기본 텍스트 |
| `--white-60` | `rgba(255, 255, 255, 0.6)` | 부제목, 보조 텍스트 |
| `--white-40` | `rgba(255, 255, 255, 0.4)` | 라벨, placeholder |
| `--white-30` | `rgba(255, 255, 255, 0.3)` | 강조 보더 |
| `--white-20` | `rgba(255, 255, 255, 0.2)` | 기본 보더, 스크롤바 |
| `--white-10` | `rgba(255, 255, 255, 0.1)` | 호버 배경 |
| `--white-5` | `rgba(255, 255, 255, 0.05)` | 배경 |

### Neutral - Black (투명도 기반)
| Token | 값 | 용도 |
|-------|-----|------|
| `--black-100` | `rgba(0, 0, 0, 1)` | 완전 불투명 |
| `--black-80` | `rgba(0, 0, 0, 0.8)` | 오버레이 |
| `--black-60` | `rgba(0, 0, 0, 0.6)` | 반투명 배경 |
| `--black-50` | `rgba(0, 0, 0, 0.5)` | 폼 필드 배경 |
| `--black-40` | `rgba(0, 0, 0, 0.4)` | 중간 투명도 |
| `--black-30` | `rgba(0, 0, 0, 0.3)` | 텍스트박스 배경 |
| `--black-20` | `rgba(0, 0, 0, 0.2)` | 테이블 행 배경 |
| `--black-10` | `rgba(0, 0, 0, 0.1)` | 연한 배경 |

### Neutral - 고정 색상
| Token | HEX | 용도 |
|-------|-----|------|
| `--bg-primary` | `#000000` | 기본 배경 |
| `--bg-secondary` | `#121212` | 보조 배경 |
| `--bg-tertiary` | `#1F2126` | 3차 배경 |
| `--gray` | `#3C3E41` | 그레이 |
| `--gray-light` | `#576370` | 라이트 그레이 |

### 테이블 색상
| Token | HEX | 용도 |
|-------|-----|------|
| `--table-th` | `#3E4042` | 헤더 |
| `--table-td` | `#28292D` | 셀 |
| `--table-even` | `#323436` | 짝수 행 |
| `--table-selected` | `#263841` | 선택 행 |
| `--table-hover` | `#2B353B` | 호버 |

---

## 2. 그래디언트

### 메인 그래디언트 (Secondary → Primary)
```scss
background: linear-gradient(
  90deg,
  #00C4F9 0%,     // Secondary
  #36D2D4 25%,
  #6BE0AF 50%,
  #A1ED89 75%,
  #D6FB64 100%    // Primary
);
```

### 다크 배경 그래디언트
```scss
// 메인 레이아웃 배경
background: linear-gradient(287.56deg, #121212 0%, #1F2126 100%);

// 다크 블랙
background: linear-gradient(120deg, #333738 0%, #1A1A1A 100%);
```

### 글래스모피즘 (로그인 박스 등)
```scss
background: linear-gradient(
  95.25deg,
  rgba(255, 255, 255, 0.2) 8.41%,
  rgba(255, 255, 255, 0.05) 91.59%
);
border: 1px solid rgba(255, 255, 255, 0.5);
backdrop-filter: blur(10px);
```

---

## 3. 특수 컬러 테마

### M4CXR 모델 테마 (민트/청록)
| Token | 값 | 용도 |
|-------|-----|------|
| `--m4cxr-main` | `#72D2D1` | 메인 |
| `--m4cxr-bg` | `#213332` | 배경 |
| `--m4cxr-bg-hover` | `#304241` | 호버 배경 |
| `--m4cxr-border` | `rgba(114, 210, 209, 0.4)` | 보더 |

### Deep Chest 모델 테마 (보라)
| Token | 값 | 용도 |
|-------|-----|------|
| `--deepchest-main` | `#C8BDFF` | 메인 |
| `--deepchest-bg` | `#312C47` | 배경 |
| `--deepchest-bg-hover` | `#403B56` | 호버 배경 |
| `--deepchest-border` | `rgba(200, 189, 255, 0.4)` | 보더 |

---

## 4. 타이포그래피

### 폰트 패밀리
```scss
font-family: "Inter", "Pretendard Std", "Pretendard",
             "Apple SD Gothic Neo", "Malgun Gothic",
             "Apple Color Emoji", "Segoe UI Emoji",
             "Noto Color Emoji", sans-serif;
```

### 폰트 사이즈
| Token | Size | 용도 |
|-------|------|------|
| `--font-size-32` | 2rem (32px) | 대형 제목 |
| `--font-size-28` | 1.75rem (28px) | 제목 |
| `--font-size-24` | 1.5rem (24px) | 소제목 |
| `--font-size-20` | 1.25rem (20px) | 중제목 |
| `--font-size-18` | 1.125rem (18px) | 큰 본문 |
| `--font-size-16` | 1rem (16px) | 기본 본문 |
| `--font-size-14` | 0.875rem (14px) | 작은 본문 |
| `--font-size-12` | 0.75rem (12px) | 캡션, 라벨 |
| `--font-size-10` | 0.625rem (10px) | 미니 라벨 |

### 폰트 Weight
| Token | 값 | 용도 |
|-------|-----|------|
| `--font-thin` | 100 | Thin |
| `--font-light` | 300 | Light |
| `--font-regular` | 400 | Regular |
| `--font-medium` | 500 | Medium |
| `--font-semibold` | 600 | SemiBold |
| `--font-bold` | 700 | Bold |
| `--font-extrabold` | 800 | ExtraBold |
| `--font-black` | 900 | Black |

### 라인 하이트
| Token | 값 | 용도 |
|-------|-----|------|
| `--line-height-180` | 1.8 | 긴 문단 |
| `--line-height-160` | 1.6 | 일반 문단 |
| `--line-height-140` | 1.4 | 기본값 |
| `--line-height-120` | 1.2 | 제목, 버튼 |

---

## 5. 스페이싱

### 기본 단위: 8px 그리드 시스템
| Token | Size | 용도 |
|-------|------|------|
| `--spacing-4` | 4px | 아이콘-텍스트 간격 |
| `--spacing-8` | 8px | 작은 요소 간격 |
| `--spacing-12` | 12px | 인라인 요소 간격 |
| `--spacing-16` | 16px | 기본 간격 |
| `--spacing-20` | 20px | 섹션 내 간격 |
| `--spacing-24` | 24px | 컴포넌트 간격 |
| `--spacing-32` | 32px | 섹션 간격 |
| `--spacing-40` | 40px | 큰 섹션 간격 |
| `--spacing-48` | 48px | 페이지 섹션 간격 |
| `--spacing-64` | 64px | 페이지 레벨 간격 |

### 레이아웃 변수 (참고용)
| Token | Size | 용도 |
|-------|------|------|
| `--gnb-width` | 280px | 사이드바 너비 |
| `--page-padding` | 50px | 페이지 패딩 |
| `--page-header-height` | 100px | 헤더 높이 |

---

## 6. 컴포넌트 사이즈

### 버튼/입력 필드 높이
| Token | Size | 용도 |
|-------|------|------|
| `--form-height-56` | 56px | 대형 버튼 |
| `--form-height-48` | 48px | 기본 버튼 |
| `--form-height-40` | 40px | 중간 버튼 |
| `--form-height-32` | 32px | 작은 버튼 |
| `--form-height-24` | 24px | 미니 버튼 |

### Border Radius
| Token | Size | 용도 |
|-------|------|------|
| `--radius-xl` | 16px | 카드, 모달 |
| `--radius-md` | 8px | 버튼, 입력 필드 |
| `--radius-sm` | 4px | 태그, 뱃지 |

### Border 색상
| 상태 | 값 |
|------|-----|
| 기본 | `1px solid var(--white-20)` |
| 연한 | `1px solid var(--white-10)` |
| 포커스 | `1px solid var(--primary)` |

---

## 7. 그림자

| Token | 값 | 용도 |
|-------|-----|------|
| `--shadow-default` | `0 3px 2px 0 rgba(0,0,0,0.06), 0 1px 2px 0 rgba(0,0,0,0.1)` | 기본 |
| `--shadow-dropdown` | `0 10px 10px rgba(0, 0, 0, 0.1)` | 드롭다운/팝업 |
| `--shadow-focus` | `0 0 4px rgba(0, 255, 72, 0.3)` | 포커스 하이라이트 |

---

## 8. 애니메이션

| Token | 값 | 용도 |
|-------|-----|------|
| `--transition-default` | `all 0.2s linear` | 기본 트랜지션 |
| `--transition-border` | `border 0.5s linear, background 0.3s linear` | 보더/배경 |
| `--transition-hover` | `0.2s cubic-bezier(0.55, 0.09, 0.68, 0.53)` | 호버 이징 |

---

## 9. 반응형 브레이크포인트

| 브레이크포인트 | 범위 | 용도 |
|----------------|------|------|
| Ultra Wide | 1920px~ | 대형 모니터 |
| Wide | 1440px~1919px | 와이드 데스크톱 |
| Desktop | 1280px~1439px | 데스크톱 |
| Tablet | 768px~1279px | 태블릿 |
| Mobile | 480px~767px | 모바일 |
| Small Mobile | ~480px | 소형 모바일 |

```scss
@media (min-width: 1920px) { /* Ultra Wide */ }
@media (min-width: 1440px) and (max-width: 1919px) { /* Wide */ }
@media (min-width: 1280px) and (max-width: 1439px) { /* Desktop */ }
@media (min-width: 768px) and (max-width: 1279px) { /* Tablet */ }
@media (min-width: 480px) and (max-width: 767px) { /* Mobile */ }
@media (max-width: 480px) { /* Small Mobile */ }
```

---

## 10. 유틸리티 클래스

### 색상 클래스
```html
<span class="color--primary">Primary 색상</span>
<span class="color--secondary">Secondary 색상</span>
<span class="color--success">Success 색상</span>
<span class="color--danger">Danger 색상</span>
<span class="color--warning">Warning 색상</span>
```

### 간격 클래스
```html
<!-- Margin: mt, mb, ml, mr (0~100) -->
<div class="mt16 mb24">Margin Top 16, Bottom 24</div>

<!-- Padding: pt, pb, pl, pr, pd (0~100) -->
<div class="pd16">Padding All 16</div>

<!-- Gap (Flexbox) -->
<div class="flex gap-16">Gap 16px</div>
```

### 너비 클래스
```html
<div class="w-full">100%</div>
<div class="w-auto">auto</div>
<div class="w-12/24">50% (12/24)</div>
```

### Flexbox 클래스
```html
<div class="flex align-center justify-between">
  <span>Left</span>
  <span>Right</span>
</div>
```

### 폰트 클래스
```html
<span class="font-12">12px</span>
<span class="font-16 weight-600">16px SemiBold</span>
```

---

## 11. 컴포넌트 스타일 패턴

### 카드/박스
```scss
.card {
  background: var(--black-30);
  border: 1px solid var(--white-20);
  border-radius: var(--radius-xl);
  padding: var(--spacing-24);
}
```

### 버튼
```scss
.btn-primary {
  background: var(--primary);
  color: var(--black-100);
  border-radius: var(--radius-md);
  padding: var(--spacing-12) var(--spacing-24);
  font-weight: var(--font-semibold);
  transition: var(--transition-default);

  &:hover {
    background: var(--primary-hover);
  }
}

.btn-secondary {
  background: transparent;
  border: 1px solid var(--secondary);
  color: var(--secondary);
  border-radius: var(--radius-md);
  padding: var(--spacing-12) var(--spacing-24);
}
```

### 입력 필드
```scss
.input {
  background: var(--black-50);
  border: 1px solid var(--white-20);
  border-radius: var(--radius-md);
  color: var(--white-80);
  padding: var(--spacing-12) var(--spacing-16);
  transition: var(--transition-default);

  &:focus {
    border-color: var(--primary);
    box-shadow: var(--shadow-focus);
  }
}
```

### 테이블
```scss
.table {
  th {
    background: var(--table-th);
    height: 40px;
  }

  td {
    background: var(--table-td);
    height: 52px;
  }

  tr:nth-child(even) td {
    background: var(--table-even);
  }

  tr:hover td {
    background: var(--table-hover);
  }
}
```

---

## 12. 바이브 코딩 프롬프트 예시

### 기본 스타일 설정
```
이 프로젝트의 컬러 테마:
- Primary: #D6FB64 (라임 그린)
- Secondary: #64D5FB (시안/스카이블루)
- Success: #14D450 (그린)
- Danger: #FA5820 (오렌지-레드)
- Warning: #FAC239 (옐로우)
- 배경: 다크 모드 (#000000 ~ #1F2126 그래디언트)
- 텍스트: rgba(255, 255, 255, 0.6~1.0)

그래디언트: Secondary → Primary 조합 (좌→우)
폰트: Inter (sans-serif)
기본 radius: 8px
다크 모드 전용
```

### 버튼 스타일
```
버튼 스타일:
- Primary 버튼: 배경 #D6FB64, 텍스트 #000000
- Secondary 버튼: 배경 투명, 테두리 #64D5FB, 텍스트 #64D5FB
- 높이: 48px (기본), 32px (작은)
- border-radius: 8px
- 호버 시 약간 밝아짐
```

### 카드 스타일
```
카드 스타일:
- 배경: rgba(255, 255, 255, 0.05~0.1)
- 테두리: rgba(255, 255, 255, 0.1)
- border-radius: 16px
- 패딩: 24px
- 그림자: 0 3px 2px rgba(0, 0, 0, 0.06)
```

### 테이블 스타일
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

## 13. CSS 변수 스니펫

```scss
:root {
  // Primary
  --primary: #D6FB64;
  --primary-hover: #C2F400;
  --primary-light: #E1FC94;
  --primary-bg: #F8FFE6;

  // Secondary
  --secondary: #64D5FB;
  --secondary-hover: #00C4F9;
  --secondary-dark: #00AAF8;
  --secondary-light: #A7E6FC;
  --secondary-bg: #DDF5FE;

  // Semantic
  --success: #14D450;
  --success-light: #5DDD74;
  --success-dark: #00CB27;
  --danger: #FA5820;
  --danger-light: #FB8964;
  --danger-dark: #D34313;
  --warning: #FAC239;
  --warning-light: #FBD564;
  --warning-dark: #F6932C;

  // Background
  --bg-primary: #000000;
  --bg-secondary: #121212;
  --bg-tertiary: #1F2126;
  --gray: #3C3E41;
  --gray-light: #576370;

  // White Transparency
  --white-100: rgba(255, 255, 255, 1);
  --white-80: rgba(255, 255, 255, 0.8);
  --white-60: rgba(255, 255, 255, 0.6);
  --white-40: rgba(255, 255, 255, 0.4);
  --white-30: rgba(255, 255, 255, 0.3);
  --white-20: rgba(255, 255, 255, 0.2);
  --white-10: rgba(255, 255, 255, 0.1);
  --white-5: rgba(255, 255, 255, 0.05);

  // Black Transparency
  --black-100: rgba(0, 0, 0, 1);
  --black-80: rgba(0, 0, 0, 0.8);
  --black-60: rgba(0, 0, 0, 0.6);
  --black-50: rgba(0, 0, 0, 0.5);
  --black-40: rgba(0, 0, 0, 0.4);
  --black-30: rgba(0, 0, 0, 0.3);
  --black-20: rgba(0, 0, 0, 0.2);
  --black-10: rgba(0, 0, 0, 0.1);

  // Table
  --table-th: #3E4042;
  --table-td: #28292D;
  --table-even: #323436;
  --table-selected: #263841;
  --table-hover: #2B353B;

  // Typography
  --font-family: "Inter", "Pretendard", sans-serif;
  --font-thin: 100;
  --font-light: 300;
  --font-regular: 400;
  --font-medium: 500;
  --font-semibold: 600;
  --font-bold: 700;
  --font-extrabold: 800;
  --font-black: 900;

  --font-size-32: 2rem;
  --font-size-28: 1.75rem;
  --font-size-24: 1.5rem;
  --font-size-20: 1.25rem;
  --font-size-18: 1.125rem;
  --font-size-16: 1rem;
  --font-size-14: 0.875rem;
  --font-size-12: 0.75rem;
  --font-size-10: 0.625rem;

  --line-height-180: 1.8;
  --line-height-160: 1.6;
  --line-height-140: 1.4;
  --line-height-120: 1.2;

  // Spacing
  --spacing-4: 4px;
  --spacing-8: 8px;
  --spacing-12: 12px;
  --spacing-16: 16px;
  --spacing-20: 20px;
  --spacing-24: 24px;
  --spacing-32: 32px;
  --spacing-40: 40px;
  --spacing-48: 48px;
  --spacing-64: 64px;

  // Form
  --form-height-56: 56px;
  --form-height-48: 48px;
  --form-height-40: 40px;
  --form-height-32: 32px;
  --form-height-24: 24px;

  // Border Radius
  --radius-xl: 16px;
  --radius-md: 8px;
  --radius-sm: 4px;

  // Shadow
  --shadow-default: 0 3px 2px 0 rgba(0, 0, 0, 0.06), 0 1px 2px 0 rgba(0, 0, 0, 0.1);
  --shadow-dropdown: 0 10px 10px rgba(0, 0, 0, 0.1);
  --shadow-focus: 0 0 4px rgba(0, 255, 72, 0.3);

  // Transition
  --transition-default: all 0.2s linear;
  --transition-border: border 0.5s linear, background 0.3s linear;
  --transition-hover: 0.2s cubic-bezier(0.55, 0.09, 0.68, 0.53);

  // Gradient
  --gradient-main: linear-gradient(90deg, #00C4F9 0%, #36D2D4 25%, #6BE0AF 50%, #A1ED89 75%, #D6FB64 100%);
  --gradient-bg: linear-gradient(287.56deg, #121212 0%, #1F2126 100%);
}
```

---

## 14. 주요 디자인 원칙

1. **다크 테마 기반**: 배경은 항상 어둡게 (`#121212` ~ `#1F2126`)
2. **투명도 활용**: 흰색/검정 투명도로 계층감 표현
3. **그래디언트 포인트**: 시안~라임 그래디언트로 브랜드 아이덴티티 표현
4. **rem 단위 사용**: 반응형을 위해 px 대신 rem 사용
5. **CSS 변수 활용**: 직접 값 대신 `var(--token)` 사용

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
