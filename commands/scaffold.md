---
description: 풀스택 프로젝트 디렉토리 구조를 빠르게 생성합니다
argument-hint: [project-name]
---

## 규칙
- Frontend: TypeScript 필수
- Git: GitLab 사용
- 프로젝트 이름: kebab-case
- 템플릿 경로: `@_templates/...` 형식으로 참조 (플러그인 번들 파일, 사용자 PC 탐색 금지)
- 폴더 구조 생성: boilerplate 템플릿 파일 내용을 그대로 복사하여 생성
- 파일 존재 판단 (대상 폴더만 해당): 숨김 파일(`.gitignore` 등) 제외, 실제 소스 파일 1개 이상 존재 시 "파일 있음"으로 판단
- 소스 파일 정의: `.ts`, `.tsx`, `.js`, `.jsx`, `.java`, `.py`, `.json`, `.yml`, `.yaml`, `.gradle`, `.xml` 확장자

### 치환 규칙
문서 내 placeholder는 실제 값으로 치환:
| Placeholder | 치환 값 | 예시 |
|-------------|--------|------|
| `{project}` | 프로젝트명 (kebab-case) | `my-app` |
| `{project-pascal}` | 프로젝트명 (PascalCase) | `MyApp` |

**Java (Spring Boot) 전용 치환**:
| Placeholder | 치환 값 | 예시 |
|-------------|--------|------|
| `com.{project}` | 프로젝트명에서 하이픈 제거 후 소문자 | `my-app` → `com.myapp` |

- 파일 경로: `backend/src/main/java/com/{project}/` → `backend/src/main/java/com/myapp/`
- 패키지 선언: `package com.{project};` → `package com.myapp;`

---

## 프로세스

> **$ARGUMENTS**: 사용자가 명령어와 함께 전달한 인자 (예: `/scaffold my-project`에서 `my-project`)

### 1. 프로젝트 위치/이름 결정

**$ARGUMENTS 있음** → 해당 이름으로 새 폴더 생성, 2단계로 이동

**$ARGUMENTS 없음** → 질문:
```yaml
questions:
  - header: "생성 위치"
    question: "프로젝트를 어디에 생성할까요?"
    options:
      - label: "현재 폴더에 생성"
      - label: "새 폴더 생성"
```

- **현재 폴더 선택**: 현재 디렉토리명 = 프로젝트명
  - 폴더가 비어있지 않으면 모드 선택:
    ```yaml
    questions:
      - header: "생성 모드"
        question: "폴더에 파일이 존재합니다. 어떻게 진행할까요?"
        options:
          - label: "병합 (누락된 구조만 추가)"
          - label: "취소"
    ```
  - **병합 모드**: 존재하지 않는 파일/폴더만 생성, 기존 파일 유지
- **새 폴더 선택**: 텍스트 입력으로 프로젝트 이름 질문 → 해당 이름으로 폴더 생성
  ```yaml
  questions:
    - header: "프로젝트 이름"
      question: "프로젝트 이름을 입력하세요 (kebab-case)"
      type: text
  ```

### 2. 스택 선택

**병합 모드 처리**:
1. 각 폴더/파일 존재 및 내용 확인
2. 파일이 있으면 자동 건너뛰기 (role 파일은 생성)
   - `frontend/`에 파일 있음 → Frontend = "기존 유지", Theme/MSW 질문 건너뛰기
   - `backend/`에 파일 있음 → Backend = "기존 유지"
   - Infra: 각 항목별 개별 처리
     - `docker/`에 파일 있음 → Docker 옵션 제외
     - `.gitlab-ci.yml` 존재 → GitLab CI 옵션 제외
     - 둘 다 해당 → Infra 질문 건너뛰기
3. 폴더가 없거나 비어있으면 → 아래 일반 질문 진행

