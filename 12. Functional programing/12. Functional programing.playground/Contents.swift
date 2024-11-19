func isEven(_ number: Int ) -> Bool {
    return number % 2 == 0
}


func sum<T: Numeric>(_ addend1: T,_ addend2: T) -> T {
    return addend1 + addend2
}


func areaOfCircle(Radius r: Double) -> Double{
    let pi = 3.14
    return Double(r) * pi * pi
}


sum(-3.6, 5)
isEven(1382838)
areaOfCircle(Radius: 2)
