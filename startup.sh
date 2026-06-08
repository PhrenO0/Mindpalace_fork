#!/bin/bash

echo "=== [1/4] Downloading lightweight pip ==="
# 파이썬 자체 스크립트로 pip 다운로드 및 설치
curl -sS https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python3 get-pip.py --user --break-system-packages

# 설치된 임시 pip 및 백엔드 경로를 환경 변수에 등록
export PATH=$PATH:/home/site/.local/bin
export PYTHONPATH=$PYTHONPATH:/home/site/wwwroot/backend

echo "=== [2/4] Installing Python requirements ==="
# --break-system-packages 옵션을 붙여 외부 관리 환경 차단막을 우회합니다.
python3 -m pip install --user --no-cache-dir --break-system-packages -r requirements.txt

echo "=== [3/4] Installing uvicorn specifically ==="
python3 -m pip install --user --break-system-packages uvicorn

echo "=== [4/4] Starting Uvicorn Server ==="
python3 -m uvicorn app.main:app --host 0.0.0.0 --port 8080
