@ECHO OFF
:: *******************************************************************************
:: Created by justin acevedo 2013 
:: Silent WMI database rebuild
:: *******************************************************************************

net stop Winmgmt /y
TIMEOUT /T 5 /NOBREAK > NUL
ren "c:\windows\system32\wbem\repository" "c:\windows\system32\wbem\repository.old"
net start ccmexec
