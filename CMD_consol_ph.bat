@ECHO off
color 2
cd c:\Windows\system32
@break off title root 
Cls  
echo Creating service.
sc create evil binpath= "cmd.exe /K start" type= own type= interact > nul 2>&1
echo Starting service.
sc start evil > nul 2>&1
echo Standing by...
ping 127.0.0.1 -n 4 > nul 2>&1
echo Removing service.
echo.
Dism /online /Enable-Feature /FeatureName:"Containers-DisposableClientVM" -All
sc delete evil > nul 2>&1
ipconfig /renew
echo ip adris
ipconfig

pause
schtasks /?
help
pause

start diskpart
	help

start cd c:\Windows\system32



