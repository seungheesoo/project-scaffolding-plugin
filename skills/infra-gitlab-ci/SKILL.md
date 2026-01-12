---
name: infra-gitlab-ci
description: GitLab CI/CD 파이프라인 설정을 추가합니다. .gitlab-ci.yml 파일을 생성하고 lint, test, build, deploy 스테이지를 구성합니다.
user-invocable: true
---

# infra-gitlab-ci

GitLab CI/CD 파이프라인 설정을 추가합니다.

## 역할
- `.gitlab-ci.yml` 생성
- 스테이지: lint → test → build → deploy

## 생성 파일

- `.gitlab-ci.yml`

## 파이프라인 구성

| Frontend | Backend | 파이프라인 특징 |
|----------|---------|----------------|
| 선택 | Node.js | Node.js 캐시, npm lint/test |
| 선택 | Spring Boot | Gradle 캐시, gradle test |
| 선택 | FastAPI | pip 캐시, pytest, ruff |
| 선택 | 사용 안함 | Frontend lint만 |
| 사용 안함 | 선택 | Backend lint/test만 |

## 환경

| 브랜치 | 환경 | 배포 방식 |
|--------|------|----------|
| develop | staging | 자동 |
| main | production | 수동 (when: manual) |

## 템플릿

[template.md](template.md) - GitLab CI 설정 boilerplate

## 사용법

이 skill은 `/scaffold` 명령어에서 Infra "GitLab CI" 선택 시 자동으로 호출됩니다.
