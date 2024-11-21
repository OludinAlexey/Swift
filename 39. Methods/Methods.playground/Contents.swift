
//Создайте класс "Calculator" с методом "add" для сложения двух чисел. Добавьте также статический метод "multiply" для умножения двух чисел. Проверьте работу обоих методов, передавая различные значения и выводя результаты на экран.

class Calculator {
    static func add<T: Numeric>(a: T, b: T) -> T {
        return a + b
    }
    
    static func multiply<T: Numeric>(a: T, b: T) -> T {
        return a * b
    }
}

Calculator.add(a: 4.3, b: 4)
Calculator.multiply(a: -3, b: -2.2)

//Создайте класс "StringManipulator" с методом "concatenate" для объединения двух строк. Перегрузите этот метод, добавив возможность объединять три строки. Проверьте работу обоих методов, передавая различные значения и выводя результаты на экран.

class StringManipulator {
    static func concatenate(textA: String, textB: String) -> String {
        return textA + textB
    }
    
    static func concatenate(textA: String, textB: String, textC: String) -> String {
        return textA + textB + textC
    }
}

StringManipulator.concatenate(textA: "Hello", textB: "World")
StringManipulator.concatenate(textA: "Hello", textB: " ", textC: "World")
