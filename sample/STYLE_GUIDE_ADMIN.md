# M4CXR Admin 스타일 가이드

바이브코딩 시 디자인 통일성을 위한 스타일 참조 문서입니다.

---

## 1. 색상 팔레트

### Primary (메인 - 라임/연두)
| Token | Hex | 용도 |
|-------|-----|------|
| `--primary-300` | `#d6fb64` | **메인 액센트, 버튼, 강조** |
| `--primary-400` | `#cbf837` | 호버 상태 |
| `--primary-500` | `#c2f400` | 진한 강조 |

### Secondary (보조 - 시안/하늘)
| Token | Hex | 용도 |
|-------|-----|------|
| `--secondary-200` | `#64d5fb` | **주요 보조 색상** |
| `--secondary-300` | `#00c4f9` | 링크, 정보 |

### Success (성공 - 초록)
| Token | Hex | 용도 |
|-------|-----|------|
| `--success-400` | `#14d450` | **성공 메시지, 상태** |

### Danger (위험 - 주황/빨강)
| Token | Hex | 용도 |
|-------|-----|------|
| `--danger-500` | `#fa5820` | **에러, 삭제, 경고** |

### Warning (경고 - 노랑)
| Token | Hex | 용도 |
|-------|-----|------|
| `--warning-300` | `#fbd564` | **경고 메시지** |

### Neutral - White (투명도 기반)
```scss
--white-100: rgba(255, 255, 255, 1)      // 완전 불투명
--white-75: rgba(255, 255, 255, 0.75)    // 기본 텍스트
--white-60: rgba(255, 255, 255, 0.6)     // 부제목, 보조 텍스트
--white-40: rgba(255, 255, 255, 0.4)     // 라벨, placeholder
--white-30: rgba(255, 255, 255, 0.3)     // 강조 보더
--white-20: rgba(255, 255, 255, 0.2)     // 기본 보더, 스크롤바
--white-10: rgba(255, 255, 255, 0.1)     // 호버 배경
--white-5: rgba(255, 255, 255, 0.05)     // 배경
```

### Neutral - Black (투명도 기반)
```scss
--black-50: rgba(0, 0, 0, 0.5)   // 폼 필드 배경
--black-30: rgba(0, 0, 0, 0.3)   // 텍스트박스 배경
--black-20: rgba(0, 0, 0, 0.2)   // 테이블 행 배경
```

### 그라디언트
```scss
// 메인 그라디언트 (시안 -> 라임)
background: linear-gradient(90deg, #00c4f9 0%, #36d2d4 25%, #6be0af 50%, #a1ed89 75%, #d6fb64 100%);

// 배경 그라디언트 (다크)
background: linear-gradient(287.56deg, #121212 0%, #1F2126 100%);

// 블랙 그라디언트
background: linear-gradient(120deg, #333738 0%, #1a1a1a 100%);
```

### 테이블 색상
```scss
--table-th: #3E3F42          // 헤더
--table-td: #26282B          // 셀
--table-even: #323436        // 짝수 행
--table-selected: #263841    // 선택 행
--table-hover: #2B353B       // 호버
```

---

## 2. 타이포그래피

### 폰트 패밀리
```scss
font-family: "Inter", "Pretendard Std", "Pretendard", "Apple SD Gothic Neo", "Malgun Gothic", sans-serif;
```

### 폰트 사이즈
| Token | Size | 용도 |
|-------|------|------|
| `--font-size-32` | 2rem (32px) | 대제목 |
| `--font-size-24` | 1.5rem (24px) | 제목 |
| `--font-size-20` | 1.25rem (20px) | 중제목 |
| `--font-size-16` | 1rem (16px) | 기본 |
| `--font-size-14` | 0.875rem (14px) | **본문 기본** |
| `--font-size-12` | 0.75rem (12px) | 작은 텍스트, 라벨 |

### 폰트 Weight
```scss
400  // Regular - 본문
500  // Medium - 약간 강조
600  // SemiBold - 부제목
700  // Bold - 제목, 강조
```

---

## 3. 간격 (Spacing)

### 자주 사용하는 간격
```scss
--spacing-4:  0.25rem  (4px)   // 아이콘-텍스트 간격
--spacing-8:  0.5rem   (8px)   // 작은 요소 간격
--spacing-12: 0.75rem  (12px)  // 인라인 요소 간격
--spacing-16: 1rem     (16px)  // 기본 간격
--spacing-20: 1.25rem  (20px)  // 섹션 내 간격
--spacing-24: 1.5rem   (24px)  // 컴포넌트 간격
--spacing-32: 2rem     (32px)  // 섹션 간격
--spacing-40: 2.5rem   (40px)  // 큰 섹션 간격
--spacing-48: 3rem     (48px)  // 페이지 섹션 간격
```

