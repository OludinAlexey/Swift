class Person {
    
    var name: String
    var surname: String
    
    init(name: String, surname: String) {
        self.name = name
        self.surname = surname
    }
    
    deinit {
        print("The instance of the class \"Person\" \"\(self.name) \(self.surname)\" is terminated.")
    }
    
}

var person: Person? = Person(name: "John", surname: "Connor")

person = nil
