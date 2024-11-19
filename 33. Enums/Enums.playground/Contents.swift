//1. Создайте приложение, которое содержит список различных транспортных средств (например, автомобиль, велосипед, поезд и самолет). Используйте перечисление (enum) для определения типов транспортных средств и свяжите их с соответствующими характеристиками, такими как скорость и количество пассажиров.

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

//2. Использование Enum с rawValueСоздайте перечисление WeekDay, в котором каждый день недели будет ассоциирован с его номером (например, 1 — понедельник, 2 — вторник и так далее).Используйте rawValue для инициализации значений.Напишите функцию, которая принимает номер дня недели (например, 3) и возвращает название этого дня в виде строки.

enum WeekDay: Int {
    case monday = 1
    case thuesday
    case wednesday
    case thursday
    case friday
    case saturday
    case sunday
}

func getWeekDayNameByNumber(number: Int) -> String? {
    var dayName: String? = switch number {
    case 1:
        "Понедельник"
    case 2:
        "Врорник"
    case 3:
        "Среда"
    case 4:
        "Четверг"
    case 5:
        "Пятница"
    case 6:
        "Суббота"
    case 7:
        "Воскресенье"
    default: nil
    }
    
    return dayName
}

let weekday = WeekDay.friday
print("\(weekday.rawValue) - \(getWeekDayNameByNumber(number: weekday.rawValue) ?? "Нет такого дня недели")")
