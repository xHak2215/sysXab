import tkinter as tk
from tkinter import filedialog
import os

def open_file():
    file_path = filedialog.askopenfilename()
    with open(file_path, 'r') as file:
        editor.delete('1.0', tk.END)
        editor.insert('1.0', file.read())

def save_file():
    file_path = filedialog.asksaveasfilename()
    with open(file_path, 'w') as file:
        file.write(editor.get('1.0', tk.END))
        
def color_red():
    root.configure(background='red')
def color_dark():
    root.configure(background='black')
def start_py():
    with open('unicond.py', 'w') as file:
        file.write(editor.get('1.0', tk.END))
#        editor.insert('1.0', file.read())
    os.system("python unicond.py")   
    
root = tk.Tk()
root.title("consolSH read")

menu = tk.Menu(root)
root.config(menu=menu)

file_menu = tk.Menu(menu)
kastom=tk.Menu(menu)
menu.add_cascade(label="Файл", menu=file_menu)
file_menu.add_command(label="Открыть", command=open_file)
file_menu.add_command(label="Сохранить", command=save_file)
file_menu.add_command(label="занустить py", command=start_py)
file_menu.add_separator()
file_menu.add_command(label="Выход", command=root.quit)
menu.add_cascade(label="кастом", menu=kastom)
kastom.add_command(label="red", command=color_red)
kastom.add_command(label="black", command=color_dark)
kastom.add_separator()

editor = tk.Text(root)
editor.pack()

root.mainloop()

