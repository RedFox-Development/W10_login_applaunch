$currentUser = [System.Security.Principal.WindowsIdentity]::GetCurrent().Name
$deviceName = $env:ComputerName

if (($currentUser -eq 'UserName') -and ($deviceName -eq 'UserDevice')) {
    Start-Process -FilePath 'C:\PathToExecutableOrShortcut';
}