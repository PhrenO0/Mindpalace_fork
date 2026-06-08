#!/bin/bash

echo "=== [1/4] Downloading lightweight pip ==="
# 시스템 apt-get 대신 파이썬 자체 스크립트로 pip를 빠르게 다운로드합니다.
curl -sS https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python3 get-pip.py --user

# 설치된 임시 pip 경로를 환경 변수에 등록합니다.
export PATH=$PATH:/home/site/.local/bin
export PYTHONPATH=$PYTHONPATH:/home/site/wwwroot/backend

echo "=== [2/4] Installing Python requirements ==="
# 패키지 설치 진행
python3 -m pip install --user --no-cache-dir -r requirements.txt

echo "=== [3/4] Installing uvicorn specifically ==="
# 혹시 모를 누락을 방지하기 위해 uvicorn을 명시적으로 한 번 더 설치합니다.
python3 -m pip install --user uvicorn

echo "=== [4/4] Starting Uvicorn Server ==="
# backend 폴더 내부의 app.main:app 서버 실행
python3 -m uvicorn app.main:app --host 0.0.0.0 --port 8080
