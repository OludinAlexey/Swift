//
//  main.swift
//  Guess the number
//
//  Created by Алексей Олудин on 13.08.2024.
//
/*
Алгоритм такой:
 В цикле While до тех пор, пока константа не будет инициализирована 0 или пользователь при ответе на предложение сыграть еще раз не введет слово "Нет" игра выводит меню с предложение выбрать режим игры "Пользователь против компьютера" или "Компьютер против компьютера", или "Выход". Выбор осуществляется с помощью switch-case
 В зависимости от выбранного режима в переменную userNumber развертывается строковый опционал, введенный пользователем из консоли, с последующим преобразованием в Int (режим "Пользователь против компьютера"), или генерируется случайное число в режиме "Компьютер против компьютера".
 Затем для режима "Пользователь против компьютера" в цикле while происходит запрос на ввод правильного числа до тех пор пока не пользователь на введет верное.
 А для режима "Компьютер против компьютера" перебор всех возможных значений в цикле While пока не дойдет до верного.
*/

import Foundation

print("Игра \"Угадай число\"\n")
while true {
    print("Выберите режим:")
    print("1 - Пользователь против компьютера")
    print("2 - Компьютер против компьютера")
    print("0 - Выход")
    let mode = Int(readLine() ?? "-1")
    var number: Int = -1
    var userNumber: Int? = -1
    switch mode {
        
    case 0:
        exit(0)
        
    case 1: // Режим "Пользователь против компьютера"
        
        number = Int.random(in: 0...100)
        print("Компьютер загадал число: \(number)")
        print("Введите число:")
        userNumber = Int(readLine() ?? "-1")
        while userNumber != number {
            print("Неверно. Попробуйте еще раз:")
            userNumber = Int(readLine() ?? "-1")
        }
        
        
    case 2: // Режим "Компьютер против компьютера"
        
        number = Int.random(in: 0...100)
        print("Компьютер загадал число: \(number)")
        while userNumber != number {
            userNumber = Int.random(in: 0...100)
            print("Соперник-компьютер выбрал число \(userNumber ?? -1)")
        }
        
    default: // Если пользователь ввел что-то другое
        print("")
    }
    
    
    print("Да, это число \(number)")
    print("Сыграем еще разок? [Да]/Нет")
    if readLine() != "Нет" {}
    else {exit(0)}
}
