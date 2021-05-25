@ECHO OFF
:: *******************************************************************************
:: Created by justin acevedo 2013
:: Silent Lync uninstall
:: *******************************************************************************
SET ScriptDir=%~dp0
TASKKILL /T /F /IM COMMUNICATOR.EXE >NUL 2>&1
TASKKILL /T /F /IM OUTLOOK.EXE >NUL 2>&1
TASKKILL /T /F /IM IEXPLORE.EXE >NUL 2>&1
:: Un-Install Lync 2010 (64 Bit)
"%ScriptDir%LyncSetup.exe" /uninstall /Silent
TIMEOUT /T 15 /NOBREAK > NUL
exit

