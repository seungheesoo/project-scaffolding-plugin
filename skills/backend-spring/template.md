# Java (Spring Boot) Boilerplate

## 디렉토리 구조
```
backend/
├── src/main/java/com/{project}/
│   ├── controller/
│   │   └── HealthController.java   
│   ├── service/
│   ├── repository/
│   ├── entity/
│   ├── dto/
│   ├── config/
│   └── Application.java            
├── src/main/resources/
│   └── application.yml             
├── src/test/
├── build.gradle                    
└── settings.gradle                 
```

## backend/build.gradle
```groovy
plugins {
    id 'java'
    id 'org.springframework.boot' version '3.3.0'
    id 'io.spring.dependency-management' version '1.1.6'
}

group = 'com.{project}'
version = '0.0.1-SNAPSHOT'

java {
    toolchain {
        languageVersion = JavaLanguageVersion.of(21)
    }
}

repositories {
    mavenCentral()
}

dependencies {
    implementation 'org.springframework.boot:spring-boot-starter-web'
    implementation 'org.springframework.boot:spring-boot-starter-validation'
    compileOnly 'org.projectlombok:lombok'
    annotationProcessor 'org.projectlombok:lombok'
    testImplementation 'org.springframework.boot:spring-boot-starter-test'
}

tasks.named('test') {
    useJUnitPlatform()
}
```

## backend/settings.gradle
```groovy
rootProject.name = 'backend'
```

## backend/src/main/resources/application.yml
```yaml
server:
  port: 3000

spring:
  application:
    name: backend
```

## backend/src/main/java/com/{project}/Application.java
```java
package com.{project};

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class Application {
    public static void main(String[] args) {
        SpringApplication.run(Application.class, args);
    }
}
```

## backend/src/main/java/com/{project}/controller/HealthController.java
```java
package com.{project}.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;

@RestController
public class HealthController {
    @GetMapping("/api/health")
    public Map<String, String> health() {
        return Map.of("status", "ok");
    }
}
```
