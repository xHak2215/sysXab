set pip = python -m pip install -U pip
if"pip"=="1"(pyhton get-pip.py) else (echo OK pip cek)
pip install PyInstaller
pyinstaller --version