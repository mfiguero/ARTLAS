@echo off
chcp 65001 >nul
cd /d "%~dp0"
echo Creando acceso directo de ARTLAS en el Escritorio...
powershell -NoProfile -ExecutionPolicy Bypass -Command "$W=New-Object -ComObject WScript.Shell; $d=[Environment]::GetFolderPath('Desktop'); $lnk=Join-Path $d 'ARTLAS.lnk'; $s=$W.CreateShortcut($lnk); $s.TargetPath=(Join-Path $PWD.Path 'ARTLAS.html'); $s.WorkingDirectory=$PWD.Path; $s.IconLocation=(Join-Path $PWD.Path 'ARTLAS.ico'); $s.Description='ARTLAS'; $s.Save()"
if errorlevel 1 (echo Hubo un problema. Proba clic derecho, Ejecutar como administrador.) else (echo Listo! Fijate el icono ARTLAS en tu Escritorio.)
pause
