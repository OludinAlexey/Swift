//Условие:
//Создайте базовый класс Employee, который содержит свойства name и salary, а также метод details(), который возвращает строку с информацией о сотруднике. Затем создайте два подкласса: Manager и Intern, которые наследуют от класса Employee. В классе Manager добавьте свойство department, а в классе Intern — свойство duration (в месяцах). Переопределите метод details() в каждом подклассе, чтобы он возвращал соответствующее описание для каждого типа сотрудника. Напишите функцию, которая принимает массив объектов типа Employee и выводит информацию о каждом сотруднике.

class Employee {
    var name: String
    var salary: Double
    
    init(name: String, salary: Double) {
        self.name = name
        self.salary = salary
    }
    
    func details() -> String {
        "Имя: \(name), Зарплата: \(salary)"
    }
    
    static func printDetails(_ employees: [Employee]) {
        for employee in employees {
            print(employee.details())
        }
    }
}

class Manager: Employee {
    var department: String
    
    init(name: String, salary: Double, department: String) {
        self.department = department
        super.init(name: name, salary: salary)
    }
    
    override func details() -> String {
        super.details() + ", Отдел: \(department)"
    }
}

class Intern: Employee {
    var duration: Int
    
    init(name: String, salary: Double, duration: Int) {
        self.duration = duration
        super.init(name: name, salary: salary)
    }
    
    override func details() -> String {
        super.details() + ", Длительность: \(duration) месяца"
    }
}

var employees: [Employee] = []
employees.append(Manager(name: "John", salary: 1000, department: "IT"))
employees.append(Intern(name: "Jane", salary: 2000, duration: 12))
Employee.printDetails(employees)

//Задача 2: Наследование с использованием классов для книг
//
//Условие:
//Создайте базовый класс Book, который содержит свойства title и author, а также метод description(), который возвращает строку с описанием книги. Затем создайте два подкласса: EBook и PrintedBook, которые наследуют от класса Book. В каждом подклассе добавьте уникальное свойство: EBook будет иметь свойство fileSize, а PrintedBook — свойство pageCount. Переопределите метод description() в каждом подклассе, чтобы он возвращал соответствующее описание для каждого типа книги. Напишите функцию, которая принимает массив объектов типа Book и выводит описание каждой книги.

class Book {
    var title: String
    var author: String
    
    init(title: String, author: String) {
        self.title = title
        self.author = author
    }
    
    func description() -> String {
        "Название: \(title), Автор: \(author)"
    }
    
    static func printDescription(books: [Book]) {
        for book in books {
            print(book.description())
        }
    }
}

class EBook: Book {
    var fileSize: Int
    
    init(title: String, author: String, fileSize: Int) {
        self.fileSize = fileSize
        super.init(title: title, author: author)
    }
    
    override func description() -> String {
        "\(super.description())\nРазмер файла: \(fileSize)"
    }
}

class PrintedBook: Book {
    var pageCount: Int
    
    init(title: String, author: String, pageCount: Int) {
        self.pageCount = pageCount
        super.init(title: title, author: author)
    }
    
    override func description() -> String {
        "\(super.description())\nКоличество страниц: \(pageCount)"
    }
}

var books: [Book] = []
books.append(EBook(title: "Swift 4", author: "Igor Malyarov", fileSize: 1000))
books.append(PrintedBook(title: "Swift 5", author: "Igor Malyarov", pageCount: 230))
Book.printDescription(books: books)
