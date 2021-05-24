#NoTrayIcon
#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=logo.ico
#AutoIt3Wrapper_Res_Comment=Resource by Justin Acevedo
#AutoIt3Wrapper_Res_Description=R12_JavaAutoSettings
#AutoIt3Wrapper_Res_Fileversion=1.0.0.0
#AutoIt3Wrapper_Res_requestedExecutionLevel=requireAdministrator
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
; =======================================================================
; R12_JavaAutoSettings
; Authored by Justin Acevedo
;
; History:
; 7/3/2014
;	v1.0 = 	Initial Release (jacevedo)
;
; =======================================================================
#include <MsgBoxConstants.au3>
#include <Date.au3>
Opt("ExpandEnvStrings", 1)
$vInsertDate = _Now ()
Local $sFileVersion = FileGetVersion("%PROGRAMFILES(X86)%\java\jre7\bin\java.dll")
Local $sFileVersion2 = FileGetVersion("%PROGRAMFILES(X86)%\java\jre6\bin\java.dll")
ProgressOn ( "<company_name> Progress Bar", "Configuring Java", "Working..." )

; edge case for no Java installed
If $sFileVersion < "0.0.000.00" And $sFileVersion2 < "0.0.000.00" Then
ShellExecuteWait("jre-7u45-windows-i586.exe", "/s /norestart IEXPLORER=1 MOZILLA=1 AUTOUPDATECHECK=0 JAVAUPDATE=0 JU=0 WEBSTARTICON=0 EULA=0 SYSTRAY=0", "", "open")
;Open/Close Java Control Panel to build SUN/JAVA/Deployment structure
RunWait("%PROGRAMFILES(X86)%\java\jre7\bin\javacpl.exe")
Sleep(1000)
WinSetState("Java Control Panel", "", @SW_MINIMIZE)
Sleep(5000)
ProcessClose("javaw.exe")
EndIf

; post Java install variables need to be re-read
Local $sFileVersion = FileGetVersion("%PROGRAMFILES(X86)%\java\jre7\bin\java.dll")
Local $sFileVersion2 = FileGetVersion("%PROGRAMFILES(X86)%\java\jre6\bin\java.dll")
If FileExists("%PROGRAMFILES(X86)%\java\jre6\bin\java.dll") And $sFileVersion2 <= "6.0.450.6" Then
;Beginning of IE reset
ProcessClose("iexplore.exe")
Run("rundll32.exe inetcpl.cpl ResetIEtoDefaults")
WinWait("Reset Internet Explorer Settings")
ControlClick("Reset Internet Explorer Settings", "", 1, "left", 1, 51, 12)
WinWait("Reset Internet Explorer Settings", "&Close")
Sleep(1000)
While WinExists("Reset Internet Explorer Settings", "&Close")
    ControlClick("Reset Internet Explorer Settings", "", 6608, "left", 1, 36, 11)
WEnd
RegWrite("HKEY_LOCAL_MACHINE\SOFTWARE\<company_name>\R12_JavaAutoSettings", "Installed", "REG_SZ", $vInsertDate & "")
RegWrite("HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\MINIE", "LinksBandEnabled", "REG_DWORD", "1")
RegWrite("HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main", "DisableFirstRunCustomize", "REG_DWORD", "1")
	EndIf
If $sFileVersion <= "7.0.450.18" And $sFileVersion > "7.0.000.00" Then
;Open/Close Java Control Panel to build SUN/JAVA/Deployment structure
RunWait("%PROGRAMFILES(X86)%\java\jre7\bin\javacpl.exe")
Sleep(1000)
WinSetState("Java Control Panel", "", @SW_MINIMIZE)
Sleep(5000)
ProcessClose("javaw.exe")
FileCopy("deployment.properties", "%userprofile%\AppData\LocalLow\Sun\Java\Deployment\", 1)
;Beginning of IE reset
ProcessClose("iexplore.exe")
Run("rundll32.exe inetcpl.cpl ResetIEtoDefaults")
WinWait("Reset Internet Explorer Settings")
ControlClick("Reset Internet Explorer Settings", "", 1, "left", 1, 51, 12)
WinWait("Reset Internet Explorer Settings", "&Close")
Sleep(1000)
While WinExists("Reset Internet Explorer Settings", "&Close")
     ControlClick("Reset Internet Explorer Settings", "", 6608, "left", 1, 36, 11)
WEnd
RegWrite("HKEY_LOCAL_MACHINE\SOFTWARE\<company_name>\R12_JavaAutoSettings", "Installed", "REG_SZ", $vInsertDate & "")
RegWrite("HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\MINIE", "LinksBandEnabled", "REG_DWORD", "1")
RegWrite("HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main", "DisableFirstRunCustomize", "REG_DWORD", "1")
ElseIf $sFileVersion >= "7.0.510.13" Then
;Open/Close Java Control Panel to build SUN/JAVA/Deployment structure
RunWait("%PROGRAMFILES(X86)%\java\jre7\bin\javacpl.exe")
Sleep(1000)
WinSetState("Java Control Panel", "", @SW_MINIMIZE)
Sleep(5000)
ProcessClose("javaw.exe")
$file = FileOpen("%userprofile%\AppData\LocalLow\Sun\Java\Deployment\security\exception.sites", 1)
;Oracle R12 URLs need to be updated accordingly
FileWrite($file, "http://<company_name>.com:8001" & @CRLF)
FileWrite($file, "http://<company_name>.com:8001" & @CRLF)
FileClose($file)
;FileCopy("exception.sites", "%userprofile%\AppData\LocalLow\Sun\Java\Deployment\security\", 1)
;Beginning of IE reset
ProcessClose("iexplore.exe")
Run("rundll32.exe inetcpl.cpl ResetIEtoDefaults")
WinWait("Reset Internet Explorer Settings")
ControlClick("Reset Internet Explorer Settings", "", 1, "left", 1, 51, 12)
WinWait("Reset Internet Explorer Settings", "&Close")
Sleep(1000)
While WinExists("Reset Internet Explorer Settings", "&Close")
     ControlClick("Reset Internet Explorer Settings", "", 6608, "left", 1, 36, 11)
WEnd
RegWrite("HKEY_LOCAL_MACHINE\SOFTWARE\<company_name>\R12_JavaAutoSettings", "Installed", "REG_SZ", $vInsertDate & "");flag for install
RegWrite("HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\MINIE", "LinksBandEnabled", "REG_DWORD", "1");enables IE toolbar
RegWrite("HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main", "DisableFirstRunCustomize", "REG_DWORD", "1");kills the IE startup wizard
	EndIf
ProgressSet (100, "100%", "Complete")
Sleep(2000)
ProgressOff()
