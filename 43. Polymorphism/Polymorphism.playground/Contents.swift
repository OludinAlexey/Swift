//Задача 1: Полиморфизм с использованием классов для сотрудников
//
//Условие:
//Создайте базовый класс Employee с методом salary() для расчета зарплаты. Затем создайте два подкласса: FullTimeEmployee и PartTimeEmployee. В каждом подклассе переопределите метод salary(), чтобы он возвращал соответствующую зарплату для каждого типа сотрудника. Напишите функцию, которая принимает массив объектов типа Employee и выводит зарплату для каждого сотрудника.

class Employee {
    func salary() -> Double {
        return 0
    }
    
    static func printSalary(_ employees: [Employee]) {
        for employee in employees {
            print("\(employee.salary())")
        }
    }
}

class FullTimeEmployee: Employee {
    override func salary() -> Double {
        return 1000
    }
}

class PartTimeEmployee: Employee {
    override func salary() -> Double {
        return 500
    }
}

var employees: [Employee] = []
employees.append(FullTimeEmployee())
employees.append(PartTimeEmployee())
Employee.printSalary(employees)


//Задача 2: Полиморфизм с использованием классов для транспортных средств
//
//Условие:
//Создайте базовый класс Transport с методом fuelType(), который возвращает тип топлива. Затем создайте два подкласса: ElectricCar и GasCar. В каждом подклассе переопределите метод fuelType(), чтобы он возвращал уникальный тип топлива для каждого транспортного средства. Напишите функцию, которая принимает массив объектов типа Transport и выводит тип топлива для каждого транспортного средства.

class Transport {
    func fuelType() -> String {
        return ""
    }
    
    static func printFuelType(_ transports: [Transport]) {
        for transport in transports {
            print(transport.fuelType())
        }
    }
}

class ElectricCar: Transport {
    override func fuelType() -> String {
        return "Electric"
    }
}

class GasCar: Transport {
    override func fuelType() -> String {
        return "Gas"
    }
}

var transport: [Transport] = []
transport.append(ElectricCar())
transport.append(GasCar())
Transport.printFuelType(transport)
