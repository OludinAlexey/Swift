let dayOfBirth: UInt8 = 31
let monthOfBirth = "July"
let secondsInDay: UInt = 60 * 60 * 24
let months:[(name: String, numberOfDays: UInt8, index: UInt8)] = [
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

let month: (name: String, numberOfDays: UInt8, index: UInt8) = months.filter({ $0.name == monthOfBirth}).first!
var secondsFromYearBegin: UInt = UInt(dayOfBirth) * secondsInDay


//Calculate the number of seconds
for m in months {
    if m.index < month.index {
        secondsFromYearBegin += UInt(m.numberOfDays) * secondsInDay
    }
}


//Calculate the quarter
var quarter: UInt8 = 0
var i = 0
repeat {
    i += 3
    quarter += 1
} while i < month.index


//Output
print("Seconds from the beginning of the year to the birthday: \(secondsFromYearBegin)")
print("The quarter is \(quarter)")
