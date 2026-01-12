# Python (FastAPI) Boilerplate

## 디렉토리 구조
```
backend/
├── app/
│   ├── __init__.py             
│   ├── api/
│   │   └── __init__.py         
│   ├── core/
│   │   └── __init__.py         
│   ├── models/
│   │   └── __init__.py         
│   ├── schemas/
│   │   └── __init__.py         
│   ├── services/
│   │   └── __init__.py         
│   └── main.py                 
├── tests/
│   └── __init__.py             
├── requirements.txt            
└── pyproject.toml              
```

## backend/requirements.txt
```
fastapi>=0.115.0
uvicorn[standard]>=0.32.0
pydantic>=2.9.0
python-dotenv>=1.0.0
```

## backend/pyproject.toml
```toml
[project]
name = "backend"
version = "0.0.1"
requires-python = ">=3.11"
dependencies = [
    "fastapi>=0.115.0",
    "uvicorn[standard]>=0.32.0",
    "pydantic>=2.9.0",
    "python-dotenv>=1.0.0",
]

[tool.ruff]
line-length = 88
target-version = "py311"

[tool.ruff.lint]
select = ["E", "F", "I"]
```

## backend/app/main.py
```python
from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware

app = FastAPI(title="API", version="0.0.1")

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)


@app.get("/api/health")
def health_check():
    return {"status": "ok"}
```

## backend/app/__init__.py
```python
```

## backend/app/api/__init__.py
```python
```

## backend/app/core/__init__.py
```python
```

## backend/app/models/__init__.py
```python
```

## backend/app/schemas/__init__.py
```python
```

## backend/app/services/__init__.py
```python
```

## backend/tests/__init__.py
```python
```
