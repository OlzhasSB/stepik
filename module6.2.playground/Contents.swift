import UIKit

// Module 6.2: Problems on Enum
// Problem #1

//enum TransportType {
//    case airplane
//    case train
//    case car
//}
//
//func website(_ transport: TransportType) -> String {
//    switch transport {
//    case .airplane:
//        return "www.airastana.com"
//    case .train:
//        return "www.bilet.railways.kz"
//    case .car:
//        return "www.indriver.com"
//    }
//}
//
//let passanger1: TransportType = .airplane
//print(website(passanger1))

// Problem #2

//enum ShapeType {
//    case circle(Double)
//    case rectangle(Double, Double)
//}
//
//func calculateArea(_ shape: ShapeType) -> Double {
//    switch shape {
//    case let .circle(radius):
//        return Double.pi * pow(radius, 2)
//    case let .rectangle(length, width):
//        return length * width
//    }
//}
//
//let shape1: ShapeType = .circle(5)
//print(calculateArea(shape1))

// Problem #3

//enum ResultType {
//    case success(Int)
//    case failure(String)
//}
//
//func getGrade(_ completion: (ResultType) -> Void) {
//    let isSuccess = Bool.random()
//    if (isSuccess == true) {
//        ResultType.success(95)
//    } else {
//        ResultType.failure("Grades are not available yet, try agian later")
//    }
//}

// Problems on Struct & Class
// Problem #1 and #2

//class Circle {
//    var radius: Double
//
//    init(radius: Double) {
//        self.radius = radius
//    }
//}
//
//class Rectangle {
//    var length: Double
//    var width: Double
//
//    init(length: Double, width: Double) {
//        self.length = length
//        self.width = width
//    }
//}
//
//func calculateArea(_ circle: Circle) -> Double {
//    return Double.pi * pow(circle.radius, 2)
//}
//
//func calculateArea(_ rectangle: Rectangle) -> Double {
//    return rectangle.length * rectangle.width
//}
//
//var circle1: Circle = Circle(radius: 5)
//var rectangle1: Rectangle = Rectangle(length: 5, width: 5)
//
//print("Area of a Circle = " + String(format: "%.2f", calculateArea(circle1)))
//print("Area of a Rectangle = \(calculateArea(rectangle1))")

// Problem Rock-scissors-paper
//enum Choice {
//    case rock
//    case paper
//    case scissors
//
//    func weakness() -> Choice {
//        switch self {
//        case .rock:
//            return .paper
//        case .paper:
//            return .scissors
//        case .scissors:
//            return .rock
//        }
//    }
//}
//
//struct Game {
//    static var p1Score = 0
//    static var p2Score = 0
//    static var pastGames: [Choice : Choice] = [:]
//
//    static func play(_ p1Choice: Choice, against p2Choice: Choice) {
//        if p1Choice.weakness() == p2Choice.weakness() {
//            print("draw")
//        } else if p1Choice == p2Choice.weakness() {
//            print("player 1 wins")
//            p1Score += 1
//        } else {
//            print("player 2 wins")
//            p2Score += 1
//        }
//        pastGames[p1Choice] = p2Choice
//    }
//}
//
//// Test
//var p1Choice: Choice = .scissors
//var p2Choice: Choice = .rock
//
//Game.play(p1Choice, against: p2Choice)
//
//print("P1 : P2 \n \(Game.p1Score) : \(Game.p2Score)")
//
//for (p1, p2) in Game.pastGames{
//     print("\(p1) vs \(p2)")
//}

