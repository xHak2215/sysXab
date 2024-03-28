import os
import time
import  types
import datetime
from tkinter import messagebox as mb
import subprocess
# настройка
#open:
openp =["txt","bat","exe"]


def admin():
   try:
     return os.getpid() == 0
   except AttributeError:
     return ctypes.windll.shell32.IsUserAnAdmin() != 0
    #print (admin())


def directoryс():
    print (os.getcwd())
    C =  os.listdir("Cd/")
    os.chdir ("Cd/root")
    root =  os.listdir(os.getcwd())
    os.chdir("..")
    os.chdir("file")
    os.listdir(os.getcwd())
    file = os.listdir(os.getcwd())
    print(root + file)                 

def opentxt():
    
        txt =input ("видите путь файла:")
        os.path.isdir(txt) 
        sv =input ("ведте способ взаимодействия (чтобы получить потскаску вебите help):")
        print(sv)
        if sv == "help":
            print("w -(запись)\f a — (добавление данных к уже существующему файлу)\f r —(чтение)")
        else :
            print("error")
        so =["r","a","w"]
        for sv in so :
            txtfile = open(txt , sv)
            print(txtfile.read())
            txtfile.close()

    
    
    


if admin() == True:
    adm = "#"
else:
    adm = "~"
#print(directoryс())

while True:

    command = input(os.getcwd() + adm + "▶")
    if command == "exit":
        print("Выход из syshab")
        exit()
    elif command == "dir" :
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
        opencom = input("ведите формат файла:")
        if opencom == "txt":
            opentxt()
        elif opencom == "bat":
            directb= input ("ведите полный путь:")
            os.system(directb)
            subprocess.call([directb])
            subprocess.call(["ping", "-c", "3", "google.com"])
        elif opencom == "exe":
            direct= input ("ведите полный путь:")
            os.system(r'direct')


        
        
        

           
    else:
        print("Неизвестная команда")
