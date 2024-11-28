//Домашняя работа по теме "Виды ссылок + ARC"
//
//Задача 1: Циклические ссылки и слабые ссылки
//
//Условие:
//
//Создайте два класса: Person и Car. Класс Person должен иметь свойство car, которое ссылается на объект Car. Класс Car должен иметь свойство owner, которое ссылается на объект Person. Реализуйте эти классы так, чтобы избежать циклической ссылки, используя слабую ссылку.
//
//Требования:
//
//Определите классы Person и Car.
//Убедитесь, что при создании экземпляров Person и Car они могут ссылаться друг на друга, но при этом не создают циклическую ссылку.
//Напишите код, который создает экземпляры обоих классов и выводит информацию о владельце автомобиля.
//Подсказка: Используйте weak для свойства owner в классе Car.

class Person {
    var car: Car?
    let name: String
    
    init(car: Car? = nil, name: String) {
        self.car = car
        self.name = name
    }
}

class Car {
    weak var owner: Person?
    let model: String
    
    init(owner: Person? = nil, model: String) {
        self.owner = owner
        self.model = model
    }
    
    func getOwnerName() -> String? {
        owner?.name
    }
}

let person = Person(name: "John")
let car = Car(owner: person, model: "Ford")
person.car = car
print("Владелец автомобиля \(person.car?.model ?? ""): \(person.car?.getOwnerName() ?? "")")




//Задача 2: Счетчик ссылок и управление памятью
//
//Условие:
//
//Создайте класс Library, который будет содержать массив книг. Каждая книга представляется классом Book, который имеет свойство title и свойство library, ссылающееся на объект Library. Реализуйте так, чтобы при удалении объекта Library все связанные с ним объекты Book также освобождались из памяти.
//
//Требования:
//
//Определите классы Library и Book.
//Убедитесь, что при создании экземпляров Library и Book они могут ссылаться друг на друга, но при этом корректно управляют памятью.
//Напишите код, который создает экземпляр Library, добавляет в него несколько книг, а затем удаляет библиотеку, проверяя, что книги освобождаются из памяти.
//Подсказка: Используйте unowned для свойства library в классе Book, если вы уверены, что Book не будет существовать без Library.

class Library {
    var books: [Book]?
    
    init(books: [Book]) {
        self.books = books
    }
    
    deinit {
        self.books = nil
    }
}

class Book {
    let title: String
    unowned var library: Library?
    
    init(title: String, library: Library) {
        self.title = title
        self.library = library
    }
}

var library: Library? = Library(books: [])
library?.books = [
    Book(title: "Swift", library: library!),
    Book(title: "SwiftUI 2", library: library!),
    Book(title: "SwiftUI 3", library: library!)
]

library
print(library?.books![0].title)
library = nil
library
print(library?.books![0].title)

