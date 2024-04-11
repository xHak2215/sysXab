import os
import hashlib
import time
import types
import datetime
from tkinter import messagebox as mb
import subprocess
import webbrowser
import subprocess
import sys
import decimal
import timeit
import math
import psutil
import requests
from tabulate import tabulate
import math


def scan_file(file_path):
    try:
        if os.path.isfile(file_path):
            # Хэшируем содержимое файла для сканирования через VirusTotal
            with open(file_path, 'rb') as f:
                file_content = f.read()
                file_hash = hashlib.sha256(file_content).hexdigest()
            
            # Запрос к API VirusTotal для получения отчета о файле
            response = requests.get('https://www.virustotal.com/vtapi/v2/file/report', 
                                    params={'apikey': '79a74932f60d2c552e88149c961618b10547d700f9c21b757f58f42b2779d35b', 'resource': file_hash})
            # Проверяем статус ответа
            if response.status_code == 200:
                result = response.json()
                # Проверяем наличие положительных сигналов на вирусы в отчете
                if result['response_code'] == 1 and result['positives'] > 0:
                    print(f"Malicious file detected: {file_path}")
                    
                    return True
                else:
                    print(f"File is clean: {file_path}")
                    return False
            else:
                print(f"Error scanning file: {file_path}, HTTP status code: {response.status_code}")
        else:
            print(f"Format file not supported: {file_path}")
        
    except PermissionError:
        print(f"Access denied to file: {file_path}")
    except Exception as e:
        print(f"Error scanning file: {file_path}, Error: {e}")
    return False

def scan_url(url):
    try:
        # Запрос к API VirusTotal для получения отчета о URL
        response = requests.get('https://www.virustotal.com/vtapi/v2/url/report',
                                params={'apikey': '79a74932f60d2c552e88149c961618b10547d700f9c21b757f58f42b2779d35b', 'resource': url})
        # Проверяем статус ответа
        if response.status_code == 200:
            result = response.json()
            # Проверяем наличие положительных сигналов на вирусы в отчете
            if result['response_code'] == 1 and result['positives'] > 0:
                print(f"Malicious URL detected: {url}")
                print("Scan results from NS:")
                for scan, result in result['scans'].items():
                    print(f"{scan}: {result['result']}")
                return True
            else:
                print(f"URL is safe: {url}")
                return False
        else:
            print(f"Error scanning URL: {url}, HTTP status code: {response.status_code}")
    except Exception as e:
        print(f"Error scanning URL: {url}, Error: {e}")
    return False

def anti_virus(target):
    if target.startswith('http://') or target.startswith('https://'):
        scan_url(target)
    else:
        scan_file(target)

def directoryс():
    print(os.getcwd())
    C =  os.listdir("Cd/")
    os.chdir("Cd/root")
    root =  os.listdir(os.getcwd())
    os.chdir("..")
    os.chdir("file")
    os.listdir(os.getcwd())
    file = os.listdir(os.getcwd())
    print(root + file)

# Настройка
# open:
openp = ["txt", "bat", "exe", "jpg", "png", "wav", "mp3"]
# cmd
cmd = 'CMD_consol_sh.bat'
# custom
kast = '>>'
colors = ["green", "red", "blue"]

def admin():
   try:
     return os.getpid() == 0
   except AttributeError:
     return ctypes.windll.shell32.IsUserAnAdmin() != 0

def opentxt():
    txt = input("Введите путь к файлу или URL: " + kast)
    os.path.isdir(txt) 
    sv = input("Введите способ взаимодействия (чтобы получить подсказку введите 'help'): " + kast)
    print(sv)
    if sv == "help":
        print("w - (запись), a - (добавление данных к уже существующему файлу), r - (чтение)")
    else:
        print("error")
    so = ["r", "a", "w"]
    for sv in so:
        txtfile = open(txt, sv, encoding="UTF-8")
        print(txtfile.read())
        txtfile.close()

def openphoto():
    music = input("Введите путь: " + kast)
    jpg = input("Введите путь: " + kast)
    os.path.isdir(jpg) 
    webbrowser.open(jpg)

def infoplatform():
    print(sys.platform)
    WinTip = sys.platform
    print(sys.getwindowsversion())
    WinVersipn = sys.getwindowsversion()

def list_hec(liste, txtceh):
    for s in liste: 
        if txtceh.lower().find(s.lower()) != -1: 
            hec = True

def sudo():
    servise = ["PyPI", "GitHub", "youtube"]
    # Установка пакета с PyPI
    dovald = input("servis dovald" + kast)
    if dovald == "PyPI":
        ULR = input("ULR" + kast)
        subprocess.call(['pip', 'install', ULR])
    elif dovald == "GitHub":
        ULR = input("ULR" + kast)
        # Установка пакета с GitHub
        subprocess.call(['pip', 'install', f'git+{ULR}'])
    elif dovald == "youtube":
        ULR = input("ULR" + kast)
        subprocess.call(['you-get', ULR])
    elif dovald == "ULR (beta)":
        ULR = input("ULR" + kast)
        # Установка пакета с других источников
        subprocess.call(['pip', 'install', ULR])
    elif dovald == "help":
        print("Доступные сервисы: " + str(servise))
    else:
        print("error"+"доступные сервисы" + str(servise))