**일반 모드 또는 폴더가 비어있는 경우**:
```yaml
questions:
  - header: "Frontend"
    question: "Frontend 프레임워크를 선택하세요"
    options:
      - label: "React (Vite)"
      - label: "Next.js"
      - label: "사용 안함"

  # Frontend 선택 시에만 표시
  - header: "Theme"
    question: "스타일 테마를 선택하세요"
    condition: Frontend != "사용 안함"
    options:
      - label: "shadcn/ui Neutral"
        description: "shadcn/ui 기본 테마, 라이트/다크 모드 지원"
      - label: "Lime-Cyan Dark"
        description: "라임-시안 그래디언트, 다크 모드 전용"

  - header: "Backend"
    question: "Backend 프레임워크를 선택하세요"
    options:
      - label: "Node.js (Express)"
      - label: "Java (Spring Boot)"
      - label: "Python (FastAPI)"
      - label: "사용 안함"

  # Frontend 선택 시에만 표시
  - header: "MSW"
    question: "API Mocking을 설정할까요?"
    condition: Frontend != "사용 안함"
    options:
      - label: "MSW 설정"
        description: "Mock Service Worker로 API 모킹 환경 구성 (Backend 선택 시 disabled 상태로 생성)"
      - label: "사용 안함"

  # Frontend 또는 Backend 선택 시에만 표시
  - header: "Infra"
    question: "추가 옵션을 선택하세요"
    condition: Frontend != "사용 안함" OR Backend != "사용 안함"
    multiSelect: true
    options:
      - label: "Docker"
      - label: "GitLab CI"
```

### 3. 구조 생성 및 완료

- 선택된 스택의 디렉토리/파일 생성
- **병합 모드**: 존재하는 파일 건너뛰고, 완료 후 "추가됨/건너뜀" 구분 출력
- 트리 형태로 결과 출력

---

## 디렉토리 구조

### 기본 (항상 생성)
```
{project}/
├── .claude/role/root.md
├── .claude/style-guide.md      # Frontend 선택 시
├── config/.env.example
├── docs/README.md
├── .gitignore
├── README.md
└── CLAUDE.md
```

각 스택의 디렉토리 구조는 해당 템플릿 파일의 `## 디렉토리 구조` 섹션 참조.

---

## 템플릿 파일 참조

### 템플릿 파일 해석 규칙

**boilerplate 템플릿 구조**:
```markdown
## {파일경로}
```코드```
```

**파일 생성 방법**:
1. 템플릿 파일에서 `## ` 로 시작하는 헤딩을 찾음 (코드 블록 내부 제외)
2. 헤딩 텍스트 = 생성할 파일 경로 (예: `## frontend/package.json` → `frontend/package.json`)
3. 헤딩 바로 아래 코드 블록(``` 또는 ```언어)의 내용을 파일로 생성
4. 다음 `## ` 헤딩까지 반복

**예외 처리**:
- `## 디렉토리 구조` 섹션: 파일 생성 안함 (참고용)
- 괄호 포함 헤딩: 조건부 생성, 파일 경로는 ` (` 앞까지만 사용
  - 예: `## docker/Dockerfile.frontend (React/Vite 선택 시)` → 파일 경로: `docker/Dockerfile.frontend`

### role 파일
| 생성 대상 | 템플릿 파일 | 생성 조건 |
|----------|------------|----------|
| `.claude/role/root.md` | `@_templates/role/root.md` | 항상 |
| `.claude/role/frontend.md` | `@_templates/role/frontend.md` | Frontend 선택 또는 `frontend/` 존재 |
| `.claude/role/backend.md` | `@_templates/role/backend.md` | Backend 선택 또는 `backend/` 존재 |

**참고**: role 파일은 병합 모드에서도 항상 덮어씁니다 (컨벤션 동기화)

### 공통 파일
`@_templates/boilerplate/common.md` 파일에서 각 `## 파일경로` 섹션의 코드 블록 추출:
| 생성 대상 | 템플릿 섹션 헤딩 |
|----------|----------------|
| `config/.env.example` | `## config/.env.example` |
| `.gitignore` | `## .gitignore` |
| `README.md` | `## README.md (프로젝트 루트)` |
| `docs/README.md` | `## docs/README.md` |
| `CLAUDE.md` | `## CLAUDE.md` |

