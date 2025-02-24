@echo off
setlocal EnableExtensions
set /a Number=0
set /a Input=%1
set /a Input=%Input%/2
:start
  set /a Number=Number+1
  if Input equ 1 (goto end) else (goto start)
:end
> con echo %Number%
endlocal
pause
cls