//Задача 1: Хранимое свойство (Уровень 1 - Начальный)Описание: Создайте структуру Book, которая будет представлять книгу. У неё должны быть два хранимых свойства: title (название книги) и author (автор книги). Добавьте метод, который выводит информацию о книге в формате "Название: [название], Автор: [автор]".

struct Book {
    let title: String
    let author: String
    
    func info() {
        print("Название: \(title), Автор: \(author)")
    }
}

let book = Book(title: "Робинзон Крузо", author: "Даниэл Дефо")
book.info()

//Задача 2: Вычисляемое свойство (Уровень 2 - Средний)Описание: Создайте класс Temperature, который будет представлять температуру в градусах Цельсия. У класса должно быть одно хранимое свойство celsius. Добавьте вычисляемое свойство fahrenheit, которое будет возвращать температуру в градусах Фаренгейта

class Temperature {
    let celsius: Double
    
    init(celsius: Double) {
        self.celsius = celsius
    }
    
    var fahrenheit: Double {
        get {
            celsius * 9 / 5 + 32
        }
    }
}

let temp = Temperature(celsius: 30)
temp.fahrenheit

//Задача 3: Хранимое и Вычисляемое (Уровень 3 - Сложный)Создайте класс Rectangle, который будет иметь приватные свойства width и height для хранения ширины и высоты прямоугольника.Реализуйте геттеры и сеттеры для ширины и высоты.

class Rectangle {
    private var width: Int
    private var height: Int
    
    init(width: Int, height: Int) {
        self.width = width
        self.height = height
    }
    
    var getWidth: Int {
        get {
            return width
        }
        
        set {
            width = newValue
        }
    }
    
    var getHeight: Int {
        get {
            return height
        }
        
        set {
            height = newValue
        }
    }
}

let rectangle = Rectangle(width: 40, height: 50)
rectangle.getHeight
rectangle.getWidth
