set %pip% = python -m pip install -U pip
if"%pip%"==" No module named pip"(pyhton get-pip.py) else (echo OK pip cek)
pip install PyInstaller
pyinstaller --version