def calc():
    deist =["синус - sin","тангет - tan","косинус - cos","число пи - pi"]
    print("Выберите функцию:")
    for i in deist:
        print(i)
    choice = input("Введите номер функции: ")
    if choice == "1":
        sinus()
    elif choice == "2":
        cosinus()
    elif choice == "3":
        tanget()
    elif choice == "4":
        print(math.pi)
    else:
        helpcalc =str(deist)
        helpcalc + "доступные операции " 
        print("error" + helpcalc )


def sinus():
    sin = input("Введите значение угла в градусах для нахождения синуса (sin): ")
    sin = float(sin)
    print(math.sin(math.radians(sin)))

def cosinus():   
    cos = input("Введите значение угла в градусах для нахождения косинуса (cos): ")
    cos = float(cos)
    print(math.cos(math.radians(cos)))

def tanget():
    tan = input("Введите значение угла в градусах для нахождения тангенса (tan): ")
    tan = float(tan)
    print(math.tan(math.radians(tan)))

def cmdcom():
    cmdcom = input("Введите команду для выполнения в командной строке: ")
    if cmdcom == "cmd":
        print("Введите любую команду из cmd после cmdcom")
    elif cmdcom == "":
        print("Введите любую команду из cmd после cmdcom")
    else:
        subprocess.run(['cmd', '/c', cmdcom])

def you_get_help():
    print("Для использования you-get введите: 'you-get [ссылка на видео]'")

def dec():
    try:
        while True: 
            cpu_gr = str(psutil.cpu_percent())
            cpu = "Percentage usage:" + cpu_gr + "%"
            cpu_r = psutil.cpu_percent()
            if psutil.cpu_percent() >= 30:
                cpu_r = "\033[31m {}" .format(cpu)
            elif psutil.cpu_percent() >= 50:
                cpu_r = "\033[33m {}" .format(cpu)
            elif psutil.cpu_percent() >= 100:
                cpu_r = "\033[32m {}" .format(cpu)
            print(cpu_r)   
            
            # CPU frequency
            cpu_info = psutil.cpu_freq()
            print(f"Current frequency: {cpu_info.current:.2f} Mhz")
            print(f"Minimum frequency: {cpu_info.min:.2f} Mhz")
            print(f"Maximum frequency: {cpu_info.max:.2f} Mhz")
            time.sleep(0.20)
            os.system('cls')
            
            time.sleep(5)
    except KeyboardInterrupt:
        print("Команда прервана пользователем")


while True:
    if admin() == True:
        adm = "#"
    else:
        adm = "~"

    command = input(os.getcwd() + adm + "sh" + ">>")

    if command == "exit":
        print("Выход из syshab")
        exit()
    elif command == "dir":
        print(os.listdir())
    elif command.startswith("cm"):
        directory_name = command.split(" ")[1]
        os.mkdir(directory_name)
        print(f"Создана директория {directory_name}")
    elif command.startswith("del"):
        directory_name = command.split(" ")[1]
        os.rmdir(directory_name)
        print(f"Директория {directory_name} удалена")
    elif command == 'help':
        print(' "dir" (показать содержимое текущей директории),\f,"open" - открывает файлы (не все)  ')
        print("cm <имя_директории> (создать директорию), \f  del <имя_директории> (удалить директорию).")
    elif command.startswith("cd"):
        directory_name = command.split(" ")[1]
        os.chdir(directory_name)
    elif command == "pw":
        print(os.getcwd())
    elif command == "C:":
        print(C())
    elif command == "date":
        print (datetime.datetime.now())
    elif command == "filesystem":
        print(directoryс())
    elif command == "open":
        print("может открыть")
        print (openp)
        opencom = input("Введите формат файла: " + kast)
        if opencom == "txt":
            opentxt()
        elif opencom == "bat":
            directb= input ("Введите полный путь: " + kast)
            os.system(directb)
            subprocess.call([directb])
            subprocess.call(["ping", "-c", "3", "google.com"])
        elif opencom == "exe":
            direct= input ("Введите полный путь:")
            os.system(r'direct')
        elif opencom == "jpg":
            openphoto()
        elif opencom == "png":
            openphoto()
        elif opencom == "wav":
            musics()
        elif opencom == "mp3":
            musics()
    elif command == "cmd":
        os.system(cmd)
        subprocess.call([cmd])
        subprocess.call(["ping", "-c", "3", "google.com"])
    elif command == "to close":
        print("Выход из syshab")
        print (":)")
        exit()
    elif command == "pip":
        package = input("Установить модуль :")
        subprocess.check_call([sys.executable, '-m', 'pip', 'install', package])
    elif command == "os platform":
        infoplatform()
    elif command == "pydire":
        print(sys.executable)
    elif command == "process":
        print(psutil.Process().cpu_percent(interval=1))
    elif command == "calc":
        calc()
    elif command == "sudo":
        sudo() 
    elif command.startswith("anti"):
        if len(command.split()) == 1:  # Проверяем, содержит ли команда только "anti"
            print("Введите путь к файлу или URL")
        else:
            target = command.split(" ")[1]
            anti_virus(target)
    elif command == "dec":
        dec()
    elif command == "cmdcom":
        cmdcom()
    elif command == "you-get -h":
        you_get_help()


    else:
        print("Неизвестная команда")
