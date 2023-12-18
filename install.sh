#!/bin/bash

# 사용자에게 OpenAI API 키 입력 요청
read -p "Enter your OpenAI API key: " OPENAI_API_KEY
export OPENAI_API_KEY

# 저장소 URL 및 이름 설정
REPO_URL="https://github.com/sumwy/GPT_CLI.git"
REPO_NAME="gpt_cli"
INSTALL_DIR="/usr/local/bin"

# 저장소가 이미 존재하는지 확인
if [ -d "$REPO_NAME" ]; then
    echo "Directory $REPO_NAME already exists. Using the existing directory."
else
    # 저장소 클론
    echo "Cloning the repository..."
    git clone $REPO_URL
fi

# 클론된 디렉토리로 이동
cd $REPO_NAME

# requirements.txt 파일 존재 여부 확인
if [ -f "requirements.txt" ]; then
    # 필요한 의존성 설치
    echo "Installing dependencies..."
    pip install -r requirements.txt
else
    echo "ERROR: requirements.txt not found. Aborting installation."
    exit 1
fi

# 실행 파일을 적절한 위치에 복사
echo "Copying the script to the installation directory..."
cp script.py $INSTALL_DIR/n2lcmd

# 실행 권한 부여
chmod +x $INSTALL_DIR/n2lcmd

# 설치 완료 메시지
echo "Installation completed successfully. You can run the script using 'n2lcmd' command."
