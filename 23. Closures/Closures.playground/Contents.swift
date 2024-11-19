//Задача: Простое замыкание
//Напишите замыкание, которое не принимает никаких параметров и просто печатает "Hello, Swift!".
//

let simpleClosure = {
    print("Hello, Swift")
}

simpleClosure()



//Задача: Сортировка массива строк
//Напишите функцию sortStrings, которая принимает массив строк и замыкание, использующееся для сравнения строк. Функция должна вернуть новый массив, отсортированный по заданному замыканию.
//

let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
let backward = { (s1: String, s2: String) -> Bool in return s1 > s2 }
let forward = { (s1: String, s2: String) -> Bool in return s1 < s2 }
func sortStrings(strings: [String], closure: (String, String) -> Bool) -> [String]{
    return strings.sorted(by: closure)
}

let forwardSortedNames = sortStrings(strings: names, closure: forward)
let backwardSortedNames = sortStrings(strings: names, closure: backward)



//Задача: Проверка наличия элемента в массиве
//Напишите функцию containsElement, которая принимает массив и замыкание, проверяющее, удовлетворяет ли элемент условию. Функция должна вернуть true, если хотя бы один элемент массива удовлетворяет условию, и false в противном случае.
//
typealias GenericInBoolOut<T> = (T) -> (Bool) // Так как в условии задачи не сказано какой именно тип массива должна принимать функция, использую обобщенный тип.

let numbers = [3, 6, 2, 5, 6, 4, 9, 48, 9]
let names2 = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]

let greatThan5 = { (number: Int) -> Bool in return number > 5}
let equalToStephan = { (name: String) -> Bool in return name == "Stephan"}
let lessThan5 = { (number: Int) -> Bool in return number < 5}

func containsElement<T>(array: [T], closure: GenericInBoolOut<T>) -> Bool{
    return array.contains(where: closure)
}

containsElement(array: numbers, closure: greatThan5)
containsElement(array: numbers, closure: lessThan5)
containsElement(array: names2, closure: equalToStephan)



//Задача: Проверка наличия элемента с несколькими условиями
//Напишите функцию containsElementWithConditions, которая принимает массив строк и массив замыканий, каждый из которых проверяет определённое условие. Функция должна вернуть true, если хотя бы одна строка из массива удовлетворяет всем условиям, и false в противном случае.


let names3 = ["Chris", "Alexa", "Ewa", "Barry", "Daniella"]
var conditions = [ { (name: String) -> Bool in return name.contains("x") },
                 { (name: String) -> Bool in return name.starts(with: "A") },
                 { (name: String) -> Bool in return name.count == 4}]

func containsElementWithConditions(strings: [String], conditions: [(String)->(Bool)]) -> Bool {
    var result: Bool = false
    for string in strings {
        for condition in conditions {
            result = condition(string) ? true : false
        }
        if result {return result}
    }
    return result
}

containsElementWithConditions(strings: names3, conditions: conditions)
