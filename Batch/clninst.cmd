@ECHO OFF
:: *******************************************************************************
:: Created by justin acevedo 2013 
:: Batch file to clean up temp files left over from
:: Symantec AntiVirus Console's Client Remote.
:: *******************************************************************************

del /f /s /q c:\temp\clt-inst\*.*
rd /s /q c:\temp\clt-inst
