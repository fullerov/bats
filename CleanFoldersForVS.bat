@echo off
set "baseDir=%~dp0"
setlocal enabledelayedexpansion

echo Scanning for 'bin', '.vs', and 'obj' folders under: %baseDir%
for /d /r "%baseDir%" %%d in (bin obj .vs) do (
    if exist "%%d" (
        echo Emptying folder: %%d
        del /q /s "%%d\*" 2>nul
        for /f "delims=" %%f in ('dir /ad /b /s "%%d" 2^>nul') do rd /q /s "%%f" 2>nul
    )
)

echo Operation completed.
pause