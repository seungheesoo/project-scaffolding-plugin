---
description: 작업할 workspace를 선택합니다
argument-hint: [root|frontend|backend]
---

$ARGUMENTS가 있으면 바로 설정. 없으면 질문:

```yaml
questions:
  - header: "Workspace"
    question: "어떤 workspace에서 작업할까요?"
    options:
      - label: "root"
      - label: "frontend"
      - label: "backend"
```

선택 후:
1. `.claude/role/{workspace}.md` 파일 존재 여부 확인
   - 없으면: "해당 workspace는 생성되지 않았습니다" 경고 후 중단
   - 있으면: 파일 읽고 역할 인식
2. 해당 workspace를 현재 작업 영역으로 인식
3. 파일 작업 시 `{workspace}/` 경로 우선 사용 (root는 프로젝트 루트)
