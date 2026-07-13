# Learning Log

## 2026-07-03

- Reorganized the workspace so source files and build outputs are separated.
- Confirmed the difference between source code and compiled executables.

## 2026-07-10

- Reviewed the current `cncpp` workspace structure and confirmed it is an early-stage C/C++ study repository.
- Identified that `src/day01/practice.c` contains a basic C variable/output example, while `practice.cpp` is still empty.
- Learned that compiling a C file requires a compiler such as `gcc`, `clang`, or MSVC `cl`.
- Confirmed that `gcc`, `clang`, and `cl` were not available in the current PowerShell environment.
- Learned that after installing Visual Studio, C compilation with MSVC usually needs `Developer PowerShell for Visual Studio` or `x64 Native Tools Command Prompt`.
- Learned the basic MSVC compile command: `cl src\day01\practice.c /Febuild\practice.exe`

## 2026-07-13

- 오늘은 `C`와 `C++`를 둘 다 연습할 수 있는 VS Code 개발 환경을 정리하는 데 시간을 썼다.
- 먼저 `src/day01/practice.c`를 아주 단순한 `Hello, world!` 프로그램으로 정리해서 C 언어 연습의 시작점을 명확하게 만들었다.
- `src/day02/practice.c`에서는 기본 입력과 자료형 연습을 진행했고, `scanf`에 값을 저장하려면 변수 이름이 아니라 주소(`&age`, `&height`)를 넘겨야 한다는 점을 다시 확인했다.
- `int`, `float`, `char`가 각각 어떤 값을 다루는지 작은 예제로 직접 구분해 보면서 C의 기본 자료형 감각을 익혔다.
- 작업 중 VS Code 터미널을 열 때마다 가상환경이 자동으로 활성화되는 현상이 있어서 원인을 확인했다.
- 저장소 내부를 확인한 결과, `cncpp` 안에는 `.venv`, `venv`, `activate` 스크립트, Python 관련 워크스페이스 설정이 없었고, 따라서 이 저장소 자체가 가상환경을 자동 실행시키는 구조는 아니라는 점을 확인했다.
- 실제로 터미널에 표시된 명령은 `(Set-ExecutionPolicy -Scope Process -ExecutionPolicy RemoteSigned) ; (& c:\Users\doown\venv\Scripts\Activate.ps1)` 형태였고, 이 명령은 현재 PowerShell 세션에서 스크립트 실행을 허용한 뒤 `C:\Users\doown\venv` 가상환경을 활성화하는 동작이라는 점을 이해했다.
- 이 현상은 C/C++ 빌드 작업 때문이 아니라, 보통 VS Code Python 확장이 터미널을 열 때 자동으로 인터프리터 환경을 활성화하는 동작일 가능성이 높다는 점을 알게 되었다.
- 중간에 VS Code에서 `C/C++: cl.exe 활성 빌드`를 눌렀던 것이 가상환경 자동 활성화의 원인인지도 확인했는데, 결론적으로 그것은 기본 빌드 작업 선택일 뿐이고 Python 가상환경 자동 실행과는 별개의 문제라는 점을 정리했다.
- 이후 목표를 다시 분명히 했다. 지금 하고 싶은 것은 Python 작업이 아니라 VS Code에서 `C`와 `C++`를 편하게 컴파일하면서 연습하는 환경을 만드는 것이다.
- 현재 일반 PowerShell에서는 `cl.exe`가 바로 잡히지 않았기 때문에, 왜 그런지 확인했다.
- `vswhere.exe`로 Visual Studio 설치 경로를 확인했고, Visual Studio가 `C:\Program Files\Microsoft Visual Studio\18\Community`에 설치되어 있다는 점을 찾았다.
- 그다음 `VsDevCmd.bat`와 `vcvars64.bat`의 실제 존재 여부를 확인해서, MSVC 자체는 설치되어 있지만 일반 PowerShell 세션에는 개발자용 환경변수가 자동으로 로드되지 않는다는 점을 확인했다.
- 여기서 중요한 개념을 배웠다. `cl.exe`는 Visual Studio만 설치되어 있다고 바로 어디서나 되는 명령이 아니라, `Developer PowerShell for Visual Studio` 또는 `Developer Command Prompt`처럼 개발자 환경을 먼저 불러온 셸에서 실행해야 안정적으로 동작한다.
- 그래서 VS Code에서 `Developer PowerShell for Visual Studio`를 기본 터미널 프로필로 선택하는 방법도 함께 정리했다. 필요하면 `Ctrl+Shift+P`에서 `Terminal: Select Default Profile`을 실행한 뒤 개발자 PowerShell 프로필을 선택하면 된다.
- 또 다른 방법으로는 시작 메뉴에서 `Developer PowerShell for Visual Studio`를 직접 연 다음, 그 셸에서 `cd C:\Users\doown\Desktop\cncpp` 후 `code .`로 VS Code를 열어 작업하는 방식도 있다는 점을 알게 되었다.
- 기존 `.vscode/tasks.json`은 `cl.exe`를 바로 실행하는 구조였기 때문에, 일반 PowerShell 터미널에서는 실패할 수밖에 없었다.
- 게다가 원래 작업 구성은 C와 C++를 명확히 구분하지 않았고, C 전용 연습에는 맞지 않는 C++ 옵션(`/EHsc`)도 들어 있었다.
- 이를 해결하기 위해 VS Code 작업 구성을 다시 만들었다.
- 새 작업 구성은 `Build C (MSVC)`와 `Build C++ (MSVC)` 두 개로 나누었다.
- `Build C (MSVC)`는 `.c` 파일을 대상으로 `/TC` 옵션을 사용해 C 모드로 컴파일하도록 만들었다.
- `Build C++ (MSVC)`는 `.cpp` 파일을 대상으로 `/TP`와 `/EHsc` 옵션을 사용해 C++ 모드로 컴파일하도록 만들었다.
- 처음에는 `tasks.json` 안에서 긴 `cmd.exe` 명령으로 `VsDevCmd.bat`와 `cl.exe`를 한 번에 실행하도록 구성했지만, VS Code가 PowerShell을 거치면서 `"C:\Program Files\..."` 경로의 따옴표 처리를 깨뜨리는 문제가 발생했다.
- 실제 오류 메시지는 `'C:\Program'은(는) 내부 또는 외부 명령...` 형태였고, 이것은 `Program Files` 경로가 한 덩어리로 해석되지 못했다는 뜻이라는 점을 이해했다.
- 이 문제를 피하기 위해 `.vscode/build-msvc.cmd` 파일을 새로 만들었다.
- 이 배치 파일은 인수로 `c` 또는 `cpp` 모드, 소스 파일 경로, 출력 실행 파일 경로를 받아서 먼저 `VsDevCmd.bat`를 호출하고, 그다음 상황에 맞는 `cl.exe` 옵션으로 빌드하도록 구성했다.
- 이렇게 분리한 덕분에 VS Code 작업은 복잡한 따옴표를 직접 조립하지 않고, 단순히 `build-msvc.cmd`를 호출하기만 하면 되도록 정리되었다.
- 최종적으로 `.vscode/tasks.json`은 일반 PowerShell이 열려 있어도 `cmd.exe`를 통해 `build-msvc.cmd`를 실행하도록 수정되었다.
- 검증 과정에서 `src/day01/practice.c`를 실제로 빌드해 `build/practice.exe`가 생성되는 것까지 확인했다.
- 빌드 출력에 `Developer Command Prompt` 배너와 파일명만 나오고 별도 에러 메시지가 없을 때는 컴파일이 성공한 것이라는 점도 함께 익혔다.
- VS Code 작업이 끝난 뒤 표시되는 `터미널이 작업에서 다시 사용됩니다. 닫으려면 아무 키나 누르세요.` 문구는 오류가 아니라 단순한 종료 안내 메시지라는 점도 확인했다.
- 오늘 정리한 핵심은 세 가지다. 첫째, 가상환경 자동 활성화는 저장소 문제가 아니라 VS Code 쪽 동작일 가능성이 높다. 둘째, `cl.exe`는 일반 PowerShell이 아니라 Visual Studio 개발자 환경이 준비된 셸에서 사용해야 한다. 셋째, C와 C++를 따로 구분한 빌드 작업을 만들어 두면 앞으로 연습이 훨씬 덜 헷갈린다.
