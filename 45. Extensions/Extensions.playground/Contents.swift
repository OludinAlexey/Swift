//Домашняя работа по теме "Расширения"
//Задача 1: Расширение для вычисляемого свойства
//
//Создайте структуру Circle, которая будет представлять круг с радиусом. Затем создайте расширение для этой структуры, добавив вычисляемое свойство circumference, которое будет вычислять и возвращать длину окружности круга. Формула для вычисления длины окружности: 2 * π * radius.
//
//Шаги для выполнения:
//
//Определите структуру Circle с одним свойством radius.
//Создайте расширение для структуры Circle.
//В расширении добавьте вычисляемое свойство circumference.
//Напишите код, который создаст экземпляр Circle и выведет его радиус и длину окружности.
import Foundation
struct Circle {
    let radius: Double
}

extension Circle {
    var circumference: Double {
        2 * .pi * radius
    }
}

let circle = Circle(radius: 10)
print("Радиус: \(circle.radius)")
print("Длина окружности: \(circle.circumference)")


//Задача 2: Расширение для работы с строками
//
//Создайте расширение для типа String, которое добавляет метод reversedWords(). Этот метод должен возвращать строку, в которой порядок слов изменен на обратный. Например, строка "Hello World" должна быть преобразована в "World Hello".
//
//Шаги для выполнения:
//
//Создайте расширение для типа String.
//В расширении добавьте метод reversedWords(), который будет возвращать строку с перевернутыми словами.
//Напишите код, который протестирует метод на нескольких строках.

extension String {
    func reversedWords() -> String {
        split(separator: " ").reversed().joined(separator: " ")
    }
}

[
    ("Hello World", "World Hello"),
    ("Swift is awesome", "awesome Swift"),
    ("", ""),
    ("12345", "54321"),
].forEach { (testString, expectedString) in
    if testString.reversedWords() != expectedString {
        print("Test failed for \(testString): expected \(expectedString), got \(testString.reversedWords())")
    } else {
        print("Test passed for \(testString)")
    }
}
