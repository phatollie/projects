#NoTrayIcon
#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=logo.ico
#AutoIt3Wrapper_Res_Comment=Resource by Justin Acevedo
#AutoIt3Wrapper_Res_Description=EMET Setup
#AutoIt3Wrapper_Res_Fileversion=1.0.0.0
#AutoIt3Wrapper_Res_requestedExecutionLevel=requireAdministrator
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
; =======================================================================
; EMET Setup
; Authored by Justin Acevedo
;
; History:
; 12/18/2014
;	v1.0 = 	Initial Release (jacevedo)
;
; =======================================================================
#include <MsgBoxConstants.au3>
#include <Date.au3>
Opt("ExpandEnvStrings", 1)
$vInsertDate = _Now ()
ShellExecuteWait("msiexec", '/L*v "%TEMP%\EMETSetup.log" /i "EMETSetup.msi" /qn /norestart') ; Includes install logging
Run(@ComSpec & " /c " & 'EMETcfg.bat', "", @SW_HIDE) ; EMET configuration silent
RunWait(@ComSpec & " /c " & 'net stop EMET_Service', "", @SW_HIDE)
RunWait(@ComSpec & " /c " & 'net start EMET_Service', "", @SW_HIDE)
RegWrite("HKEY_LOCAL_MACHINE\SOFTWARE\<company name>\EMETSetup", "Installed", "REG_SZ", $vInsertDate & "") ; Registry install flag