### Frontend boilerplate
| 선택 | 템플릿 파일 |
|------|------------|
| React (Vite) | `@_templates/boilerplate/react.md` |
| Next.js | `@_templates/boilerplate/nextjs.md` |

### 테마 적용 규칙

**테마 파일 매핑**:
| 테마 선택 | 템플릿 파일 |
|----------|------------|
| shadcn/ui Neutral | `@_templates/themes/neutral.md` |
| Lime-Cyan Dark | `@_templates/themes/lime-cyan-dark.md` |

**CSS 변수 적용** (테마 파일에 `## CSS 변수` 섹션이 있는 경우만):
1. `global.css` 생성 시:
   - boilerplate의 `@tailwind` 지시문 3줄 유지
   - 첫 번째 `@layer base` 블록 (`:root` 포함, CSS 변수 정의) → 테마의 `## CSS 변수` 내용으로 **교체**
   - 두 번째 `@layer base` 블록 (`*`, `body` 포함, 기본 스타일) → 그대로 유지
2. `tailwind.config.ts` 생성 시, `## Tailwind 확장 색상` 섹션이 있으면 `colors` 객체 끝에 **추가**

**global.css 경로** (프레임워크별):
| Frontend | global.css 경로 |
|----------|----------------|
| React (Vite) | `frontend/src/app/styles/global.css` |
| Next.js | `frontend/src/shared/styles/global.css` |

**병합 모드**: 기존 `frontend/`가 있으면 테마 적용 안함 (기존 스타일 유지)

**스타일 가이드 생성**:
- 조건: Frontend 선택 + 테마 파일에 `## 스타일 가이드` 섹션 존재
- 생성 파일: `.claude/style-guide.md`
- 내용: 테마 파일의 `## 스타일 가이드` 헤딩(포함)부터 파일 끝까지 복사
- **병합 모드**: 기존 `frontend/`가 있으면 생성 안함 (기존 스타일 유지)

### MSW boilerplate
`@_templates/boilerplate/msw.md`에서 Frontend 선택에 따라 해당 파일 생성:

**병합 모드**: 기존 `frontend/`가 있으면 MSW 질문 자체를 건너뛰므로 생성 안함

**MSW 설정 선택 시**:
| 생성 대상 | 템플릿 섹션 헤딩 |
|----------|----------------|
| `frontend/src/mocks/handlers.ts` | `## frontend/src/mocks/handlers.ts` |
| `frontend/src/mocks/browser.ts` | `## frontend/src/mocks/browser.ts` |
| `frontend/src/mocks/index.ts` | 아래 조건 참조 |

**index.ts 선택 규칙**:
| 조건 | 생성할 섹션 |
|-----|-----------|
| React + Backend 사용 안함 | `## frontend/src/mocks/index.ts` |
| React + Backend 선택 | `## frontend/src/mocks/index.ts (disabled)` |
| Next.js + Backend 사용 안함 | `## frontend/src/mocks/index.ts (Next.js)` |
| Next.js + Backend 선택 | `## frontend/src/mocks/index.ts (Next.js, disabled)` |

**Entry 파일 덮어쓰기**:
| 조건 | 생성할 섹션 | 덮어쓸 파일 |
|-----|-----------|------------|
| React + Backend 사용 안함 | `## frontend/src/main.tsx (React, MSW)` | `frontend/src/main.tsx` |
| React + Backend 선택 | `## frontend/src/main.tsx (React, MSW, disabled)` | `frontend/src/main.tsx` |
| Next.js + Backend 사용 안함 | `## frontend/app/layout.tsx (Next.js, MSW)` | `frontend/app/layout.tsx` |
| Next.js + Backend 선택 | `## frontend/app/layout.tsx (Next.js, MSW, disabled)` | `frontend/app/layout.tsx` |

