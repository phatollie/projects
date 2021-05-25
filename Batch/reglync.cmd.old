@ECHO OFF
:: *******************************************************************************
:: Created by justin acevedo 2013
:: Silent fix for VOL lic
:: *******************************************************************************
TASKKILL /T /F /IM LYNC.EXE >NUL 2>&1
cscript.exe "%PROGRAMFILES(X86)%\Microsoft Office\Office15\OSPP.VBS" /act
TIMEOUT /T 3 /NOBREAK > NUL