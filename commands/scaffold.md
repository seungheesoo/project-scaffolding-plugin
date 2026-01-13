---
description: 풀스택 프로젝트 디렉토리 구조를 빠르게 생성합니다
argument-hint: [project-name]
---

## 규칙
- Frontend: TypeScript 필수
- Git: GitLab 사용
- 프로젝트 이름: kebab-case
- 폴더 구조 생성: Skill 도구로 각 스킬 호출하여 생성
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

  # Frontend 선택 시에만 표시 (반드시 아래 옵션 중 하나만 선택, Other/직접입력 옵션 제공하지 않음)
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

---

## Skill 호출 규칙

### 스킬 호출 방법

**각 스킬은 Skill 도구를 사용하여 호출합니다.**

**호출 형식**:
```
Skill("project-scaffolding:{skill-name}")
```

**예시**:
- `Skill("project-scaffolding:scaffold-base")` - 기본 파일 생성
- `Skill("project-scaffolding:frontend-react")` - React 프로젝트 생성
- `Skill("project-scaffolding:backend-express")` - Express 백엔드 생성

**중요**: 반드시 Skill 도구로 스킬을 호출하세요. 플러그인 내부 파일에 직접 접근하지 마세요.

### Skill 호출 순서

| 순서 | Skill | 호출 조건 |
|------|-------|----------|
| 1 | `scaffold-base` | 항상 |
| 2 | `frontend-react` | Frontend = "React (Vite)" |
| 2 | `frontend-nextjs` | Frontend = "Next.js" |
| 3 | `theme-neutral` | Frontend 선택 + Theme = "shadcn/ui Neutral" |
| 3 | `theme-lime-cyan` | Frontend 선택 + Theme = "Lime-Cyan Dark" |
| 4 | `backend-express` | Backend = "Node.js (Express)" |
| 4 | `backend-spring` | Backend = "Java (Spring Boot)" |
| 4 | `backend-fastapi` | Backend = "Python (FastAPI)" |
| 5 | `addon-msw` | Frontend 선택 + MSW = "MSW 설정" |
| 6 | `infra-docker` | Infra에 "Docker" 포함 |
| 7 | `infra-gitlab-ci` | Infra에 "GitLab CI" 포함 |

### role 파일 생성 조건
| 생성 대상 | 호출 조건 |
|----------|----------|
| `.claude/role/root.md` | 항상 |
| `.claude/role/frontend.md` | Frontend 선택 또는 `frontend/` 존재 |
| `.claude/role/backend.md` | Backend 선택 또는 `backend/` 존재 |

**참고**: role 파일은 병합 모드에서도 항상 덮어씁니다 (컨벤션 동기화)

### 테마 적용 규칙

각 테마 skill의 `## 적용 규칙` 참조.

**병합 모드**: 기존 `frontend/`가 있으면 테마 적용 안함 (기존 스타일 유지)

### MSW 적용 규칙

**병합 모드**: 기존 `frontend/`가 있으면 MSW 질문 자체를 건너뛰므로 생성 안함

**MSW 설정 선택 시** (`addon-msw` skill 호출):

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

### Docker 적용 규칙

**Dockerfile.frontend 선택 규칙**:
| Frontend 선택 | 생성할 섹션 |
|--------------|-----------|
| React (Vite) | `## docker/Dockerfile.frontend (React/Vite 선택 시)` |
| Next.js | `## docker/Dockerfile.frontend (Next.js 선택 시)` |
| 기존 유지 / 사용 안함 | 생성 안함 |

**Dockerfile.backend 선택 규칙**:
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

### GitLab CI 적용 규칙

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

### Speckit 초기화 규칙

| `specify --help` 결과 | 동작 |
|----------------------|------|
| 성공 | `{project}/`에서 `specify init --here --ai claude --no-git` 실행 |
| 실패 | 건너뜀 |

---

## 생성 순서

1. 기본 구조 (`scaffold-base` skill)
2. role 파일 (`scaffold-base` skill의 roles/)
3. Frontend + 테마 + 스타일 가이드
4. MSW (`addon-msw` skill)
5. Backend
6. Docker (`infra-docker` skill)
7. GitLab CI (`infra-gitlab-ci` skill)
8. Speckit 초기화
9. 결과 트리 출력
