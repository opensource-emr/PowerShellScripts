# Check for Microsoft .NET Core Runtime 2.0.3 or later
$netCoreRuntimeInstalled = Get-ChildItem "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall" | Where-Object {$_.GetValue("DisplayName") -like "*Microsoft .NET Core Runtime*"} | Select-Object -First 1
if ($netCoreRuntimeInstalled) {
    $versionNumber = $netCoreRuntimeInstalled.GetValue("DisplayVersion")
    if ($versionNumber -ge "2.0.3") {
        Write-Host "Microsoft .NET Core Runtime 2.0.3 or later is installed."
    } else {
        Write-Host "Microsoft .NET Core Runtime 2.0.3 or later is not installed. Please install it first "
    }
} else {
    Write-Host "Microsoft .NET Core 2.0.3 Runtime is not installed. Please install it first"
}

# Check for SQL Server
$ssInstalled = Get-ChildItem "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall" | Where-Object {$_.GetValue("DisplayName") -like "*Microsoft SQL Server*"} | Select-Object -First 1
if ($ssInstalled) {
    Write-Host "Microsoft SQL Server is installed."
} else {
    Write-Host "Microsoft SQL Server is not installed. Please install Microsoft SQL Server first. Please install it first"
}

# Check for Microsoft .NET Core Runtime Windows Server Hosting 2.2.3
$hostingBundle = Get-Item "HKLM:\SOFTWARE\WOW6432Node\Microsoft\Updates\.NET Core\Microsoft .NET Core 2.2.3 - Windows Server Hosting (x64)"
if ($hostingBundle) {
    Write-Host "Microsoft .NET Core Runtime Windows Server Hosting 2.2.3 is installed."
}
else {
    Write-Host "Microsoft .NET Core Runtime Windows Server Hosting 2.2.3 is not installed. Please install it first"
}



# Check for IIS Web Server Role
$iisFeature = Get-WindowsOptionalFeature -Online -FeatureName "IIS-WebServerRole"
if ($iisFeature.State -eq "Enabled") {
    Write-Host "IIS Web Server Role is enabled."
} else {
    Write-Host "IIS Web Server Role is not enabled. Please enable it first"
}


