---
name: backend-spring
description: Java (Spring Boot) 백엔드 프로젝트 구조를 생성합니다. Spring Boot 3, Gradle 빌드, 레이어드 아키텍처(Controller, Service, Repository) 설정을 포함합니다.
user-invocable: true
---

# backend-spring

Java (Spring Boot) 백엔드 프로젝트 구조를 생성합니다.

## 역할
- Spring Boot 3 프로젝트 설정
- Gradle 빌드 설정
- 레이어드 아키텍처 (Controller → Service → Repository)

## 생성 파일

```
backend/
├── src/main/java/com/{project}/
│   ├── controller/
│   ├── service/
│   ├── repository/
│   ├── entity/
│   ├── dto/
│   ├── config/
│   └── Application.java
├── src/main/resources/
│   └── application.yml
├── build.gradle
└── settings.gradle
```

## 치환 규칙

| Placeholder | 치환 값 |
|-------------|--------|
| `com.{project}` | 프로젝트명에서 하이픈 제거 후 소문자 (예: `my-app` → `com.myapp`) |

## 템플릿

[template.md](template.md) - Spring Boot 프로젝트 전체 boilerplate

## 사용법

이 skill은 `/scaffold` 명령어에서 Backend로 "Java (Spring Boot)" 선택 시 자동으로 호출됩니다.
