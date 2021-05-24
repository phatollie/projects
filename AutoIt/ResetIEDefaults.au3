#NoTrayIcon
#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=logo.ico
#AutoIt3Wrapper_Res_Comment=Resource by Justin Acevedo
#AutoIt3Wrapper_Res_Description=ResetIEDefaults
#AutoIt3Wrapper_Res_Fileversion=1.0.0.0
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
; =======================================================================
; ResetIEBrowswerDefaults
; Authored by Justin Acevedo
;
; History:
; 7/1/2014
;	v1.0 = 	Initial Release (jacevedo)
;
; =======================================================================

#include <Date.au3>
$vInsertDate = _Now ()

;"rundll32 inetcpl.cpl ResetIEtoDefaults"

ProcessClose("iexplore.exe")
Run("rundll32.exe inetcpl.cpl ResetIEtoDefaults")
WinWait("Reset Internet Explorer Settings")
ControlClick("Reset Internet Explorer Settings", "", 1, "left", 1, 51, 12)
WinWait("Reset Internet Explorer Settings", "&Close")
Sleep(1000)
While WinExists("Reset Internet Explorer Settings", "&Close")
     ControlClick("Reset Internet Explorer Settings", "", 6608, "left", 1, 36, 11)
WEnd

RegWrite("HKEY_LOCAL_MACHINE\SOFTWARE\<company name>\ResetIEDefaults", "Installed", "REG_SZ", $vInsertDate & "");flag for install
RegWrite("HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\MINIE", "LinksBandEnabled", "REG_DWORD", "1");enables IE toolbar
RegWrite("HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main", "DisableFirstRunCustomize", "REG_DWORD", "1");kills the IE startup wizard