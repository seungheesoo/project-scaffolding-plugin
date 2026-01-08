#!/bin/bash

# 프로젝트 구조 검증 스크립트
# 스캐폴딩 후 자동 실행되어 생성된 구조를 검증합니다.

PROJECT_DIR="${1:-.}"
ERRORS=0
WARNINGS=0

echo "========================================="
echo "  프로젝트 구조 검증 시작"
echo "========================================="

# 기본 구조 검증
check_base_structure() {
    echo ""
    echo "[기본 구조 검증]"

    local required_files=("README.md" ".gitignore")
    local required_dirs=("config" "docs")

    for file in "${required_files[@]}"; do
        if [ -f "$PROJECT_DIR/$file" ]; then
            echo "  ✓ $file"
        else
            echo "  ✗ $file (누락)"
            ((ERRORS++))
        fi
    done

    for dir in "${required_dirs[@]}"; do
        if [ -d "$PROJECT_DIR/$dir" ]; then
            echo "  ✓ $dir/"
        else
            echo "  ✗ $dir/ (누락)"
            ((ERRORS++))
        fi
    done
}

# Frontend 구조 검증
check_frontend_structure() {
    if [ ! -d "$PROJECT_DIR/frontend" ]; then
        return
    fi

    echo ""
    echo "[Frontend 구조 검증]"

    # TypeScript 설정 확인
    if [ -f "$PROJECT_DIR/frontend/tsconfig.json" ]; then
        echo "  ✓ tsconfig.json (TypeScript 활성화)"
    else
        echo "  ✗ tsconfig.json (TypeScript 필수)"
        ((ERRORS++))
    fi

    # package.json 확인
    if [ -f "$PROJECT_DIR/frontend/package.json" ]; then
        echo "  ✓ package.json"
    else
        echo "  ✗ package.json (누락)"
        ((ERRORS++))
    fi

    # src 디렉토리 또는 app 디렉토리 확인 (Next.js)
    if [ -d "$PROJECT_DIR/frontend/src" ] || [ -d "$PROJECT_DIR/frontend/app" ]; then
        echo "  ✓ 소스 디렉토리"
    else
        echo "  ✗ src/ 또는 app/ 디렉토리 (누락)"
        ((ERRORS++))
    fi
}

# Backend 구조 검증
check_backend_structure() {
    if [ ! -d "$PROJECT_DIR/backend" ]; then
        return
    fi

    echo ""
    echo "[Backend 구조 검증]"

    # Node.js 프로젝트
    if [ -f "$PROJECT_DIR/backend/package.json" ]; then
        echo "  ✓ Node.js 프로젝트 감지"
        if [ -f "$PROJECT_DIR/backend/tsconfig.json" ]; then
            echo "  ✓ TypeScript 활성화"
        fi
    fi

    # Java/Kotlin 프로젝트
    if [ -f "$PROJECT_DIR/backend/build.gradle" ] || [ -f "$PROJECT_DIR/backend/build.gradle.kts" ]; then
        echo "  ✓ Gradle 프로젝트 감지"
    fi

    # Python 프로젝트
    if [ -f "$PROJECT_DIR/backend/requirements.txt" ] || [ -f "$PROJECT_DIR/backend/pyproject.toml" ]; then
        echo "  ✓ Python 프로젝트 감지"
    fi

    # 소스 디렉토리 확인
    if [ -d "$PROJECT_DIR/backend/src" ] || [ -d "$PROJECT_DIR/backend/app" ]; then
        echo "  ✓ 소스 디렉토리"
    else
        echo "  ⚠ 소스 디렉토리 확인 필요"
        ((WARNINGS++))
    fi
}

# Infrastructure 검증
check_infra_structure() {
    echo ""
    echo "[Infrastructure 검증]"

    # Docker
    if [ -f "$PROJECT_DIR/docker-compose.yml" ]; then
        echo "  ✓ docker-compose.yml"
    fi

    if [ -d "$PROJECT_DIR/docker" ]; then
        echo "  ✓ docker/"
    fi

    # GitLab CI
    if [ -f "$PROJECT_DIR/.gitlab-ci.yml" ]; then
        echo "  ✓ .gitlab-ci.yml"
    fi
}

# 결과 출력
print_result() {
    echo ""
    echo "========================================="
    echo "  검증 결과"
    echo "========================================="

    if [ $ERRORS -eq 0 ] && [ $WARNINGS -eq 0 ]; then
        echo "  ✅ 모든 검증 통과"
    else
        if [ $ERRORS -gt 0 ]; then
            echo "  ❌ 오류: $ERRORS 개"
        fi
        if [ $WARNINGS -gt 0 ]; then
            echo "  ⚠️  경고: $WARNINGS 개"
        fi
    fi

    echo "========================================="
}

# 실행
check_base_structure
check_frontend_structure
check_backend_structure
check_infra_structure
print_result

# 오류가 있으면 종료 코드 1 반환
exit $ERRORS
