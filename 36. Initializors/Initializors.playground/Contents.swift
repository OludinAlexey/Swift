//Создайте класс Person, который будет описывать человека с именем и возрастом. Затем создайте класс Student, который будет наследовать от Person и иметь дополнительные свойства, такие как university и grade.
//
//В классе Person создайте инициализатор, который принимает параметры для имени и возраста.
//В классе Student создайте инициализатор, который помимо имени и возраста также принимает параметры для университета и оценки.
//Реализуйте метод description(), который выводит полную информацию о студенте.
//Цель: закрепить понимание инициализаторов в классе и увидеть, как передаются параметры при наследовании.

class Person {
    let name: String
    let age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

class Student: Person {
    let university: String
    let grade: Int
    
    init(name: String, age: Int, university: String, grade: Int) {
        self.university = university
        self.grade = grade
        super.init(name: name, age: age)
    }
    
    func description() {
        print("Информация о студенте\nИмя: \(name)\nВозраст: \(age)\nУниверситет: \(university)\nОценка: \(grade)")
    }
}

let student = Student(name: "Джек", age: 44, university: "MIT", grade: 10)
student.description()
