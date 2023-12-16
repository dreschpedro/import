@echo off

echo Limpieza de archivos temporales...
del /q /f /s %systemdrive%\*.tmp
del /q /f /s %systemdrive%\*._mp
del /q /f /s %systemdrive%\*.log
del /q /f /s %systemdrive%\*.gid

cd c:\Users\%username%\AppData\Local
rmdir /S /Q Temp

del /f /s /q "C:\Windows\Temp\*.*"

echo Limpieza de la carpeta Prefetch...
del /q /f /s %windir%\Prefetch\*

echo Limpieza de memoria caché...
ipconfig /flushdns

echo Reinicio de Winsock...

netsh interface ip delete arpcache

Netsh winsock reset catalog

echo Optimización de Windows...

%systemroot%\system32\Cmd.exe /c %systemroot%\system32\cleanmgr.exe /sagerun:1

echo Tareas completadas correctamente.
