---
description: 풀스택 프로젝트 디렉토리 구조를 빠르게 생성합니다
argument-hint: [project-name]
---

## 규칙
- Frontend: TypeScript 필수
- Git: GitLab 사용
- 프로젝트 이름: kebab-case
- 폴더 구조 생성: boilerplate 템플릿 파일 내용을 그대로 복사하여 생성
- 파일 존재 판단: 숨김 파일(`.gitignore` 등) 제외, 실제 소스 파일 1개 이상 존재 시 "파일 있음"으로 판단
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
├── config/.env.example
├── docs/README.md
├── .gitignore
├── README.md
└── CLAUDE.md
```

각 스택의 디렉토리 구조는 해당 템플릿 파일의 `## 디렉토리 구조` 섹션 참조.

---

## 템플릿 파일 참조

선택된 스택에 따라 해당 템플릿 파일을 읽고, 파일 내용을 그대로 생성합니다.

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
| `.claude/role/root.md` | `_templates/role/root.md` | 항상 |
| `.claude/role/frontend.md` | `_templates/role/frontend.md` | Frontend 선택 또는 `frontend/` 존재 |
| `.claude/role/backend.md` | `_templates/role/backend.md` | Backend 선택 또는 `backend/` 존재 |

**참고**: role 파일은 병합 모드에서도 항상 덮어씁니다 (컨벤션 동기화)

### 공통 파일
`_templates/boilerplate/common.md` 파일에서 각 `## 파일경로` 섹션의 코드 블록 추출:
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
| React (Vite) | `_templates/boilerplate/react.md` |
| Next.js | `_templates/boilerplate/nextjs.md` |

### 테마 적용 규칙

**테마 파일 매핑**:
| 테마 선택 | 템플릿 파일 |
|----------|------------|
| shadcn/ui Neutral | 없음 (boilerplate 그대로 사용) |
| Lime-Cyan Dark | `_templates/themes/lime-cyan-dark.md` |

**테마 적용 방법** (shadcn/ui Neutral 제외):
1. Frontend boilerplate 전체 생성
2. `global.css`의 첫 번째 `@layer base { ... }` 블록 전체를 테마의 `## CSS 변수` 섹션 내용으로 **교체**
3. 테마에 `## Tailwind 확장 색상` 섹션이 있으면, `tailwind.config.ts`의 `theme.extend.colors`에서 `destructive` 블록 닫는 `},` 바로 다음 줄에 해당 색상 **삽입**

**global.css 경로** (프레임워크별):
| Frontend | global.css 경로 |
|----------|----------------|
| React (Vite) | `frontend/src/app/styles/global.css` |
| Next.js | `frontend/src/shared/styles/global.css` |

**병합 모드**: 기존 `frontend/`가 있으면 테마 적용 안함 (기존 스타일 유지)

### MSW boilerplate
`_templates/boilerplate/msw.md`에서 Frontend 선택에 따라 해당 파일 생성:

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

**주의**: MSW 초기화 코드는 사용자가 직접 추가해야 함 (entry 파일에 `initMocks()` 호출)

### Backend boilerplate
| 선택 | 템플릿 파일 |
|------|------------|
| Node.js (Express) | `_templates/boilerplate/express.md` |
| Java (Spring Boot) | `_templates/boilerplate/spring.md` |
| Python (FastAPI) | `_templates/boilerplate/fastapi.md` |

### Infra boilerplate

#### Docker 파일 선택 규칙
`_templates/boilerplate/docker.md`에서 스택 선택에 따라 해당 Dockerfile 생성:

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

**docker-compose.yml 선택 규칙**:
| 조건 | 생성할 섹션 |
|-----|-----------|
| Frontend + Backend 모두 선택 | `## docker-compose.yml (Frontend + Backend 선택 시)` |
| Frontend만 선택 (Backend 사용 안함/기존 유지) | `## docker-compose.yml (Frontend만 선택 시)` |
| Backend만 선택 (Frontend 사용 안함/기존 유지) | `## docker-compose.yml (Backend만 선택 시)` |
| 둘 다 기존 유지 | 생성 안함 |

**Next.js 선택 시 추가 조정**: docker-compose.yml의 frontend 포트를 `"80:3000"`으로 변경

#### GitLab CI 선택 규칙
`_templates/boilerplate/gitlab-ci.md`에서 스택 선택에 따라 해당 템플릿 생성:

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

1. 기본 구조 (`common.md`)
2. role 파일
3. Frontend + 테마
4. MSW
5. Backend
6. Docker
7. GitLab CI
8. 결과 트리 출력
