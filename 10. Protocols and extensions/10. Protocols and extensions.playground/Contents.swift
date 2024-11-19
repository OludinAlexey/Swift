protocol FullyNamed {
    var name: String { get set }
    var surname: String { get set }
    
    func printName ()
}


class Person: FullyNamed {
    
    private var _name: String
    private var _surname: String
    
    var name: String{
        get { return _name }
        set { _name = newValue }
    }
    
    var surname: String{
        get { return _surname }
        set { _surname = newValue }
    }
    
    func printName() {
        print(self.name)
    }
    
    init(name: String, surname: String) {
        self._name = name
        self._surname = surname
    }
}


extension Person {
    
    func setName(name: String) {
        self.name = name
    }
    
}

var person: Person = Person(name: "John", surname: "Matrix")
person.printName()
person.setName(name: "Henri")
person.printName()
