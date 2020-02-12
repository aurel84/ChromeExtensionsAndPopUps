<#
This script allows administrator or user to manage policies for Google Chrome.
The policies are: force installing or blocking extensions, and allowing pop-ups 
and redirects at desired websites.  The script can be deployed at the machine,
or through a Computer Management SAAS (i.e. AiarWatch).  The script will leave
an install log at C:\Temp\* for administrator to check verification.

Ceated by John Hawkins | johnhawkins3d@gmail.com
#>

### Logfile for script stored in C:\Temp\* ###
$logFile = (($env:computername | Select-Object) + "_" + "ChromeExtensionsForceInstall" + "_" + (Get-Date -Format "MM_dd_yyyy"))

### Variables ###
$chromeExtForceInstallURL=("https://clients2.google.com/service/update2/crx")
$pathToChromeExtInstallForceList=("HKLM:\SOFTWARE\Policies\Google\Chrome\ExtensionInstallForcelist")
$pathToChromeExtInstallBlackList=("HKLM:\SOFTWARE\Policies\Google\Chrome\ExtensionInstallBlacklist")
$pathToChromePopupsAllowedForUrls=("HKLM:\Software\Policies\Google\Chrome\PopupsAllowedForUrls")
$chromeURL="[*.]" # Wildcard variable so that https, http, www., etc. parts of websites are all captured

### PSCustomObject to store data on forcelist, blacklist, and popups ###
# Chrome Extension Force Install dataset
$extensionInstallForceList=@(
    
    # Chrome Extension Force Install 
    [pscustomobject]@{Name="1";ID="PutYourExtensionIDGoesHere"}, # Go to https://chrome.google.com/webstore/category/extensions, look for extension and copy the ID quotations
    [pscustomobject]@{Name="2";ID="AnotherExtensionIDGoesHere"}; # Close semi-colon instead of comma to end structure

)

# Chrome Extension Blacklist 
$extensionInstallBlackList=@(
    
    
    [pscustomobject]@{Name="1";ID="PutYourExtensionIDGoesHere"},
    [pscustomobject]@{Name="2";ID="AnotherExtensionIDGoesHere"}; # Close semi-colon instead of comma to end structure

)

# Chrome PopUps and Redirects
$popUpsAndRedirects=@(
    
    [pscustomobject]@{Name="1";ID="PutYourAddressHere.com"}, # Get the website URL, place it here (ex: google.com)
    [pscustomobject]@{Name="2";ID="AnotherAddressURLGoesHere"}; # Close semi-colon instead of comma to end structure

)


# Start of Log file for script
Start-Transcript -path "C:\Temp\$logFile.txt"

### Checks to see if Chrome is installed ###
if ( -not ( Test-Path -Path "HKLM:\Software\Policies\Google\Chrome" ) )   {

    New-Item -Path "HKLM:\Software\Policies" -Name "Google" –Force > $null
    New-Item -Path "HKLM:\Software\Policies\Google" -Name "Chrome" –Force > $null

} 

### Chrome Registry for Force Installing Extensions ###
if ( -not ( Test-Path -Path "$pathToChromeExtInstallForceList" ) ) {
  
    New-Item -Path "HKLM:\Software\Policies\Google\Chrome" -Name "ExtensionInstallForcelist" –Force > $null

}

### Chrome Registry for Blocking Extensions ###
if ( -not ( Test-Path -Path "$pathToChromeExtInstallBlackList" ) ) {
  
    New-Item -Path "HKLM:\Software\Policies\Google\Chrome" -Name "ExtensionInstallBlacklist" –Force > $null

}

### Chrome Registry to Allow PopUps for URLS ###
if ( -not ( Test-Path -Path "$pathToChromePopupsAllowedForUrls" ) )  {

    New-Item -Path "HKLM:\Software\Policies\Google\Chrome" -Name "PopupsAllowedForUrls" –Force > $null

} 

### For loop for Force Installing Extensions ###
ForEach ($item in $extensionInstallForceList) {
 
    if ( -not ( Get-ItemProperty "$pathToChromeExtInstallForceList" | Select-String -Quiet "$($item.ID);${chromeExtForceInstallURL}" ) )  {

        New-ItemProperty -Path "$pathToChromeExtInstallForceList" -Name "$($item.Name)" -Value "$($item.ID);${chromeExtForceInstallURL}" -Force > $null

    }

}

### For loop for Force Blocking Extensions ###
ForEach ($item in $extensionInstallBlackList) {
 
    if ( -not ( Get-ItemProperty "$pathToChromeExtInstallBlackList" | Select-String -Quiet "$($item.ID);${chromeExtForceInstallURL}" ) )  {

        New-ItemProperty -Path "$pathToChromeExtInstallBlackList" -Name "$($item.Name)" -Value "$($item.ID);${chromeExtForceInstallURL}" -Force > $null

    }

}

### For loop for Allowing Popups and Redirects ###
ForEach ($item in $popUpsAndRedirects) {
    if ( -not ( Get-ItemProperty "$pathToChromePopupsAllowedForUrls" | Select-String -Quiet "${chromeURL}$($item.ID)" ) )   {

        New-ItemProperty -Path "$pathToChromePopupsAllowedForUrls" -Name "$($item.Name)" -Value "${chromeURL}$($item.ID)" –Force > $null

    }

}

# End of Log file for script
Stop-Transcript

Exit
