class Month {
    var name: String
    var numberOfDays: UInt8
    var number: UInt8
    let secondsInDay: UInt = 60 * 60 * 24
    
    init(name: String) {
        let m: (name: String, numberOfDays: UInt8, index: UInt8) = month.filter({ $0.name == name}).first!
        
        self.name = m.name
        self.number = m.index
        self.numberOfDays = m.numberOfDays
    }
    
    
    func secondsFromYearBegin(day: UInt8) -> UInt {
        var seconds: UInt = UInt(day) * secondsInDay
        
        for m in month {
            if m.index < self.number {
                seconds += UInt(m.numberOfDays) * secondsInDay
            }
        }
        
        return seconds
    }
    
    
    func quarter() -> UInt8 {
        var quarter: UInt8 = 0
        var i = 0
        repeat {
            i += 3
            quarter += 1
        } while i < self.number
        
        return quarter
    }
    
    
    private var month:[(name: String, numberOfDays: UInt8, index: UInt8)] = [
        ("January", 31, 1),
        ("February", 28, 2),
        ("March", 31, 3),
        ("April", 30, 4),
        ("May", 31, 5),
        ("June", 30, 6),
        ("July", 31, 7),
        ("August", 31, 8),
        ("September", 30, 9),
        ("October", 31,10),
        ("November", 30, 11),
        ("December", 31, 12)
    ]
    
}


let dayOfBirth: UInt8 = 1
let monthOfBirth = "December"
let month: Month = Month(name: monthOfBirth)

print("Seconds from year begin to birthday \(month.secondsFromYearBegin(day: dayOfBirth))")
print("Quarter is \(month.quarter())")
