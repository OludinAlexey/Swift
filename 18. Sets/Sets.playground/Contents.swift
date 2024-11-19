//Задачи на тему множества:

/*1. Простой набор фруктов (Легкий уровень)

    Создайте множество fruits с элементами "Apple", "Banana", "Orange".
    Добавьте в множество fruits фрукт "Grape".
    Проверьте, содержится ли фрукт "Strawberry" в множестве fruits.
    Выведите на экран все элементы множества fruits.*/

var fruits: Set<String> = ["Apple", "Banana", "Orange"]
fruits.insert("Grape")
fruits.contains("Strawberry")
print("Элементы fruits: \(fruits)")


/*2. Объединение и пересечение множеств (Средний уровень)

    Создайте множество favoriteColors1 с элементами "Red", "Blue", "Green".
    Создайте множество favoriteColors2 с элементами "Yellow", "Blue", "Purple".
    Найдите объединение множеств favoriteColors1 и favoriteColors2 и сохраните его в новое множество allColors.
    Найдите пересечение множеств favoriteColors1 и favoriteColors2 и сохраните его в новое множество commonColors.
    Выведите на экран элементы множеств allColors и commonColors.*/

let favoriteColors1: Set<String> = ["Red", "Blue", "Green"]
let favoriteColors2: Set<String> = ["Yellow", "Blue", "Purple"]
let allColors: Set<String> = favoriteColors1.union(favoriteColors2)
let commonCollors: Set<String> = favoriteColors1.intersection(favoriteColors2)
print("Элементы allColors: \(allColors)")
print("Элементы commonCollors: \(commonCollors)")

/*3. Удаление дубликатов из массива (Сложный уровень)

    Создайте массив numbers с элементами [1, 2, 3, 2, 4, 5, 3, 1].
    Используя множество, удалите дубликаты из массива numbers и сохраните результат в новый массив uniqueNumbers.
    Выведите на экран массив uniqueNumbers.*/

let numbers = [1, 2, 3, 2, 4, 5, 3, 1]
let uniqueNumbers = Set(numbers)
print("Элементы uniqueNumbers: \(uniqueNumbers)")

//Задачи на тему СЛОВАРИ:

/*1. Простой словарь (Легкий уровень)

    Создайте словарь studentScores для хранения оценок студентов.
    Добавьте в словарь три записи: "John" - 85, "Alice" - 92, "Bob" - 78.
    Выведите на экран оценку студента "Alice".*/

let studentScores: Dictionary<String,Int> = ["John": 85, "Alice": 92, "Bob": 78]
print(studentScores["Alice"] ?? 0)


/*2.Изменение значения (Средний уровень)

    Создайте словарь products для хранения цен на продукты.
    Добавьте в словарь три записи: "Apple" - 1.5, "Banana" - 0.8, "Milk" - 2.5.
    Измените цену на "Banana" на 1.0.
    Выведите на экран цену на "Banana".*/

var products: [String:Double] = ["Apple": 1.5, "Banana": 0.8, "Milk": 2.5]
products["Banana"] = 1.0
print("Banana`s cost is \(products["Banana"] ?? 0)")

/*3. Проверка на существование ключа (Средний уровень)

    Создайте словарь englishToRussian для хранения перевода слов с английского на русский.
    Добавьте в словарь несколько пар: "Hello" - "Привет", "World" - "Мир", "Dog" - "Собака".
    Проверьте, есть ли в словаре перевод слова "Cat".*/

var englishToRussian: Dictionary<String,String> = ["Hello": "Привет", "World": "Мир", "Dog": "Собака"]
if let result = englishToRussian["Cat"] ?? nil {
    print(result)
} else {
    print("Значения \"Cat\" нет в словаре.")
}


/*4. Удаление записи из словаря (Средний уровень)

    Создайте словарь products для хранения цен на продукты.
    Добавьте в словарь три записи: "Apple" - 1.5, "Banana" - 0.8, "Milk" - 2.5.
    Удалите запись для "Milk" из словаря.
    Проверьте, есть ли в словаре запись для "Milk".*/

var productsCost: [String: Double] = ["Apple": 1.5, "Banana": 0.8, "Milk": 2.5]
productsCost.removeValue(forKey: "Milk")
if let result = productsCost["Milk"] ?? nil {
    print(result)
} else {
    print("Значения \"Milk\" нет в словаре.")
}

/*5. Создание словаря из массивов (Сложный уровень)

    Даны два массива: names = ["John", "Alice", "Bob"] и ages = [25, 30, 28].
    Создайте словарь personData для хранения имен и возрастов, используя индексы из массивов.
    Выведите на экран словарь personData.*/

let names = ["John", "Alice", "Bob"]
let ages = [25, 30, 28]
let personData: Dictionary<String,Int> = [names[0]: ages[0], names[1]: ages[1], names[2]: ages[2]]
print("Словарь personData: \(personData)")
