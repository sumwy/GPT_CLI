#!/bin/bash

REPO_URL="https://github.com/sumwy/GPT_CLI.git"
REPO_NAME="GPT_CLI"
INSTALL_DIR="/usr/local/bin"

# 저장소 클론 또는 기존 디렉토리 사용
if [ -d "$REPO_NAME" ]; then
    echo "Directory $REPO_NAME already exists. Using the existing directory."
    cd $REPO_NAME
else
    echo "Cloning the repository..."
    git clone $REPO_URL
    cd $REPO_NAME
fi

# 의존성 설치
if [ -f "requirements.txt" ]; then
    echo "Installing dependencies..."
    pip install -r requirements.txt
else
    echo "ERROR: requirements.txt not found."
    exit 1
fi

# Python 스크립트 복사 및 실행 권한 부여
echo "Copying the script to the installation directory..."
cp GPT_CLI.py $INSTALL_DIR/n2lcmd
chmod +x $INSTALL_DIR/n2lcmd

# OpenAI API 키 입력 요청 및 파일에 저장
read -p "Enter your OpenAI API key: " OPENAI_API_KEY
echo $OPENAI_API_KEY > openai_api_key.txt

# Python 스크립트 실행
python3 $INSTALL_DIR/n2lcmd

echo "Installation and execution completed successfully."
