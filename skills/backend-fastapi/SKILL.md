---
name: backend-fastapi
description: Python (FastAPI) 백엔드 프로젝트 구조를 생성합니다. Pydantic 모델, 레이어드 아키텍처(Router, Service, Repository) 설정을 포함합니다.
user-invocable: true
---

# backend-fastapi

Python (FastAPI) 백엔드 프로젝트 구조를 생성합니다.

## 역할
- FastAPI 프로젝트 설정
- Pydantic 모델 설정
- 레이어드 아키텍처 (Router → Service → Repository)

## 생성 파일

```
backend/
├── app/
│   ├── routers/
│   ├── services/
│   ├── repositories/
│   ├── models/
│   ├── schemas/
│   ├── config/
│   └── main.py
├── requirements.txt
└── pyproject.toml
```

## 템플릿

[template.md](template.md) - FastAPI 프로젝트 전체 boilerplate

## 사용법

이 skill은 `/scaffold` 명령어에서 Backend로 "Python (FastAPI)" 선택 시 자동으로 호출됩니다.
