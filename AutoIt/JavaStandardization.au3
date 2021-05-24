#NoTrayIcon
#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=logo.ico
#AutoIt3Wrapper_Res_Comment=Resource by Justin Acevedo
#AutoIt3Wrapper_Res_Description=JavaStandardization
#AutoIt3Wrapper_Res_Fileversion=1.0.0.0
#AutoIt3Wrapper_Res_requestedExecutionLevel=requireAdministrator
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
; =======================================================================
; JavaStandardization
; Authored by Justin Acevedo
;
; History:
; 2/10/2015
;	v1.1 = 	Revised for 7u75 upgrade; added some local file cleanup; updated inline comments (jacevedo)
; 10/1/2014
;	v1.0 = 	Initial Release (jacevedo)
;
; =======================================================================
#include <MsgBoxConstants.au3>
#include <Date.au3>
Opt("ExpandEnvStrings", 1)
$vInsertDate = _Now ()
Local $sFileVersion = FileGetVersion("%PROGRAMFILES(X86)%\java\jre7\bin\java.dll")
; Local $sFileVersion2 = FileGetVersion("%PROGRAMFILES(X86)%\java\jre6\bin\java.dll")

; edge case for no Java installed
; If $sFileVersion < "0.0.000.00" And $sFileVersion2 < "0.0.000.00" Then
; ShellExecuteWait("jre-7u67-windows-i586.exe", "/s /norestart IEXPLORER=1 MOZILLA=1 AUTOUPDATECHECK=0 JAVAUPDATE=0 JU=0 WEBSTARTICON=0 EULA=0 SYSTRAY=0", "", "open")
; EndIf

;kills Ask.com + 3rd party tool bar install prompts
RegWrite("HKEY_LOCAL_MACHINE\SOFTWARE\JavaSoft", "SPONSORS", "REG_SZ", "DISABLE")
RegWrite("HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\JavaSoft", "SPONSORS", "REG_SZ", "DISABLE")

