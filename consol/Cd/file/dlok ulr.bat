@echo off
set hostspath=%windir%\System32\drivers\etc\hosts
echo input ulr
set /p input= ulr 
echo 127.0.0.1 www.%ulr% >> %hostspath%
echo 127.0.0.1 %ulr% >> %hostspath%
echo ban %ulr%

exit