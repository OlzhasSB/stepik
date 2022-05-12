import UIKit

class Staff{
    private var n: Double
    let salary = 500000.0
    
    init(_ n: Double) {
        self.n = n
    }
    
    func getSalary() -> Double{
        return salary
    }
}

class Lecturer: Staff {
    override init(_ n: Double) {
        super.init(n)
    }
    
    override func getSalary() -> Double{
        return salary * 0.9
    }
}

class Professor: Staff {
    
    override init(_ n: Double) {
        super.init(n)
    }
    
    override func getSalary() -> Double{
        return salary * 1.1
    }
}

class Rector: Staff {
   
    override init(_ n: Double) {
        super.init(n)
    }
    
    override func getSalary() -> Double{
        return salary * 2
    }
}

func calculateSalary(_ t: String.SubSequence) -> Double{
    let status = String(t.split(separator: " ")[0])
    let number = Double(t.split(separator: " ")[1])!
    var overall: Double = 0
    
    let lecturer = Lecturer(number)
    let professor = Professor(number)
    let rector = Rector(number)
    
    if status == "lecturer" {
        overall += lecturer.getSalary()
    }
    if status == "professor" {
        overall += professor.getSalary()
    }
    if status == "rector" {
        overall += rector.getSalary()
    }
    return overall
}



let str = "lecturer 0,professor 1,rector 0"
let input = str.split(separator: ",")
var amount: Double = 0
for t in input{
    amount += calculateSalary(t)
}
print(amount)
