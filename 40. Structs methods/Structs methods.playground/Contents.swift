//Задача 1: Мутационный и статический методы
//
//Создайте структуру BankAccount с двумя свойствами: balance и accountNumber. Реализуйте мутационный метод deposit(amount:), который увеличивает баланс на заданную сумму. Также реализуйте статический метод createAccount(number:), который создает новый экземпляр BankAccount с заданным номером счета и начальным балансом 0.

struct BankAccount {
    var balance: Double
    let accountNumber: Int
    
    mutating func deposit(amount: Double) {
        balance += amount
    }
    
    static func createAccount(number: Int) -> BankAccount {
        .init(balance: 0, accountNumber: number)
    }
}

var account = BankAccount(balance: 10.2, accountNumber: 100)
account.deposit(amount: 10)
BankAccount.createAccount(number: 101)

//Задача 2: Перегрузка методов
//Создайте структуру Vector с двумя свойствами: x и y. Реализуйте три метода: add(_:), subtract(_:) и multiply(by:). Методы add(_:) и subtract(_:) должны принимать другой экземпляр Vector в качестве аргумента и возвращать новый экземпляр Vector с соответствующей операцией. Метод multiply(by:) должен принимать скалярное значение в качестве аргумента и возвращать новый экземпляр Vector с соответствующим умножением.
//
//Перегрузите операторы + и -, чтобы они вызывали методы add(_:) и subtract(_:) соответственно.


struct Vector {
    var x: Double
    var y: Double
    
    func add(_ vector: Vector) -> Vector {
        .init(x: x + vector.x, y: y + vector.y)
    }
    
    func subtract(_ vector: Vector) -> Vector {
        .init(x: x - vector.x, y: y - vector.y)
    }
    
    func multiply(by scalar: Double) -> Vector {
        .init(x: x * scalar, y: y * scalar)
    }
    
    static func + (lhs: Vector, rhs: Vector) -> Vector {
        lhs.add(rhs)
    }
    
    static func - (lhs: Vector, rhs: Vector) -> Vector {
        lhs.subtract(rhs)
    }
}

var vector1: Vector = .init(x: 1, y: 2)
var vector2: Vector = .init(x: 3, y: 4)

vector1 + vector2
vector1 - vector2
vector1.multiply(by: 2)
