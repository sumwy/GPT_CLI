#!/bin/bash

# 저장소 주소 및 필요한 변수 설정
REPO_URL="https://github.com/sumwy/GPT_CLI.git"
REPO_NAME="GPT_CLI"
INSTALL_DIR="/usr/local/bin"

# 저장소에서 코드 클론
echo "Cloning the repository..."
git clone $REPO_URL
cd $REPO_NAME

# 필요한 의존성 설치
echo "Installing dependencies..."
pip install -r requirements.txt

# 실행 파일을 적절한 위치에 복사
echo "Copying the script to the installation directory..."
cp GPT_CLI.py $INSTALL_DIR/n2lcmd

# 실행 권한 부여
chmod +x $INSTALL_DIR/n2lcmd

# 설치 완료 메시지
echo "Installation completed successfully. You can run the script using 'n2lcmd' command."
