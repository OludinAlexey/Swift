/*
1. Доступ к элементам массива:
    Создайте массив numbers: [Int] с элементами 1, 5, 8, 2, 7.
    Выведите на экран первый, третий и последний элементы массива numbers.
    Используйте индексы для доступа к элементам.*/

let numbers: [Int] = [1, 5, 8, 2, 7]
print("Первый элемент: \(numbers[0]).")
print("Третий элемент: \(numbers[2]).")
print("Последний элемент: \(numbers[numbers.count - 1]).")


/*
2. Проверка наличия элемента в массиве:
    Создайте массив names: [String] с элементами "John", "Alice", "Bob", "Eva".
    Проверьте, есть ли в массиве имя "Alice" используя if и contains.
    Выведите на экран сообщение "Alice есть в массиве" или "Alice нет в массиве".*/

let names: [String] = ["John", "Alice", "Bob", "Eva"]
if names.contains("Alice") {
    print("Alice есть в массиве.")
}
else {
    print("Alice нет в массиве.")
}



/*
3. Сравнение размеров массивов:
    Создайте массив fruits: [String] с элементами "Apple", "Banana", "Orange".
    Создайте массив vegetables: [String] с элементами "Carrot", "Tomato".
    Используйте if и count для сравнения размеров массивов fruits и vegetables.
    Выведите на экран сообщение о том, какой массив больше.*/

let fruits: [String] = ["Apple", "Banana", "Orange"]
let vegetables: [String] = ["Carrot", "Tomato"]

if fruits.count > vegetables.count {
    print("Массив fruits больше массива vegetables.")
}
else {
    print("Массив vegetables больше массива fruits.")
}

/*
4. Проверка на пустой массив:
    Создайте массив colors: [String] с элементами "Red", "Green", "Blue".
    Проверьте, пуст ли массив colors используя if и isEmpty.
    Выведите на экран сообщение "Массив цветов пуст" или "Массив цветов не пуст".
*/

let colors: [String] = ["Red", "Green", "Blue"]
if colors.isEmpty {
    print("Массив цветов пуст.")
} else {
    print("Массив цветов не пуст.")
}
 
/*
5. Работа с массивом Optional:
    Создайте массив ages: [Int?] с элементами 25, nil, 32, 21.
    Используйте if let для проверки наличия значения в первом элементе массива ages.
    Если значение есть, выведите его на экран.
    Если значения нет, выведите сообщение "Возраст не задан."
*/

let ages: [Int?] = [25, nil, 32, 21]
if let age = ages.first ?? nil {
    print(age)
} else {
    print("Возраст не задан.")
}
