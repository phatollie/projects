#NoTrayIcon
#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=logo.ico
#AutoIt3Wrapper_Res_Comment=Resource by Justin Acevedo
#AutoIt3Wrapper_Res_Description=3rdPartyAutoUpdateDisable
#AutoIt3Wrapper_Res_Fileversion=1.1
#AutoIt3Wrapper_Res_requestedExecutionLevel=requireAdministrator
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
; =======================================================================
; 3rdPartyAutoUpdateDisable
; Authored by Justin Acevedo
;
; History:
; 9/15/2014
;	v1.3 = 	Added Adobe AIR and Java Auto update disable reg keys. (jacevedo)
;
; 6/11/2014
;	v1.2 = 	Added Shockwave auto/stats disable. (jacevedo)
;
; 4/28/2014
;	v1.1 = 	Stripped out .cer code to separate installer; added vInsertDate
;			This version will be the production code set moving forward. (jacevedo)
; 4/24/2013
;	v1.0 = 	Initial Release (jacevedo)
;
; =======================================================================

#include <Date.au3>
$vInsertDate = _Now ()

; ========================================
; Delete registry settings
; ========================================
RegDelete("HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Run", "Adobe ARM")
RegDelete("HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Run", "Acrobat Assistant 8.0")
RegDelete("HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Run", "SunJavaUpdateSched")
RegDelete("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run", "AdobeAAMUpdater-1.0")
RegDelete("HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\AdobeFlashPlayerUpdateSvc")
RegDelete("HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\JavaSoft\Java Update\Policy")
RegDelete("HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\AdobeARMservice")

; ========================================
; Add registry settings
; ========================================
RegWrite("HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Adobe\Shockwave 12\AutoUpdate", "", "REG_SZ", "n")
RegWrite("HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Adobe\Shockwave 12\collectstats", "", "REG_SZ", "n")
RegWrite("HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Adobe\AIR", "UpdateDisabled", "REG_SZ", "1")
RegWrite("HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\NetworkProvider", "RestoreConnection", "REG_DWORD", "0")

;========================================
; Java registry settings
; ========================================
RegWrite("HKEY_LOCAL_MACHINE\SOFTWARE\JavaSoft\Java Update\Policy", "EnableJavaUpdate", "REG_DWORD", "0")
RegWrite("HKEY_LOCAL_MACHINE\SOFTWARE\JavaSoft\Java Update\Policy", "EnableAutoUpdateCheck", "REG_DWORD", "0")
RegWrite("HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\JavaSoft\Java Update\Policy", "EnableJavaUpdate", "REG_DWORD", "0")
;kills Ask.com + 3rd party tool bar install prompts
RegWrite("HKEY_LOCAL_MACHINE\SOFTWARE\JavaSoft", "SPONSORS", "REG_SZ", "DISABLE")
RegWrite("HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\JavaSoft", "SPONSORS", "REG_SZ", "DISABLE")

; ========================================
; mms.cfg file replace
; ========================================
FileCopy("mms.cfg", "c:\windows\SysWOW64\Macromed\Flash\", 1)
FileCopy("mms.cfg", "c:\windows\System32\Macromed\Flash\", 1)

; ========================================
; Adobe FeatureLockDown
; ========================================
RegWrite("HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Adobe\Adobe Acrobat\11.0\FeatureLockDown", "bUpdater", "REG_DWORD", "0")
RegWrite("HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Adobe\Reader\11.0\FeatureLockDown", "bUpdater", "REG_DWORD", "0")

; ========================================
; Add registry flag Settings
; ========================================
RegWrite("HKEY_LOCAL_MACHINE\SOFTWARE\<company_name>\3rdPartyAutoUpdateDisable", "Installed", "REG_SZ", $vInsertDate & "")