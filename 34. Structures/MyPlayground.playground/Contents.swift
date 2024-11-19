import Foundation

//1. Создайте структуру Product, которая будет иметь следующие свойства:name: строка (название продукта),price: число с плавающей точкой (цена),inStock: булево значение (есть ли в наличии).Добавьте метод, который выводит информацию о продукте в формате: "Продукт: (name), цена: (price), в наличии: (inStock)".

struct Product {
    let name: String
    let price: Double
    let inStock: Bool
    
    func printInfo() {
        print("Продукт: \(name), цена: \(price), в наличии: \(inStock)")
    }
}

var product = Product(name: "Молоко", price: 30, inStock: true)
product.printInfo()

//2. Реализуйте структуру для описания географической координатыСоздайте структуру Coordinate с двумя свойствами: latitude и longitude (оба типа Double).Добавьте метод, который будет рассчитывать расстояние между двумя точками по формуле расстояния между координатами (воспользуйтесь упрощенной формулой Евклидовой дистанции).

struct Coordinate {
    let latitude: Double
    let longitude: Double
    
    static func getDistance(from: Coordinate, to: Coordinate) -> Double {
        var distance: Double
        
        distance = sqrt(pow((from.latitude - to.latitude), 2) + pow((from.longitude - to.longitude), 2))
        
        return distance
    }
}

let point1 = Coordinate(latitude: 1, longitude: 1)
let point2 = Coordinate(latitude: 5, longitude: 4)

Coordinate.getDistance(from: point1, to: point2)

//3. Применение структуры для работы с точками и прямоугольникамиСоздайте две структуры: Point (с координатами x и y) и Rectangle, которая содержит два свойства типа Point для описания левого верхнего и правого нижнего углов прямоугольника.Добавьте метод в Rectangle, который будет рассчитывать площадь фигуры.

struct Point {
    let x: Int
    let y: Int
}

struct Rectangle {
    let upperLeftPoint: Point
    let lowerRightPoint: Point
    
    func getSquare() -> Int {
        var square: Int = 0
        
        square = (upperLeftPoint.y - lowerRightPoint.y) * (lowerRightPoint.x - upperLeftPoint.x)
        
        return square
    }
}

let rectangle = Rectangle(
    upperLeftPoint: Point(x: 1, y: 4),
    lowerRightPoint: Point(x: 5, y: 1)
)

rectangle.getSquare()
