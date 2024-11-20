//Задачи необходимо решать абстрактно, без точной реализации. Важно научиться использовать lazy свойства и наблюдатели.
//То есть, например, реализовывать загрузку изображения не нужно, достаточно сделать как на занятии
//
//Задача 1: Ленивая инициализация
//
//Описание:
//Создайте класс ImageLoader, который содержит ленивое свойство imageData. Это свойство должно загружать данные изображения из URL только при первом доступе.
//
//Подсказка:
//Используйте lazy для инициализации свойства.
import UIKit
class ImageLoader {
    private lazy var imageData: UIImage? = {
        print("Loading image...")
        return UIImage(systemName: "star.fill")
    }()
    
    func showImage() {
        if let imageData = imageData {
            print("Displaying image")
        }
    }
}

let image = ImageLoader()
image.showImage()

//Задача 2: Наблюдатели свойств
//
//Описание:
//Создайте структуру Temperature с свойством celsius. Добавьте наблюдатели willSet и didSet, чтобы выводить в консоль старое и новое значение температуры при каждом изменении.
//
//Подсказка:
//Используйте willSet и didSet.

struct Temperature {
    var celsius: Double {
        willSet(newValue) {
            print("Новое значение температуры: \(newValue)")
        }
        didSet(oldValue) {
            print("Старое значение температуры: \(oldValue)")
        }
    }
}

var temp = Temperature(celsius: 30)
temp.celsius = 40

//Задача 3: Ленивая инициализация и наблюдатели
//
//Описание:
//Создайте класс UserProfile с ленивым свойством profilePicture, которое загружается из сети. Добавьте наблюдатель didSet для свойства username, который выводит сообщение в консоль при изменении имени пользователя.
//
//Подсказка:
//Сочетайте lazy и didSet.

class UserProfile {
    
    var username: String {
        didSet(oldValue){
            print("Имя пользователя \(oldValue) изменено на \(username)")
        }
    }
    
    private lazy var profilePicture: UIImage? = {
        print("Loading profile picture...")
        return UIImage(systemName: "star.fill")
    }()
    
    init(username: String) {
        self.username = username
    }
        
    func showImage() {
        if let profilePicture = profilePicture {
            print("Displaying image")
        }
    }
    
}

var user = UserProfile(username: "Eugene")
user.showImage()
user.username = "Victor"

//Задача 4: Кэширование данных
//
//Описание:
//Создайте класс DataCache, который содержит ленивое свойство cachedData. Это свойство должно загружать данные из файла при первом доступе, а также обновляться и сохраняться в файл при изменении через наблюдатель didSet.
//
//Подсказка:
//Используйте lazy для загрузки данных и didSet для их обновления.

class DataCache {
    lazy var cache: String? = {
        print("Loading cached data...")
        return "Eugene"
    }()
    
    lazy var cachedData: String? = {
        print("Loading cached data...")
        return "Eugene"
    }(){
        didSet(oldValue){
            print("Saving new data \"\(String(describing: cachedData))\" to cache. Old data \"\(String(describing: oldValue))\" has been removed.")
            cache = cachedData
        }
    }
}

var data = DataCache()
data.cachedData = "Victor"

//Задача 5: Оптимизация производительности
//
//Описание:
//Создайте класс AnalyticsTracker с ленивым свойством reportData, которое собирает и обрабатывает данные только при первом доступе. Добавьте наблюдатели willSet и didSet для свойства eventCount, чтобы отслеживать количество событий и выводить предупреждение, если количество превышает заданный порог.
//
//Подсказка:
//Используйте lazy для отложенной обработки и наблюдатели для мониторинга изменений.

class AnalyticsTracker {
    private let limitCount: Int = 1
    
    lazy var reportData: String = {
        return "First data"
    }(){
        willSet {
            eventCount += 1
        }
    }
    
    var eventCount: Int = 1 {
        willSet(newValue){
            print("New value is \(newValue)")
        }
        didSet(oldValue){
            if oldValue >= limitCount {
                print("The limit \(limitCount) has been reached")
            }
        }
    }
}

var tracker = AnalyticsTracker()
tracker.reportData
tracker.reportData = "Second data"
tracker.reportData
tracker.reportData = "Third data"
tracker.reportData
