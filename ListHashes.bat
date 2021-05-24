@echo off
chcp 65001

set input_dir=%~dp0
set output_file=%~dp0\HashList.txt
set algorithm=SHA1

for /f "tokens=*" %%f in (
  'dir "%input_dir%" /a-d /b /s'
) do for /f %%h in (
  'certutil -hashfile "%%f" %algorithm% ^| findstr /v ":"'
) do echo %%h "%%f">>"%output_file%"
