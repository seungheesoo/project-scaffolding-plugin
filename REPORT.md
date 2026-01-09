# Project Scaffolding Plugin 개발 보고서

## 개요

풀스택 프로젝트의 디렉토리 구조를 자동으로 생성하는 Claude Code 플러그인을 개발하였습니다.

## 지원 스택

| Frontend | Backend | Infra |
|----------|---------|-------|
| React (Vite) | Node.js (Express) | Docker |
| Next.js | Java (Spring Boot) | GitLab CI |
| | Python (FastAPI) | |

## 주요 기능

### 1. `/scaffold` - 프로젝트 구조 생성
- 새 프로젝트 또는 기존 프로젝트에 구조 생성
- **병합 모드**: 기존 프로젝트에 누락된 구조만 추가 (기존 파일 보존)
- 선택한 스택에 따라 디렉토리/파일 자동 생성

### 2. `/workspace` - 작업 영역 선택
- root / frontend / backend 중 선택
- 선택된 workspace의 역할 파일(`.claude/role/`)을 읽고 에이전트 역할 인식
- 컨텍스트 압축 시에도 workspace 정보 유지 (CLAUDE.md)

## 핵심 설계 결정

| 항목 | 결정 | 이유 |
|------|------|------|
| role 파일 위치 | `.claude/role/` | Claude 설정 파일 일관성 |
| 병합 모드 | 기존 폴더에 파일 있으면 자동 건너뛰기 | 프레임워크 판별 불가, 단순화 |
| workspace 정보 유지 | CLAUDE.md Summary instructions | 컨텍스트 압축 시 손실 방지 |
| Infra 처리 | 항목별 개별 처리 | Docker/GitLab CI 독립적 존재 가능 |

## 생성되는 구조

```
{project}/
├── .claude/role/       # workspace별 에이전트 역할 정의
│   ├── root.md
│   ├── frontend.md     # Frontend 선택/존재 시
│   └── backend.md      # Backend 선택/존재 시
├── frontend/           # Frontend 선택 시
├── backend/            # Backend 선택 시
├── docker/             # Docker 선택 시
├── docker-compose.yml  # Docker 선택 시
├── config/.env.example
├── docs/README.md
├── .gitignore
├── .gitlab-ci.yml      # GitLab CI 선택 시
├── README.md
└── CLAUDE.md
```

## 플러그인 구조

```
project-scaffolding-plugin/
├── .claude-plugin/
│   └── plugin.json         # 플러그인 메타데이터
├── commands/
│   ├── scaffold.md         # 프로젝트 생성 명령 (225줄)
│   └── workspace.md        # workspace 선택 명령 (24줄)
├── skills/
│   └── project-scaffolding/
│       └── SKILL.md        # 자연어 트리거 (17줄)
└── README.md               # 사용자 문서
```

## 사용 방법

```bash
# 플러그인 로드
claude --plugin-dir ./project-scaffolding-plugin

# 명령어 실행
/project-scaffolding:scaffold
/project-scaffolding:workspace
```

## 명령어 실행 흐름

### `/scaffold` 실행 시

```
1. 프로젝트 위치/이름 결정
   ├── 인자 있음 → 새 폴더 생성
   └── 인자 없음 → "현재 폴더" / "새 폴더" 질문
       └── 현재 폴더 + 파일 존재 → "병합" / "취소" 질문

2. 스택 선택 (병합 모드: 기존 폴더 자동 건너뛰기)
   ├── Frontend: React (Vite) / Next.js / 사용 안함
   ├── Backend: Node.js (Express) / Java (Spring Boot) / Python (FastAPI) / 사용 안함
   └── Infra: Docker / GitLab CI (다중 선택)

3. 구조 생성 및 완료
   ├── 선택된 스택의 디렉토리/파일 생성
   ├── 병합 모드: "추가됨/건너뜀" 구분 출력
   └── 트리 형태로 결과 출력
```

### `/workspace` 실행 시

```
1. workspace 선택: root / frontend / backend

2. 역할 파일 확인
   ├── .claude/role/{workspace}.md 존재 → 파일 읽고 역할 인식
   └── 파일 없음 → "해당 workspace는 생성되지 않았습니다" 경고

3. 작업 영역 설정
   └── 파일 작업 시 {workspace}/ 경로 우선 사용
```

## 진행 예정 사항

### 1단계: 기본 컨벤션
- [x] 역할 별 코드 컨벤션 정의 (`.claude/role/{workspace}.md`에 추가)
- [x] 각 스택별 코드 예시 작성 (boilerplate 파일 내용)

### 2단계: 상세 코딩 가이드라인 (`.claude/conventions/`)
- [ ] 네이밍 규칙 (변수, 함수, 파일, 컴포넌트/엔티티/모델)
- [ ] 에러 처리 패턴
- [ ] 로깅 표준
- [ ] 테스트 작성 패턴

### 3단계: 아키텍처 패턴 (`.claude/patterns/`)
**Frontend**
- [ ] 컴포넌트 구조 패턴
- [ ] 상태 관리 패턴

**Backend**
- [ ] API 엔드포인트 설계 패턴
- [ ] 서비스 레이어 패턴
- [ ] 데이터베이스/ORM 패턴
- [ ] 미들웨어 패턴
- [ ] 트랜잭션 처리 패턴

**Infra**
- [ ] Docker 구성 패턴
- [ ] CI/CD 파이프라인 패턴
- [ ] 환경별 설정 관리

### 4단계: 통합 가이드 (`.claude/integration/`)
- [ ] Frontend ↔ Backend 통신 규칙
- [ ] API 응답 형식 표준
- [ ] 인증/인가 흐름
- [ ] 에러 전파 방식

### 최종 목표 구조
```
.claude/
├── role/           # workspace별 역할 정의
├── conventions/    # 상세 코딩 규칙
├── patterns/       # 아키텍처 패턴
└── integration/    # 통합 가이드
```

**완료 시 예상**: 100% 바이브코딩 가능

## 제한사항

- 기존 프로젝트의 프레임워크 자동 감지 불가
- workspace 시각적 구분 불가 (터미널 배경색 변경 등 Claude Code에서 미지원)
