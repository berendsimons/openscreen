@echo off
rem ============================================================
rem  OpenScreen launcher (dev mode)
rem  Installs dependencies on first run, then starts the app.
rem  Closing this window stops the app.
rem ============================================================
setlocal
cd /d "%~dp0"
title OpenScreen

where npm >nul 2>nul
if errorlevel 1 (
  echo Node.js / npm was not found on your PATH.
  echo Install Node.js 22.x from https://nodejs.org and try again.
  echo.
  pause
  exit /b 1
)

if not exist "node_modules" (
  echo First run: installing dependencies. This can take a few minutes...
  echo.
  call npm install
  if errorlevel 1 (
    echo.
    echo npm install failed. See the messages above.
    pause
    exit /b 1
  )
)

echo Starting OpenScreen...
echo.
call npm run dev

if errorlevel 1 (
  echo.
  echo OpenScreen exited with an error.
  pause
)
endlocal
