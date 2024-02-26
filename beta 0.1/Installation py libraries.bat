@echo off
echo pip install 
python -m ensurepip --upgrade
echo ok
python --version
pip install pygame
echo ok
pip install flesk
echo ok
pip install httpx
echo ok
echo download additional libraries ? yes/no
if %var%==1 goto yes
if %var%==2 goto no
:yes
pip install numpy
pip install -U 'dramatiq[rabbitmq, watch]
pip install -U Celery
pip install "celery[librabbitmq]
pip install art
echo ok
pause
:no
exit
