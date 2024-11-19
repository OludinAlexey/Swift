//Домашняя работа по теме "Функции"
//
//Задача 1:
//Функция для вычисления суммы двух чисел (Простая) Напишите функцию sum(a:b:), которая принимает два целых числа и возвращает их сумму.
//

func sum(a: Int, b: Int) -> Int {
    return a + b
}

//sum(a: -6, b: 14)

//Задача 2:
//Функция для вычисления факториала (Простая) Напишите функцию factorial(n:), которая принимает целое число и возвращает его факториал. Используйте рекурсию.
//

func factorial(n: Int) -> Int {
    var result: Int = n
    
    switch n {
    case 1...:
        result = n * factorial(n: result - 1)
    case 0:
        result = 1
    case ..<0:
        result = 0
        print("Факториал отрицательного числа не существует.")
        break
    default:break
    }
    return result
}

//factorial(n: 0)

//Задача 3:
//Функция для проверки, является ли строка палиндромом (Средняя) Напишите функцию isPalindrome(_:), которая принимает строку и возвращает true, если строка является палиндромом, и false в противном случае. Игнорируйте регистр символов и пробелы.
//

func isPalindrome(string: String) -> Bool {
    var result: Bool = true
    var s = string.lowercased()
        s.replace(" ", with: "")
    
    while s.count > 1 {
        if s.first == s.last{
            result = true
            s.removeFirst()
            s.removeLast()
        } else {
            return false
        }
    }
    
    return result
}

//isPalindrome(string: " F y")

//Задача 4:
//Функция для нахождения наибольшего общего делителя (НОД) (Продвинутая) Напишите функцию gcd(a:b:), которая принимает два целых числа и возвращает их наибольший общий делитель (НОД) с использованием алгоритма Евклида.
//

func gcd(a: Int, b: Int) -> Int {
    
    var gN: Int
    var lN: Int
    var mod: Int
    
    if a == 0 || b == 0 {
        print("Один из параметров равен нулю")
        return 0
    }
    
    if a >= b {gN = a; lN = b}
    else {gN = b; lN = a}
    
    repeat {
        
        mod = gN % lN
        gN = lN
        lN = mod
        
    } while mod != 0
    
    return gN
}

//gcd(a: -5, b: 0)



//Задача 5:
//Функция для фильтрации массива с функцией проверки (Высокая сложность) Напишите функцию filterArray(array:predicate:), которая принимает массив целых чисел и функцию проверки, возвращающее true или false для каждого элемента массива. Функция должна возвращать новый массив, содержащий только те элементы, для которых функция проверки вернула true.

func greatThan(_ number: Int, than: Int) -> Bool{
    number > than ? true : false
}

func filterArray(array: [Int], predicate: (Int, Int) -> (Bool)) -> [Int]{
    var result: [Int] = []
    var tnanNumber: Int = 3
    
    for number in array {
        if predicate(number, tnanNumber) {
            result.append(number)
        }
    }
    return result
}

let array: [Int] = [1, 2, 4, 5, 9, 3, 9, 0, 7]
filterArray(array: array, predicate: greatThan(_:than:))
