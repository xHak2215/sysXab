import matplotlib.pyplot as plt
import mplcyberpunk
import math
from art import *
# pip install mplcyberpunk
kast ='>>'

def sinus():
    sin = input("Введите значение угла в градусах для нахождения синуса (sin){kast}")
    sin = float(sin)
    print(math.sin(math.radians(sin)))

def cosinus():   
    cos = input("Введите значение угла в градусах для нахождения косинуса (cos){kast}")
    cos = float(cos)
    print(math.cos(math.radians(cos)))

def tanget():
    tan = input("Введите значение угла в градусах для нахождения тангенса (tan){kast}")
    tan = float(tan)
    print(math.tan(math.radians(tan)))

def pi():
    print(math.asin(1))
def e():
    print(math.e)
def radiys():
    radius = input('radius')
    print(f'Площадь окружности с радиусом {radius} равна:', math.pi * (radius ** 2))
def grafik():

    x=input(f'X{kast}')
    y=input(f'Y{kast}')
    graf=[x,y]
    plt.style.use("cyberpunk")
    plt.plot(graf, marker='o')
    mplcyberpunk.add_glow_effects()
    plt.show()
def ekspodent_rost():
#y: Конечная сумма, оставшаяся за определенный период времени
#a: исходная сумма
#x: время
#p: придел
    a= input(f'исходная сумма{kast}')
    b= 0
    p= input(f'придел{kast}')
    x =input(f'время {kast}')
    y=0
    liste =[]
    for i in range(p):
        x = x+1
        d= 1+b
        liste.append(a*d**x)
        print(f'time: {x}')
        print(y)
    #y = a (1 + b)x
    plt.style.use("cyberpunk")
    plt.plot(liste, marker='o')
    mplcyberpunk.add_glow_effects()
    plt.show()
    
def convert_length(value, from_unit, to_unit):
    # Длина в метрах
    units = {
        'meters': 1,
        'kilometers': 1000,
        'centimeters': 0.01,
        'millimeters': 0.001,
        'miles': 1609.34,
        'yards': 0.9144,
        'feet': 0.3048
    }
    
    return value * (units[to_unit] / units[from_unit])


def convert_mass(value, from_unit, to_unit):
    # Масса в килограммах
    units = {
        'kilograms': 1,
        'grams': 0.001,
        'milligrams': 0.000001,
        'pounds': 0.453592,
        'ounces': 0.0283495
    }
    
    return value * (units[to_unit] / units[from_unit])


def convert_temperature(value, from_unit, to_unit):
    if from_unit == 'Celsius':
        if to_unit == 'Fahrenheit':
            return (value * 9/5) + 32
        elif to_unit == 'Kelvin':
            return value + 273.15
    elif from_unit == 'Fahrenheit':
        if to_unit == 'Celsius':
            return (value - 32) * 5/9
        elif to_unit == 'Kelvin':
            return (value - 32) * 5/9 + 273.15
    elif from_unit == 'Kelvin':
        if to_unit == 'Celsius':
            return value - 273.15
        elif to_unit == 'Fahrenheit':
            return (value - 273.15) * 9/5 + 32
    return value  # Если единицы совпадают


def perivod():
    print("Калькулятор единиц")
    print("1. Длина")
    print("2. Масса")
    print("3. Температура")
    
    choice = input("Выберите категорию (1/2/3): ")

    if choice == '1':
        value = float(input("Введите значение: "))
        from_unit = input("Введите единицу измерения (meters, kilometers, centimeters, millimeters, miles, yards, feet): ")
        to_unit = input("Введите единицу для конвертации: ")
        result = convert_length(value, from_unit, to_unit)
        print(f"{value} {from_unit} = {result} {to_unit}")

    elif choice == '2':
        value = float(input("Введите значение: "))
        from_unit = input("Введите единицу измерения (kilograms, grams, milligrams, pounds, ounces): ")
        to_unit = input("Введите единицу для конвертации: ")
        result = convert_mass(value, from_unit, to_unit)
        print(f"{value} {from_unit} = {result} {to_unit}")

    elif choice == '3':
        value = float(input("Введите значение: "))
        from_unit = input("Введите единицу измерения (Celsius, Fahrenheit, Kelvin): ")
        to_unit = input("Введите единицу для конвертации: ")
        result = convert_temperature(value, from_unit, to_unit)
        print(f"{value} {from_unit} = {result} {to_unit}")

    else:
        print("Неверный выбор")



def meny():
    Art = text2art("calc", font='block', chr_ignore=True) 
    print(Art) 
    print(f'1 sinus , 2 cosinus , 3 tanget , 4 pi,  5 e , 6 radiys , 7 grafik , 8 Экспоненциальный рост , 9 перевод едениц')
    menu = input(f'calk_m{kast}')
    if menu =="1":
        sinus()
    elif menu =='2':
        cosinus()
    elif menu == '3':
        tanget()
    elif menu == '4':
        pi()
    elif menu == '5':
        e()
    elif menu == '6':
        radiys()
    elif menu == '7':
        grafik()
    elif menu == '8':
        ekspodent_rost()
    elif menu == '9':
        perivod()
        
meny()