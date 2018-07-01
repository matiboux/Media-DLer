@echo off
cd %~dp0
REM setlocal enabledelayedexpansion

if not exist php\php.exe (
	echo PHP wasn't detected. Let's download and install now.
	PowerShell -ExecutionPolicy Unrestricted -File "downloadphp.ps1"
	echo.
)

:installphp
if not exist php\php.exe (
	echo Failed to setup PHP, try doing it manually before continuing.
	echo.
	pause
	goto installphp
)

:start
php\php.exe -f mediadl.php
goto start