**Next.js 추가 생성** (MSWProvider 컴포넌트):
| 조건 | 생성할 섹션 |
|-----|-----------|
| Next.js + Backend 사용 안함 | `## frontend/app/providers/MSWProvider.tsx (Next.js, MSW)` |
| Next.js + Backend 선택 | `## frontend/app/providers/MSWProvider.tsx (Next.js, MSW, disabled)` |

### Backend boilerplate
| 선택 | 템플릿 파일 |
|------|------------|
| Node.js (Express) | `@_templates/boilerplate/express.md` |
| Java (Spring Boot) | `@_templates/boilerplate/spring.md` |
| Python (FastAPI) | `@_templates/boilerplate/fastapi.md` |

### Infra boilerplate

#### Docker 파일 선택 규칙
`@_templates/boilerplate/docker.md`에서 스택 선택에 따라 해당 Dockerfile 생성:

| Frontend 선택 | 생성할 섹션 |
|--------------|-----------|
| React (Vite) | `## docker/Dockerfile.frontend (React/Vite 선택 시)` |
| Next.js | `## docker/Dockerfile.frontend (Next.js 선택 시)` |
| 기존 유지 / 사용 안함 | 생성 안함 |

| Backend 선택 | 생성할 섹션 |
|-------------|-----------|
| Node.js (Express) | `## docker/Dockerfile.backend (Node.js 선택 시)` |
| Java (Spring Boot) | `## docker/Dockerfile.backend (Spring Boot 선택 시)` |
| Python (FastAPI) | `## docker/Dockerfile.backend (FastAPI 선택 시)` |
| 기존 유지 / 사용 안함 | 생성 안함 |

**nginx.conf**:
- React (Vite) 선택 시: `## docker/nginx.conf (React/Vite 선택 시)` 생성
- 그 외: 생성 안함

**docker-compose.yml 선택 규칙**:
| Frontend | Backend | 생성할 섹션 |
|----------|---------|-----------|
| React | 선택 | `## docker-compose.yml (React + Backend 선택 시)` |
| Next.js | 선택 | `## docker-compose.yml (Next.js + Backend 선택 시)` |
| React | 사용 안함/기존 유지 | `## docker-compose.yml (React만 선택 시)` |
| Next.js | 사용 안함/기존 유지 | `## docker-compose.yml (Next.js만 선택 시)` |
| 사용 안함/기존 유지 | 선택 | `## docker-compose.yml (Backend만 선택 시)` |
| 기존 유지 | 기존 유지 | 생성 안함 |

#### GitLab CI 선택 규칙
`@_templates/boilerplate/gitlab-ci.md`에서 스택 선택에 따라 해당 템플릿 생성:

| Frontend | Backend | 생성할 섹션 |
|----------|---------|-----------|
| 선택 | Node.js | `## .gitlab-ci.yml (Node.js Backend 선택 시)` |
| 선택 | Spring Boot | `## .gitlab-ci.yml (Spring Boot 선택 시)` |
| 선택 | FastAPI | `## .gitlab-ci.yml (FastAPI 선택 시)` |
| 선택 | 사용 안함/기존 유지 | `## .gitlab-ci.yml (Frontend만 선택 시)` |
| 사용 안함/기존 유지 | Node.js | `## .gitlab-ci.yml (Node.js Backend만 선택 시)` |
| 사용 안함/기존 유지 | Spring Boot | `## .gitlab-ci.yml (Spring Boot Backend만 선택 시)` |
| 사용 안함/기존 유지 | FastAPI | `## .gitlab-ci.yml (FastAPI Backend만 선택 시)` |
| 기존 유지 | 기존 유지 | 생성 안함 |

---

## 생성 순서

1. 기본 구조 (`@_templates/boilerplate/common.md`)
2. role 파일 (`@_templates/role/*.md`)
3. Frontend + 테마 + 스타일 가이드
4. MSW (`@_templates/boilerplate/msw.md`)
5. Backend
6. Docker (`@_templates/boilerplate/docker.md`)
7. GitLab CI (`@_templates/boilerplate/gitlab-ci.md`)
8. 결과 트리 출력
