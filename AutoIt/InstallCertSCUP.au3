#NoTrayIcon
#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=logo.ico
#AutoIt3Wrapper_Res_Comment=Resource by Justin Acevedo
#AutoIt3Wrapper_Res_Description=InstallCertSCUP
#AutoIt3Wrapper_Res_Fileversion=1.0
#AutoIt3Wrapper_Res_requestedExecutionLevel=requireAdministrator
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
; =======================================================================
; InstallCertSCUP
; Authored by Justin Acevedo
;
; History:
; 4/28/2014
; 	v1.0 =	Initial Release
;			Installs SCUP/WSUS cert <company_name>.com.cer to Root and Trusted Publishers local stores (jacevedo)
;
; =======================================================================

#include <Date.au3>
$vInsertDate = _Now ()

; ========================================
; Install SCUP/WSUS signing certificates
; ========================================
Run('Certutil -addstore -f "root" <company_name>.com.cer', "", @SW_HIDE)
Run('Certutil -addstore -f "trustedpublisher" <company_name>.com.cer', "", @SW_HIDE)

; ========================================
; Add registry flag Settings
; ========================================
RegWrite("HKEY_LOCAL_MACHINE\SOFTWARE\<company_name>\InstallCertSCUP", "Installed", "REG_SZ", $vInsertDate & "")