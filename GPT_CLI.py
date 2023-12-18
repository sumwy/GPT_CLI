import openai

# 사용자에게 OpenAI API 키 입력 요청
read -p "Enter your OpenAI API key: " OPENAI_API_KEY
export OPENAI_API_KEY

def translate_to_command(user_input):
    openai.api_key = 'YOUR_OPENAI_API_KEY'  # 여기에 OpenAI API 키를 입력하세요.

    try:
        # OpenAI GPT 모델에 쿼리를 전송하고, 결과를 받습니다.
        response = openai.Completion.create(
            engine="davinci",  # 다른 엔진을 사용할 수도 있습니다.
            prompt=(
                f"자연어 명령을 리눅스 명령어로 변환하세요: '{user_input}'\n\n"
                "예시들:\n"
                "- '파일 목록을 보여줘' -> 'ls'\n"
                "- '홈 디렉토리로 이동해줘' -> 'cd ~'\n"
                "- '현재 디렉토리가 어디야?' -> 'pwd'\n"
                "- 'file.txt를 backup.txt로 복사해줘' -> 'cp file.txt backup.txt'\n"
                "- 'file.txt를 문서 폴더로 이동시켜줘' -> 'mv file.txt ~/Documents'\n"
                "- 'file.txt를 삭제해줘' -> 'rm file.txt'\n"
                "- 'myfolder라는 새 폴더를 만들어줘' -> 'mkdir myfolder'\n"
                "- 'myfolder라는 빈 폴더를 삭제해줘' -> 'rmdir myfolder'\n"
                "- 'newfile.txt라는 새 파일을 만들어줘' -> 'touch newfile.txt'\n"
                "- 'file.txt에서 'hello'를 찾아줘' -> 'grep \"hello\" file.txt'\n"
            ),
            max_tokens=60
        )

        # 변환된 결과를 추출합니다.
        result = response.choices[0].text.strip()
        return result
    except Exception as e:
        print(f"오류: {e}")
        return None

# 사용자 입력 예시
user_input = "파일 목록을 보여줘"
command = translate_to_command(user_input)
print(f"변환된 명령어: {command}")
