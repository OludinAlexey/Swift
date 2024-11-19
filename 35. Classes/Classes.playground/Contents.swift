//Создайте базовый класс Vehicle с общими характеристиками для транспортных средств (например, speed: Int, capacity: Int), а затем создайте два подкласса: Car и Bicycle. Для каждого класса реализуйте методы для расчета времени поездки на определенное расстояние.
//
//В классе Vehicle создайте метод travelTime(for distance: Int) -> Int, который возвращает примерное время поездки для переданного расстояния.
//В классе Car добавьте свойство fuelConsumption и переопределите метод для учета скорости и расхода топлива.
//В классе Bicycle учтите, что велосипед движется медленнее, чем автомобиль, и переопределите метод для расчета времени поездки.
//Цель: понять, как классы и подклассы взаимодействуют через наследование и как можно переопределять методы.

class Vehicle {
    let speed: Int
    let capacity: Int
    
    init(speed: Int, capacity: Int) {
        self.speed = speed
        self.capacity = capacity
    }
    
    func travelTime(for distance: Int) -> Int {
        return distance / speed
    }
}

class Car: Vehicle {
    let fuelConsumption: Int
    let amountOfFuel: Int
    
    init(fuelConsumption: Int, amountOfFuel: Int) {
        self.fuelConsumption = fuelConsumption
        self.amountOfFuel = amountOfFuel
        super.init(speed: 150, capacity: 4)
    }
    
    override func travelTime(for distance: Int) -> Int {
        if(amountOfFuel - distance / fuelConsumption > 0) {
            return distance / speed
        }
        return 0
    }
}

class Bicycle: Vehicle {
    
    init() {
        super.init(speed: 15, capacity: 1)
    }
    
    override func travelTime(for distance: Int) -> Int {
        return distance / speed
    }
}
