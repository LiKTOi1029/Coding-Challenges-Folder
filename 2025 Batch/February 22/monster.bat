@echo off
setlocal EnableExtensions EnableDelayedExpansion
set Cars=Toyota
set Toyota=Brand
> con echo !%Cars%!
endlocal
pause&exit