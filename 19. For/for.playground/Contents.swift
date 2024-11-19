//Домашняя работа по теме "Циклы [for]"

//Задача 1: Вывод букв в строке
//Напишите программу, которая принимает строку и выводит каждую букву этой строки на новой строке.

let string = "Привет!!!"
print("Каждая буква строки: \"\(string)\":")
for character in string {
    print(character)
}
print("____________________________________________________________________________\n")

//Задача 2: Подсчет гласных
//Создайте программу, которая считает количество гласных букв в строке.

let string2 = "Hello World!!!"
let vowels: [Character] = ["a","e","i","o","u","а","е","ё","и","о","у","ы","э","ю","я"]
var vowelsNumber: UInt = 0

for character in string2 {
    for vowel in vowels {
        if character == vowel {
            vowelsNumber += 1
        }
    }
}

print("Количество гласных в строке \"\(string2)\":\n\(vowelsNumber)")
print("____________________________________________________________________________\n")

//Задача 3: Создание нового массива с длиной строк
//Напишите программу, которая создает массив строк и формирует новый массив, содержащий длины этих строк.

let stringsArray: [String] = ["Первая строка",
                              "Вторая строка",
                              "Третья строка",
                              "Еще одна строка",
                              "И еще одна срока",
                              "Как много строк!",
                              "Прекратите!!!"]
var stringsLengths: [Int] = []
for string in stringsArray {
    stringsLengths.append(string.count)
}

//Задача 4: Фильтрация четных чисел
//Создайте массив из десяти целых чисел и сформируйте новый массив, содержащий только четные числа.
var numbers: [Int] = []
var evenNumbers: [Int] = []

for _ in 0..<10 {
    numbers.append(Int.random(in: -99...99))
}

print("Исходный массив:\n\(numbers)")
for number in numbers {
    if number % 2 == 0 {
        evenNumbers.append(number)
    }
}

print("Массив с четными числами:\n\(evenNumbers)")

print("____________________________________________________________________________\n")

//Задача 5: Обратный порядок элементов
//Напишите программу, которая создает массив из пяти целых чисел и выводит элементы массива в обратном порядке.

var numbers2: [Int] = []

for _ in 0..<5 {
    numbers2.append(Int.random(in: -99...99))
}


print("Исходный массив:\n\(numbers2)")
print("Массив в обратном порядке:")
for i in 0...numbers2.count - 1 {
    print(numbers2[numbers2.count - 1 - i])
}
