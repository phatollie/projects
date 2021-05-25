@ECHO OFF
:: *******************************************************************************
:: Created by justin acevedo 2013 
:: This cmd file will post a miniNotify balloon alert based on the .ini associated
:: 09/16/2013
:: *******************************************************************************

SET ScriptDir=%~dp0
TASKKILL /T /F /IM miniNotify.exe >NUL 2>&1
START %ScripDir%miniNotify.exe NotifyEx.ini
ECHO Install Completed: %DATE% %TIME% >> %temp%\miniNofity.log
ECHO Exit Code %errorlevel%.
exit