;Java Install
If $sFileVersion < "7.0.750.13" Then
ProcessClose("iexplore.exe")
ShellExecuteWait("msiexec.exe", '/x "{26A24AE4-039D-4CA4-87B4-2F03217072FF}" /qn');Uninstall Java 7 Update 72
ShellExecuteWait("msiexec.exe", '/x "{26A24AE4-039D-4CA4-87B4-2F06417072FF}" /qn');Uninstall Java 7 Update 72(64bit)
ShellExecuteWait("msiexec.exe", '/x "{26A24AE4-039D-4CA4-87B4-2F03217071FF}" /qn');Uninstall Java 7 Update 71
ShellExecuteWait("msiexec.exe", '/x "{26A24AE4-039D-4CA4-87B4-2F06417071FF}" /qn');Uninstall Java 7 Update 71(64bit)
ShellExecuteWait("msiexec.exe", '/x "{26A24AE4-039D-4CA4-87B4-2F03217067FF}" /qn');Uninstall Java 7 Update 67
ShellExecuteWait("msiexec.exe", '/x "{26A24AE4-039D-4CA4-87B4-2F06417067FF}" /qn');Uninstall Java 7 Update 67(64bit)
ShellExecuteWait("msiexec.exe", '/x "{26A24AE4-039D-4CA4-87B4-2F03217065FF}" /qn');Uninstall Java 7 Update 65
ShellExecuteWait("msiexec.exe", '/x "{26A24AE4-039D-4CA4-87B4-2F06417065FF}" /qn');Uninstall Java 7 Update 65(64bit)
ShellExecuteWait("msiexec.exe", '/x "{26A24AE4-039D-4CA4-87B4-2F03217060FF}" /qn');Uninstall Java 7 Update 60
ShellExecuteWait("msiexec.exe", '/x "{26A24AE4-039D-4CA4-87B4-2F06417060FF}" /qn');Uninstall Java 7 Update 60(64bit)
ShellExecuteWait("msiexec.exe", '/x "{26A24AE4-039D-4CA4-87B4-2F83217055FF}" /qn');Uninstall Java 7 Update 55
ShellExecuteWait("msiexec.exe", '/x "{26A24AE4-039D-4CA4-87B4-2F86417055FF}" /qn');Uninstall Java 7 Update 55(64bit)
ShellExecuteWait("msiexec.exe", '/x "{26A24AE4-039D-4CA4-87B4-2F83217051FF}" /qn');Uninstall Java 7 Update 51
ShellExecuteWait("msiexec.exe", '/x "{26A24AE4-039D-4CA4-87B4-2F86417051FF}" /qn');Uninstall Java 7 Update 51(64bit)
ShellExecuteWait("msiexec.exe", '/x "{26A24AE4-039D-4CA4-87B4-2F83217045FF}" /qn');Uninstall Java 7 Update 45
ShellExecuteWait("msiexec.exe", '/x "{26A24AE4-039D-4CA4-87B4-2F86417045FF}" /qn');Uninstall Java 7 Update 45(64bit)
ShellExecuteWait("msiexec.exe", '/x "{26A24AE4-039D-4CA4-87B4-2F83217040FF}" /qn');Uninstall Java 7 Update 40
ShellExecuteWait("msiexec.exe", '/x "{26A24AE4-039D-4CA4-87B4-2F86417040FF}" /qn');Uninstall Java 7 Update 40(64bit)
ShellExecuteWait("msiexec.exe", '/x "{26A24AE4-039D-4CA4-87B4-2F83217025FF}" /qn');Uninstall Java 7 Update 25
ShellExecuteWait("msiexec.exe", '/x "{26A24AE4-039D-4CA4-87B4-2F86417025FF}" /qn');Uninstall Java 7 Update 25(64bit)
ShellExecuteWait("msiexec.exe", '/x "{26A24AE4-039D-4CA4-87B4-2F83217021FF}" /qn');Uninstall Java 7 Update 21
ShellExecuteWait("msiexec.exe", '/x "{26A24AE4-039D-4CA4-87B4-2F86417021FF}" /qn');Uninstall Java 7 Update 21(64bit
ShellExecuteWait("msiexec.exe", '/x "{26A24AE4-039D-4CA4-87B4-2F83217017FF}" /qn');Uninstall Java 7 Update 17
ShellExecuteWait("msiexec.exe", '/x "{26A24AE4-039D-4CA4-87B4-2F86417017FF}" /qn');Uninstall Java 7 Update 17(64bit)
ShellExecuteWait("msiexec.exe", '/x "{26A24AE4-039D-4CA4-87B4-2F83217016FF}" /qn');Uninstall Java 7 Update 16
ShellExecuteWait("msiexec.exe", '/x "{26A24AE4-039D-4CA4-87B4-2F86417016FF}" /qn');Uninstall Java 7 Update 16(64bit)
ShellExecuteWait("msiexec.exe", '/x "{26A24AE4-039D-4CA4-87B4-2F83217015FF}" /qn');Uninstall Java 7 Update 15
ShellExecuteWait("msiexec.exe", '/x "{26A24AE4-039D-4CA4-87B4-2F86417015FF}" /qn');Uninstall Java 7 Update 15(64bit)
ShellExecuteWait("msiexec.exe", '/x "{26A24AE4-039D-4CA4-87B4-2F83217014FF}" /qn');Uninstall Java 7 Update 14
ShellExecuteWait("msiexec.exe", '/x "{26A24AE4-039D-4CA4-87B4-2F86417014FF}" /qn');Uninstall Java 7 Update 14(64bit)
ShellExecuteWait("msiexec.exe", '/x "{26A24AE4-039D-4CA4-87B4-2F83217013FF}" /qn');Uninstall Java 7 Update 13
ShellExecuteWait("msiexec.exe", '/x "{26A24AE4-039D-4CA4-87B4-2F86417013FF}" /qn');Uninstall Java 7 Update 13(64bit)
ShellExecuteWait("msiexec.exe", '/x "{26A24AE4-039D-4CA4-87B4-2F83217012FF}" /qn');Uninstall Java 7 Update 12
ShellExecuteWait("msiexec.exe", '/x "{26A24AE4-039D-4CA4-87B4-2F86417012FF}" /qn');Uninstall Java 7 Update 12(64bit)
ShellExecuteWait("msiexec.exe", '/x "{26A24AE4-039D-4CA4-87B4-2F83217011FF}" /qn');Uninstall Java 7 Update 11
ShellExecuteWait("msiexec.exe", '/x "{26A24AE4-039D-4CA4-87B4-2F86417011FF}" /qn');Uninstall Java 7 Update 11(64bit)
ShellExecuteWait("msiexec.exe", '/x "{26A24AE4-039D-4CA4-87B4-2F83217010FF}" /qn');Uninstall Java 7 Update 10
ShellExecuteWait("msiexec.exe", '/x "{26A24AE4-039D-4CA4-87B4-2F86417010FF}" /qn');Uninstall Java 7 Update 10(64bit)
ShellExecuteWait("msiexec.exe", '/x "{26A24AE4-039D-4CA4-87B4-2F83217009FF}" /qn');Uninstall Java 7 Update 9
ShellExecuteWait("msiexec.exe", '/x "{26A24AE4-039D-4CA4-87B4-2F86417009FF}" /qn');Uninstall Java 7 Update 9(64bit)
ShellExecuteWait("msiexec.exe", '/x "{26A24AE4-039D-4CA4-87B4-2F83217008FF}" /qn');Uninstall Java 7 Update 8
ShellExecuteWait("msiexec.exe", '/x "{26A24AE4-039D-4CA4-87B4-2F86417008FF}" /qn');Uninstall Java 7 Update 8(64bit)
ShellExecuteWait("msiexec.exe", '/x "{26A24AE4-039D-4CA4-87B4-2F83217007FF}" /qn');Uninstall Java 7 Update 7
ShellExecuteWait("msiexec.exe", '/x "{26A24AE4-039D-4CA4-87B4-2F86417007FF}" /qn');Uninstall Java 7 Update 7(64bit)
ShellExecuteWait("msiexec.exe", '/x "{26A24AE4-039D-4CA4-87B4-2F83217006FF}" /qn');Uninstall Java 7 Update 6
ShellExecuteWait("msiexec.exe", '/x "{26A24AE4-039D-4CA4-87B4-2F86417006FF}" /qn');Uninstall Java 7 Update 6(64bit)
ShellExecuteWait("msiexec.exe", '/x "{26A24AE4-039D-4CA4-87B4-2F83217005FF}" /qn');Uninstall Java 7 Update 5
ShellExecuteWait("msiexec.exe", '/x "{26A24AE4-039D-4CA4-87B4-2F86417005FF}" /qn');Uninstall Java 7 Update 5(64bit)
ShellExecuteWait("msiexec.exe", '/x "{26A24AE4-039D-4CA4-87B4-2F83217004FF}" /qn');Uninstall Java 7 Update 4
ShellExecuteWait("msiexec.exe", '/x "{26A24AE4-039D-4CA4-87B4-2F86417004FF}" /qn');Uninstall Java 7 Update 4(64bit)
ShellExecuteWait("msiexec.exe", '/x "{26A24AE4-039D-4CA4-87B4-2F83217003FF}" /qn');Uninstall Java 7 Update 3
ShellExecuteWait("msiexec.exe", '/x "{26A24AE4-039D-4CA4-87B4-2F86417003FF}" /qn');Uninstall Java 7 Update 3(64bit)
ShellExecuteWait("msiexec.exe", '/x "{26A24AE4-039D-4CA4-87B4-2F83217002FF}" /qn');Uninstall Java 7 Update 2
ShellExecuteWait("msiexec.exe", '/x "{26A24AE4-039D-4CA4-87B4-2F86417002FF}" /qn');Uninstall Java 7 Update 2(64bit)
ShellExecuteWait("msiexec.exe", '/x "{26A24AE4-039D-4CA4-87B4-2F83217001FF}" /qn');Uninstall Java 7 Update 1
ShellExecuteWait("msiexec.exe", '/x "{26A24AE4-039D-4CA4-87B4-2F86417001FF}" /qn');Uninstall Java 7 Update 1(64bit)
ShellExecuteWait("jre-7u75-windows-i586.exe", "/s /norestart IEXPLORER=1 MOZILLA=0 AUTOUPDATECHECK=0 JAVAUPDATE=0 JU=0 WEBSTARTICON=0 EULA=0 SYSTRAY=0", "", "open")

;Post Java install registry keys
RegDelete("HKEY_CLASSES_ROOT\CLSID\{761497BB-D6F0-462C-B6EB-D4DAF1D92D43}") ;kills Java(tm) Plug-In SSV Helper IE prompt
RegDelete("HKEY_CLASSES_ROOT\Wow6432Node\CLSID\{761497BB-D6F0-462C-B6EB-D4DAF1D92D43}") ;kills Java(tm) Plug-In SSV Helper IE prompt
RegDelete("HKEY_CLASSES_ROOT\CLSID\{DBC80044-A445-435b-BC74-9C25C1C588A9}") ;kills Java(tm) Plug-In 2 SSV Helper IE prompt
RegDelete("HKEY_CLASSES_ROOT\Wow6432Node\CLSID\{DBC80044-A445-435b-BC74-9C25C1C588A9}") ;kills Java(tm) Plug-In 2 SSV Helper IE prompt
;Kills Java AutoUpdate Prompts
RegDelete("HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Run", "SunJavaUpdateSched")
RegDelete("HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\JavaSoft\Java Update\Policy")
RegWrite("HKEY_LOCAL_MACHINE\SOFTWARE\JavaSoft\Java Update\Policy", "EnableJavaUpdate", "REG_DWORD", "0")
RegWrite("HKEY_LOCAL_MACHINE\SOFTWARE\JavaSoft\Java Update\Policy", "EnableAutoUpdateCheck", "REG_DWORD", "0")
RegWrite("HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\JavaSoft\Java Update\Policy", "EnableJavaUpdate", "REG_DWORD", "0")
;Kills Ask.com + 3rd party tool bar install prompts
RegWrite("HKEY_LOCAL_MACHINE\SOFTWARE\JavaSoft", "SPONSORS", "REG_SZ", "DISABLE")
RegWrite("HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\JavaSoft", "SPONSORS", "REG_SZ", "DISABLE")

FileDelete("%SystemDrive%\ProgramData\Microsoft\Windows\Start Menu\Programs\Java\checkf~1.lnk") ;deletes Start Menu icon Java "Check for Updates"
Run(@ComSpec & " /c " & 'for /d %G in ("%userprofile%\AppData\LocalLow\Sun\Java\jre*") do rd /s /q "%~G"', "", @SW_HIDE) ;cleans up all java msi/cab files not required on local system for java functionality

;Install Flag Registry Entry
RegWrite("HKEY_LOCAL_MACHINE\SOFTWARE\<company_name>\JavaStandardization", "Installed", "REG_SZ", $vInsertDate & "")
EndIf