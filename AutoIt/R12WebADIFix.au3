#NoTrayIcon
#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=logo.ico
#AutoIt3Wrapper_Res_Comment=Resource by Justin Acevedo
#AutoIt3Wrapper_Res_Description=R12WebADIFix
#AutoIt3Wrapper_Res_Fileversion=1.0
#AutoIt3Wrapper_Res_requestedExecutionLevel=requireAdministrator
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
; =======================================================================
; R12WebADIFix
; Authored by Justin Acevedo
;
; History:
; 8/6/2014
;	v1.0 = 	Initial Emergency Release (jacevedo)
;
; =======================================================================

#include <Date.au3>
$vInsertDate = _Now ()

; ========================================
; Add registry flag Settings
; ========================================
RegWrite("HKEY_LOCAL_MACHINE\SOFTWARE\<company_name>\R12WebADIFix", "Installed", "REG_SZ", $vInsertDate & "")

; ========================================
; AccessVBOM Excel Macro Setting - Trust access to the VBA project object model enabled
; ========================================
RegWrite("HKEY_CURRENT_USER\Software\Microsoft\Office\14.0\Excel\Security", "AccessVBOM", "REG_DWORD", "1")
