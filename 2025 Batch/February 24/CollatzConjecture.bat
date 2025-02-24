@echo off
setlocal EnableExtensions EnableDelayedExpansion
set /a Number=0
:start
	if "%Input%" equ "" (
  set /a Input=%1
  set /a InputDivided=%Input%/2
  ) else if InputDivided equ 1 (
  set /a Input=(%Input%*3+1)
  ) else if InputDivided equ 0 (
  set /a Input=%Input%/2
  ) else (
  > con echo %InputDivided% not working
  goto end
  )
  set /a Number=Number+1
  if Input equ 1 (goto end) else (goto start)
:end
> con echo %Number%
endlocal
pause
cls