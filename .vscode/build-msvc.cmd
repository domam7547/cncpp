@echo off
setlocal

if "%~3"=="" (
    echo Usage: build-msvc.cmd ^<c^|cpp^> ^<source-file^> ^<output-exe^>
    exit /b 1
)

set "MODE=%~1"
set "SRC=%~2"
set "OUT=%~3"
set "VSDEVCMD=C:\Program Files\Microsoft Visual Studio\18\Community\Common7\Tools\VsDevCmd.bat"

for %%I in ("%OUT%") do set "OUTDIR=%%~dpI"
if not exist "%OUTDIR%" mkdir "%OUTDIR%"

call "%VSDEVCMD%" -arch=x64
if errorlevel 1 exit /b %errorlevel%

if /I "%MODE%"=="c" (
    cl.exe /nologo /Zi /TC "%SRC%" /link /OUT:"%OUT%"
    exit /b %errorlevel%
)

if /I "%MODE%"=="cpp" (
    cl.exe /nologo /Zi /EHsc /TP "%SRC%" /link /OUT:"%OUT%"
    exit /b %errorlevel%
)

echo Invalid mode: %MODE%
exit /b 1
