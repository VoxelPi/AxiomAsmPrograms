@echo off
setlocal enabledelayedexpansion

REM Check if the environment variable AXIOM_TOOLS_PATH is set
if "%AXIOM_TOOLS_PATH%"=="" (
    echo ERROR: AXIOM_TOOLS_PATH environment variable is not set!
    exit /b 1
)

REM Check if the folder exists
if not exist "%AXIOM_TOOLS_PATH%\" (
    echo ERROR: The folder specified by AXIOM_TOOLS_PATH does not exist: %AXIOM_TOOLS_PATH%
    exit /b 1
)

REM Find all JAR files with the pattern axiom-cli-*.jar in the specified folder and sort them alphabetically
set "JARFILE="
for /f "delims=" %%f in ('dir /b /o-n "%AXIOM_TOOLS_PATH%\axiom-cli-*.jar"') do (
    set "JARFILE=%%f"
    REM Only keep the first file (which will be the highest version due to reverse alphabetical order)
    goto :found
)

echo ERROR: No JAR file matching "axiom-cli-*.jar" found in "%AXIOM_TOOLS_PATH%"
exit /b 1

:found
java -jar "%AXIOM_TOOLS_PATH%\!JARFILE!" %*
