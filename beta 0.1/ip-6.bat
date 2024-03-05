for /f "tokens=1-2,14" %%i in ('ipconfig') do ^
   if "%%i %%j"=="IPv4 Address." set IPADDR=%%k
