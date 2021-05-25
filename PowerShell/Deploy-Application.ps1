<#
.SYNOPSIS
	This script performs the installation or uninstallation of an application(s).  
.DESCRIPTION
	The script is provided as a template to perform an install or uninstall of an application(s). 
	The script either performs an "Install" deployment type or an "Uninstall" deployment type.
	The install deployment type is broken down in to 3 main sections/phases: Pre-Install, Install, and Post-Install.
	The script dot-sources the AppDeployToolkitMain.ps1 script which contains the logic and functions required to install or uninstall an application.
	To access the help section,
.EXAMPLE
	Deploy-Application.ps1
.EXAMPLE
	Deploy-Application.ps1 -DeploymentMode "Silent"
.EXAMPLE
	Deploy-Application.ps1 -AllowRebootPassThru -AllowDefer
.EXAMPLE
	Deploy-Application.ps1 -Uninstall 
.PARAMETER DeploymentType
	The type of deployment to perform. [Default is "Install"]
.PARAMETER DeployMode
	Specifies whether the installation should be run in Interactive, Silent or NonInteractive mode.
	Interactive = Default mode
	Silent = No dialogs
	NonInteractive = Very silent, i.e. no blocking apps. Noninteractive mode is automatically set if an SCCM task sequence or session 0 is detected.
.PARAMETER AllowRebootPassThru
	Allows the 3010 return code (requires restart) to be passed back to the parent process (e.g. SCCM) if detected from an installation. 
	If 3010 is passed back to SCCM a reboot prompt will be triggered.
.NOTES
.LINK 
	
"#>
Param (
	[ValidateSet("Install","Uninstall")] 
	[string] $DeploymentType = "Install",
	[ValidateSet("Interactive","Silent","NonInteractive")]
	[string] $DeployMode = "Interactive",
	[switch] $AllowRebootPassThru = $false
)

#*===============================================
#* VARIABLE DECLARATION
Try {
#*===============================================

#*===============================================
# Variables: Application

$appVendor = "Symantec"
$appName = "Endpoint Protection"
$appVersion = ""
$appArch = ""
$appLang = ""
$appRevision = ""
$appScriptVersion = ""
$appScriptDate = "2/20/2014"
$appScriptAuthor = "<justin acevedo>"

#*===============================================
# Variables: Script - Do not modify this section

$deployAppScriptFriendlyName = "Deploy Application"
$deployAppScriptVersion = "3.0.9"
$deployAppScriptDate = "11/29/2013"
$deployAppScriptParameters = $psBoundParameters

# Variables: Environment
$scriptDirectory = Split-Path -Parent $MyInvocation.MyCommand.Definition
# Dot source the App Deploy Toolkit Functions
."$scriptDirectory\AppDeployToolkit\AppDeployToolkitMain.ps1"

#*===============================================
#* END VARIABLE DECLARATION
#*===============================================

#*===============================================
#* PRE-INSTALLATION
If ($deploymentType -ne "uninstall") { $installPhase = "Pre-Installation"
#*===============================================

	# Show Welcome Message, close Internet Explorer if required, allow up to 3 deferrals, verify there is enough disk space to complete the install and persist the prompt
	#Show-InstallationWelcome -CloseApps "iexplore" -AllowDefer -DeferTimes 0 -CheckDiskSpace -PersistPrompt
 
	 #Show Progress Message (with the default message)
	#Show-InstallationProgress -StatusMessage "Installing Application $installTitle. Please Wait..." 

	# Perform pre-installation tasks here

#*===============================================
#* INSTALLATION 
$installPhase = "Installation"
#*===============================================

	# Perform installation tasks here

	
    
	$WantFile = "C:\Program Files (x86)\McAfee\VirusScan Enterprise\scan32.exe"
    $WantFile2 = "C:\Program Files (x86)\McAfee\SiteAdvisor Enterprise\McSACore.exe"
    $WantFile3 = "C:\Program Files (x86)\McAfee\Common Framework\frminst.exe" 
    $FileExists = Test-Path $WantFile 
    $FileExists2 = Test-Path $WantFile2
    $FileExists3 = Test-Path $WantFile3
    If ($FileExists -eq $True)
    {$product=gwmi win32_product -filter "Name LIKE '%Mcafee VirusScan Enterprise%'"
     $product.uninstall()}
     
    if ($FileExists2 -eq $True)
     {$product2=gwmi win32_product -filter "Name LIKE '%Mcafee SiteAdvisor%'"
     $product2.uninstall()}
    
    if ($FileExists3 -eq $True)
      {
      Start-Process $wantfile3 -ArgumentList "/forceuninstall /silent" -Wait}
      
      #{cd\
      # cd "Program Files (x86)\McAfee\Common Framework"
     #& ".\frminst.exe" /forceuninstall /silent}
     
 Execute-Process -FilePath "$dirFiles\SymantecSFX.exe"
 Execute-Process -FilePath "$dirFiles\Setup.exe" -Arguments "/S"
     
#*===============================================
#* POST-INSTALLATION
$installPhase = "Post-Installation"
#*===============================================

	# Perform post-installation tasks here
    
    # Display a message at the end of the install
	#Show-InstallationPrompt -Message "Please Restart your Machine to activate Symantec Endpoint Protection." -ButtonRightText "Ok" -Icon Information -NoWait
    Show-InstallationRestartPrompt -Countdownseconds 14400 -CountdownNoHideSeconds 3600

#*===============================================
#* UNINSTALLATION
} ElseIf ($deploymentType -eq "uninstall") { $installPhase = "Uninstallation"
#*===============================================

	# Show Welcome Message, close Internet Explorer if required with a 60 second countdown before automatically closing
#	Show-InstallationWelcome -CloseApps "iexplore" -CloseAppsCountdown "60"

	# Show Progress Message (with the default message)
#	Show-InstallationProgress -StatusMessage "Uninstalling Application $installTitle. Please Wait..." 

	# Perform uninstallation tasks here
	

#*===============================================
#* END SCRIPT BODY
} } Catch {$exceptionMessage = "$($_.Exception.Message) `($($_.ScriptStackTrace)`)"; Write-Log "$exceptionMessage"; Show-DialogBox -Text $exceptionMessage -Icon "Stop"; Exit-Script -ExitCode 1} # Catch any errors in this script 
Exit-Script -ExitCode 0 # Otherwise call the Exit-Script function to perform final cleanup operations
#*===============================================