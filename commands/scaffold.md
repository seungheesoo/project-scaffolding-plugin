---
description: 풀스택 프로젝트 디렉토리 구조를 빠르게 생성합니다
argument-hint: [project-name]
---

## 규칙
- Frontend: TypeScript 필수
- Git: GitLab 사용
- 프로젝트 이름: kebab-case
- 폴더 구조만 생성 (파일 내용은 빈 파일 또는 최소 boilerplate)

## 프로세스

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
- **새 폴더 선택**: 이름 입력받아 생성

### 2. 스택 선택

**병합 모드 처리**:
1. 각 폴더/파일 존재 및 내용 확인
2. 파일이 있으면 자동 건너뛰기 (role 파일은 생성)
   - `frontend/`에 파일 있음 → Frontend 질문 건너뛰기
   - `backend/`에 파일 있음 → Backend 질문 건너뛰기
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
      - label: "Vue 3 (Vite)"
      - label: "사용 안함"

  - header: "Backend"
    question: "Backend 프레임워크를 선택하세요"
    options:
      - label: "Node.js (Express)"
      - label: "Java (Spring Boot)"
      - label: "Python (FastAPI)"
      - label: "사용 안함"

  - header: "Infra"
    question: "추가 옵션을 선택하세요"
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

### 기본 (항상)
```
{project}/
├── .claude/role/root.md
├── config/.env.example
├── docs/README.md
├── .gitignore
├── README.md
└── CLAUDE.md
```

**role 파일 생성 규칙**:
- `.claude/role/root.md` - 항상 생성
- `.claude/role/frontend.md` - Frontend 선택 시 또는 `frontend/` 폴더 존재 시 생성
- `.claude/role/backend.md` - Backend 선택 시 또는 `backend/` 폴더 존재 시 생성

### CLAUDE.md 내용
```markdown
# Summary instructions

압축 시 현재 workspace 선택 정보를 유지하세요.
```

### .claude/role/root.md 내용
```markdown
# Root Workspace

- CI/CD 파이프라인 설정 및 관리
- Docker 구성 및 배포 설정
- 프로젝트 전체 문서화
- 환경 설정 파일 관리
```

### .claude/role/frontend.md 내용
```markdown
# Frontend Workspace

- UI 컴포넌트 개발
- 페이지 및 라우팅 구현
- 상태 관리 및 API 연동
- 스타일링 및 반응형 처리
```

### .claude/role/backend.md 내용
```markdown
# Backend Workspace

- API 엔드포인트 개발
- 비즈니스 로직 구현
- 데이터베이스 모델링
- 인증/인가 처리
```

### React (Vite)
```
frontend/
├── src/{components,pages,hooks,services,stores,types,utils}/
├── src/App.tsx
├── src/main.tsx
├── public/
├── index.html
├── package.json
├── vite.config.ts
└── tsconfig.json
```

### Next.js
```
frontend/
├── app/{layout.tsx,page.tsx}
├── components/
├── lib/
├── types/
├── public/
├── package.json
├── next.config.ts
└── tsconfig.json
```

### Vue 3 (Vite)
```
frontend/
├── src/{components,views,composables,stores,types,utils}/
├── src/App.vue
├── src/main.ts
├── public/
├── index.html
├── package.json
├── vite.config.ts
└── tsconfig.json
```

### Node.js (Express)
```
backend/
├── src/{controllers,services,models,routes,middlewares,utils}/
├── src/app.ts
├── src/index.ts
├── tests/
├── package.json
└── tsconfig.json
```

### Java (Spring Boot)
```
backend/
├── src/main/java/com/{project}/{controller,service,repository,entity,dto,config}/
├── src/main/java/com/{project}/Application.java
├── src/main/resources/application.yml
├── src/test/
├── build.gradle
└── settings.gradle
```

### Python (FastAPI)
```
backend/
├── app/{api,core,models,schemas,services}/
├── app/main.py
├── tests/
├── requirements.txt
└── pyproject.toml
```

### Docker
```
docker/{Dockerfile.frontend,Dockerfile.backend,nginx.conf}
docker-compose.yml
```

### GitLab CI
```
.gitlab-ci.yml
```
