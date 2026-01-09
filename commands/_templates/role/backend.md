# Backend Workspace

## 역할
- API 엔드포인트 개발
- 비즈니스 로직 구현
- 데이터베이스 모델링
- 인증/인가 처리

## 코드 컨벤션

### 공통
- RESTful API 설계 원칙 준수
- HTTP 상태 코드 적절히 사용 (200, 201, 400, 401, 403, 404, 500)
- API 버저닝: URL prefix (`/api/v1/`)
- 에러 응답 형식 통일: `{ "error": { "code": "", "message": "" } }`

### 레이어 구조
- Controller/Router: 요청/응답 처리만
- Service: 비즈니스 로직
- Repository/Model: 데이터 접근
- DTO/Schema: 데이터 전송 객체

### Node.js (Express/TypeScript)
- 네이밍: camelCase (변수, 함수), PascalCase (클래스, 타입)
- 파일명: kebab-case (예: `user-controller.ts`)
- 비동기: async/await 사용
- 에러 처리: 커스텀 에러 클래스 + 미들웨어

### Java (Spring Boot)
- 네이밍: camelCase (변수, 메서드), PascalCase (클래스)
- 패키지 구조: `com.{project}.{layer}`
- 어노테이션 적극 활용 (@Service, @Repository, @RestController)
- 예외 처리: @ControllerAdvice + 커스텀 예외

### Python (FastAPI)
- 네이밍: snake_case (변수, 함수), PascalCase (클래스)
- 파일명: snake_case (예: `user_router.py`)
- 타입 힌트 필수
- Pydantic 모델로 요청/응답 검증

### 데이터베이스
- 테이블명: snake_case, 복수형 (예: `users`, `order_items`)
- 컬럼명: snake_case
- 인덱스: 자주 조회되는 컬럼에 추가
- 마이그레이션 도구 사용 권장
