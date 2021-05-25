@ECHO OFF
:: *******************************************************************************
:: Created by justin acevedo 2013
:: Silent update for LYNC
:: *******************************************************************************
SET ScriptDir=%~dp0
TASKKILL /T /F /IM LYNC.EXE >NUL 2>&1
:: Install Lync 2013 MSO
msiexec /p "%ScriptDir%mso-x-none.msp" /qb
TIMEOUT /T 5 /NOBREAK > NUL
:: Install Lync 2013 MSORES
msiexec /p "%ScriptDir%msores-x-none.msp" /qb
:: Install Lync 2013 ORGIDCRL
msiexec /p "%ScriptDir%orgidcrl-x-none.msp" /qb
:: Install Lync 2013 LYNCINTL
msiexec /p "%ScriptDir%lyncintl-en-us.msp" /qb
start "" "%ProgramFiles(x86)%\Microsoft Office\Office15\lync.exe"
exit

