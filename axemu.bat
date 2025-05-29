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

REM Find the JAR file with the pattern axiom-cli-*.jar in the specified folder
set "JARFILE="
for %%f in ("%AXIOM_TOOLS_PATH%\axiom-cli-*.jar") do (
    set "JARFILE=%%f"
    goto :found
)

echo ERROR: No JAR file matching "axiom-cli-*.jar" found in "%AXIOM_TOOLS_PATH%"
exit /b 1

:found
java -jar "!JARFILE!" emulate %*