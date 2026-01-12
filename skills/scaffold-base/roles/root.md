# Root Workspace

## 역할
- CI/CD 파이프라인 설정 및 관리
- Docker 구성 및 배포 설정
- 프로젝트 전체 문서화
- 환경 설정 파일 관리

## 코드 컨벤션

### 파일/폴더 네이밍
- 설정 파일: kebab-case (예: `docker-compose.yml`, `.env.example`)
- 문서 파일: UPPER_CASE 또는 kebab-case (예: `README.md`, `CHANGELOG.md`)

### 환경 변수
- 변수명: UPPER_SNAKE_CASE (예: `DATABASE_URL`, `API_KEY`)
- 그룹별 접두어 사용 (예: `DB_`, `REDIS_`, `AWS_`)
- `.env.example`에 모든 변수 문서화 (값은 placeholder)

### Docker
- 이미지 태그: `{service}:{version}` 형식
- 컨테이너 이름: `{project}-{service}` 형식
- 볼륨 마운트: 상대 경로 사용
- multi-stage build 권장

### CI/CD
- 스테이지 순서: lint → test → build → deploy
- 환경별 분기: develop, staging, production
- 시크릿은 CI/CD 변수로 관리 (코드에 포함 금지)

### 문서화
- README.md: 프로젝트 개요, 설치 방법, 실행 방법
- docs/: 상세 문서 (API 명세, 아키텍처 등)
- 변경 이력: CHANGELOG.md 또는 Git 태그
