enum Vehicle: String {
    case auto = "Автомобиль"
    case bicycle = "Велосипед"
    case train = "Поезд"
    case airplane = "Самолёт"
}

var vehicle = Vehicle.bicycle
var speed: Int
var passengersCount: Int

switch vehicle {
case .auto:
    speed = 120
    passengersCount = 4
case .bicycle:
    speed = 30
    passengersCount = 1
case .airplane:
    speed = 1350
    passengersCount = 300
case .train:
    speed = 300
    passengersCount = 1000
}

print("\(vehicle.rawValue) имеет скорость \(speed) и количество пассажиров \(passengersCount)")
