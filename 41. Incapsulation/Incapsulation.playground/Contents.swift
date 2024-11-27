//Задача 1: Класс "Книга"
//
//Создайте класс Book, который будет представлять книгу. Класс должен иметь следующие свойства:
//
//title (название книги) - строка
//author (автор) - строка
//pages (количество страниц) - целое число
//Реализуйте инкапсуляцию, сделав свойства приватными, и добавьте следующие методы:
//
//init(title:author:pages:) - инициализатор для создания новой книги.
//getDescription() - метод, который возвращает строку с описанием книги в формате: "Название: [title], Автор: [author], Страниц: [pages]".

class Book {
    private var title: String
    private var author: String
    private var pages: Int
    
    init(title: String, author: String, pages: Int) {
        self.title = title
        self.author = author
        self.pages = pages
    }
    
    func getDescription() -> String {
        "Название: \(title), Автор: \(author), Страниц: \(pages)"
    }
}


//Задача 2: Класс "Счетчик"
//
//Создайте класс Counter, который будет представлять простой счетчик. Класс должен иметь приватное свойство:
//
//count (текущий счет) - целое число, которое изначально равно 0.
//Реализуйте инкапсуляцию, сделав свойство count приватным, и добавьте следующие методы:
//
//increment() - метод, который увеличивает счетчик на 1.
//decrement() - метод, который уменьшает счетчик на 1.
//getCount() - метод, который возвращает текущее значение счетчика.

class Counter {
    private var count: Int = 0
    
    func increment() {
        count += 1
    }
    
    func decrement() {
        count -= 1
    }
    
    func getCount() -> Int {
        count
    }
}
