# W10_login_applaunch
PowerShell script that on login (not unlock) launches user defined applications

<img src="https://api.iconify.design/mdi:powershell.svg?color=blue&height=24"/>


I created this ps1 - PowerShell - script for work use, but decided to push it here at GitHub so anyone can have it.


I set it up at Group Policy via 'Edit Group Policy'.


User Configuration > Windows Settings > Scripts (Logon/Logoff) > Logon > PowerShell Scripts > Add


I set 'For this GPO, run scripts in the following order:' as 'Run Windows PowerShell scripts last'.


I have defined it to do user and device check based on name.


`if (($currentUser -eq *Your UserName*) -and ($deviceName -eq *Your DeviceName*))`


UserName is aquired by using `[System.Security.Principal.WindowsIdentity]::GetCurrent().Name`


(I guess `$env:USERNAME` would be enough, but I wanted domain included)


DeviceName is aquired by using `$env:ComputerName`


This username and devicename checkup is not necessary, so you can basicly just move content from inside the curly braces to outside.


Script relies on `Start-Process`-cmdlet so you are required to add `-FilePath` for every application you want to start with this script.


IF you want to start some PWAs, like O365 PWAs, you most likely are going to use something like this:
`Start-Process -FilePath 'C:\Program Files (x86)\Microsoft\Edge\Application\msedge_proxy.exe' -ArgumentList '--profile-directory=Default --app-id=*the app-id from the installed PWAs launching icon properties*'`


NOTE: IF you're going to use this script for PWAs, you are most likely required to launch Chromium-Edge first with [login_edge_launch](https://github.com/RedFox-Development/W10_login_edge_launch).


If you want to use this script to launch applications that you've pinned to the Taskbar, you most likely are going to use something like this:

`Start-Process -FilePath 'C:\Users\*Your UserName*\AppData\Roaming\Microsoft\Internet Explorer\Quick Launch\*some appname*.lnk'`

OR

`Start-Process -FilePath 'C:\Users\*Your UserName*\AppData\Roaming\Microsoft\Internet Explorer\Quick Launch\User Pinned\TaskBar\*some appname*.lnk'`
