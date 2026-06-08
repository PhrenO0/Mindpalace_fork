#!/bin/bash
# 1. 시스템 pip 설치
apt-get update && apt-get install -y python3-pip

# 2. 파이썬 의존성 패키지 설치
python3 -m pip install -r requirements.txt

# 3. 백엔드 uvicorn 서버 실행
python3 -m uvicorn app.main:app --host 0.0.0.0 --port 8080
