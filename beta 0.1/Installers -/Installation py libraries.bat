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
pip install you-get
pause

