@echo off
cls

REM Set up paths
set "ROOT_DIR=%~dp0"
set "NASM=%ROOT_DIR%\Nasm\nasm"
SET "DOSBOX_BIN=%ProgramFiles(x86)%\DOSBox-0.74-3\DOSBox.exe"

REM Ask the user for the directory containing the ASM file
set /p GAME_DIR=Enter the path to the directory containing the ASM file: 

REM Ask the user for the ASM filename (with .asm extension)
set /p GAME_FILE=Enter the ASM file name (e.g., helloworld.asm): 

REM Full path to the ASM file
SET "GAME=%GAME_DIR%\%GAME_FILE%"

REM Assemble the game
"%NASM%" "%GAME%" -f bin -o "%GAME_DIR%\output.com"

REM Run the game with the explicit config
"%DOSBOX_BIN%" -c "MOUNT C %GAME_DIR%" -c "C:" -c "output.com"