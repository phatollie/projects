#NoTrayIcon
#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=logo.ico
#AutoIt3Wrapper_Res_Comment=Resource by Justin Acevedo
#AutoIt3Wrapper_Res_Description=JavaSecuritySettings_7_51up
#AutoIt3Wrapper_Res_Fileversion=1.0.0.0
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
; =======================================================================
; JavaSecuritySettings_7_51up
; Authored by Justin Acevedo
;
; History:
; 7/2/2014
;	v1.0 = 	Initial Release (jacevedo)
;
; =======================================================================

#include <Date.au3>
$vInsertDate = _Now ()

; ========================================
; File Copy
; ========================================

Opt("ExpandEnvStrings", 1)
FileCopy("exception.sites", "%userprofile%\AppData\LocalLow\Sun\Java\Deployment\security\", 1)

; ========================================
; ResetIEDefaults
; ========================================

ProcessClose("iexplore.exe")
Run("rundll32.exe inetcpl.cpl ResetIEtoDefaults")
WinWait("Reset Internet Explorer Settings")
ControlClick("Reset Internet Explorer Settings", "", 1, "left", 1, 51, 12)
WinWait("Reset Internet Explorer Settings", "&Close")
Sleep(1000)
While WinExists("Reset Internet Explorer Settings", "&Close")
     ControlClick("Reset Internet Explorer Settings", "", 6608, "left", 1, 36, 11)
WEnd

; ========================================
; Add registry flag Settings
; ========================================
RegWrite("HKEY_LOCAL_MACHINE\SOFTWARE\<company_name>\JavaSecuritySettings_7_51up", "Installed", "REG_SZ", $vInsertDate & "")