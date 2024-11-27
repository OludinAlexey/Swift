//Домашняя работа по теме "Протоколы"
//Задача 1: Протокол "Identifiable"
//
//Создайте протокол Identifiable, который будет описывать объекты, имеющие уникальный идентификатор. Протокол должен содержать следующее требование:
//
//Свойство id, которое возвращает уникальный идентификатор типа String.
//Затем создайте две структуры, реализующие этот протокол: User и Product.
//
//Требования:
//
//Структура User должна иметь свойства name и email, а также уникальный идентификатор id, который можно генерировать при инициализации.
//Структура Product должна иметь свойства name, price и уникальный идентификатор id, который также можно генерировать при инициализации.
//Реализуйте метод description() для обеих структур, который возвращает строку с информацией о пользователе или продукте.
import Foundation
protocol Identifiable {
    var id: String { get }
}

struct User: Identifiable {
    let name: String
    let email: String
    let id: String = UUID().uuidString
    
    func description() -> String {
        "User: \(name), \(email)"
    }
}

struct Product: Identifiable {
    let name: String
    let price: Double
    let id: String = UUID().uuidString
    
    func description() -> String {
        "Product: \(name), \(price)"
    }
}

let user = User(name: "John", email: "john@example.com")
let product = Product(name: "MacBook", price: 1200)
print("\(user.id) \(user.description())")
print("\(product.id) \(product.description())")

//Задача 2: Протокол "Playable"
//
//Создайте протокол Playable, который будет описывать объекты, которые можно воспроизводить. Протокол должен содержать следующие методы:
//
//play(): запускает воспроизведение.
//pause(): ставит воспроизведение на паузу.
//stop(): останавливает воспроизведение.
//Затем создайте два класса, реализующие этот протокол: Audio и Video.
//
//Требования:
//
//Класс Audio должен иметь свойство title и выводить в консоль соответствующие сообщения при вызове методов play(), pause() и stop().
//Класс Video должен иметь свойства title и duration, а также выводить в консоль сообщения, аналогичные классу Audio.

protocol Playable {
    func play()
    func pause()
    func stop()
}

class Audio: Playable {
    
    let title: String
    
    init(title: String) {
        self.title = title
    }
    
    func play() {
        print("Playing \(title)")
    }
    
    func pause() {
        print("Pause \(title)")
    }
    
    func stop() {
        print("Stop \(title)")
    }
}

class Video: Playable {
    
    let title: String
    let duration: Int
    
    init(title: String, duration: Int) {
        self.title = title
        self.duration = duration
    }
    
    func play() {
        print("Playing \(title), duration: \(duration)")
    }
    
    func pause() {
        print("Pause \(title), duration: \(duration)")
    }
    
    func stop() {
        print("Stop \(title), duration: \(duration)")
    }
}

let audio = Audio(title: "Hello World")
audio.play()
audio.pause()
audio.stop()

let video = Video(title: "Swift", duration: 10)
video.play()
video.pause()
video.stop()
