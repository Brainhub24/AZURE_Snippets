@echo off

for /L %%i in (1,1,100) do (
  echo Creating file %%i.txt
  type nul > %%i.txt
)

echo All files created.
pause