### 레이아웃 변수
```scss
$gnb-width: 17.5rem;           // 280px - 사이드바 너비
$page-padding: 3.125rem;       // 50px - 페이지 패딩
$page-header-height: 6.25rem;  // 100px - 헤더 높이
```

---

## 4. 테두리 (Border)

### Border Radius
```scss
--radius-xl: 1rem     (16px)  // 카드, 모달
--radius-md: 0.5rem   (8px)   // 버튼, 입력필드
--radius-sm: 0.25rem  (4px)   // 작은 요소, 태그
```

### Border 색상
```scss
border: 1px solid var(--white-20);   // 기본 보더
border: 1px solid var(--white-10);   // 연한 보더
border: 1px solid var(--primary-300); // 선택/포커스 상태
```

---

## 5. 그림자 (Shadow)

```scss
// 기본 그림자
box-shadow: 0 0.1875rem 0.125rem 0 rgba(0, 0, 0, 0.06),
            0 0.0625rem 0.125rem 0 rgba(0, 0, 0, 0.1);

// 포커스 하이라이트
box-shadow: 0 0 0.25rem rgba(0, 255, 72, 0.3);
```

---

## 6. 반응형 Breakpoints

```scss
// 대형 모니터 (1920px+)
@media (min-width: 1920px)

// 데스크탑 (1440px ~ 1919px)
@media (min-width: 1440px) and (max-width: 1919px)

// 소형 데스크탑 (1280px ~ 1439px)
@media (min-width: 1280px) and (max-width: 1439px)

// 태블릿 (768px ~ 1279px)
@media (min-width: 768px) and (max-width: 1279px)

// 모바일 (480px ~ 767px)
@media (min-width: 480px) and (max-width: 767px)

// 소형 모바일 (~480px)
@media (max-width: 480px)
```

---

## 7. 애니메이션

```scss
// 기본 트랜지션
transition: all 0.2s linear;

// 보더/배경 트랜지션
transition: border 0.5s linear, background 0.3s linear;

// 호버 이징
transition: 0.2s cubic-bezier(0.55, 0.09, 0.68, 0.53);
```

---

## 8. 유틸리티 클래스

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

## 9. 컴포넌트 스타일 패턴

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
  background: var(--primary-300);
  color: var(--black-100);
  border-radius: var(--radius-md);
  padding: var(--spacing-12) var(--spacing-24);
  font-weight: 600;
}

.btn-primary:hover {
  background: var(--primary-400);
}
```

### 입력 필드
```scss
.input {
  background: var(--black-50);
  border: 1px solid var(--white-20);
  border-radius: var(--radius-md);
  color: var(--white-75);
  padding: var(--spacing-12) var(--spacing-16);
}

.input:focus {
  border-color: var(--primary-300);
  box-shadow: 0 0 0.25rem rgba(0, 255, 72, 0.3);
}
```

### 테이블
```scss
.table th {
  background: var(--table-th);
}

.table td {
  background: var(--table-td);
}

.table tr:nth-child(even) td {
  background: var(--table-even);
}

.table tr:hover td {
  background: var(--table-hover);
}
```

---

## 10. 아이콘

Font Awesome Pro 7.1.0 사용:
```html
<!-- Solid -->
<i class="fa-solid fa-user"></i>

<!-- Regular -->
<i class="fa-regular fa-bell"></i>

<!-- Light -->
<i class="fa-light fa-search"></i>
```

---

## 11. 주요 디자인 원칙

1. **다크 테마 기반**: 배경은 항상 어둡게 (`#121212` ~ `#1F2126`)
2. **투명도 활용**: 흰색/검정 투명도로 계층감 표현
3. **그라디언트 포인트**: 시안~라임 그라디언트로 브랜드 아이덴티티 표현
4. **rem 단위 사용**: 반응형을 위해 px 대신 rem 사용
5. **CSS 변수 활용**: 직접 값 대신 `var(--token)` 사용

---

## 파일 구조

```
src/app/styles/
├── global.scss      # 메인 진입점
├── root.scss        # CSS 변수 정의
├── fonts.scss       # 폰트 정의
├── mixin.scss       # SCSS 믹스인
├── common.scss      # 공통 스타일
├── layout.scss      # 레이아웃 (GNB, 페이지)
├── useful.scss      # 유틸리티 클래스
├── dashboard.scss   # 대시보드 스타일
├── login.scss       # 로그인 페이지
└── modal.scss       # 모달 스타일
```

---

## 디자인 시스템

- **dx-design-system**: `@deepnoid/dx-design-system` v0.1.37
- 위 CSS 변수들은 이 디자인 시스템에서 제공됨
- 추가 커스텀 스타일은 프로젝트 SCSS 파일에서 정의

---

*이 문서는 M4CXR Admin 프로젝트의 스타일 가이드입니다.*
*바이브코딩 시 이 가이드를 참조하여 일관된 디자인을 유지하세요.*
