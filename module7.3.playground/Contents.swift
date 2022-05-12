import UIKit

protocol Addition{
    func sum(_ arr: [Int]) -> Int
}

protocol Multiplication{
    func multiply(_ arr: [Int]) -> Int
}

extension Multiplication{
    func sort(_ arr: [Int]) -> [Int]
}

class Calculate: Addition, Multiplication {
    private var arr = [1,2,3,4,5,6]
    var result = 0
    
    func sum(_ arr: [Int]) -> Int {
        for el in arr {
            sum += el
        }
    }
    
    func multiply(_ arr: [Int]) -> Int {
        
    }
    
    func sort(_ arr: [Int]) -> [Int] {
        
    }
}




