// Example of Open-Closed Principle

//If you want to create a class easy to maintain, it must have two important characteristics:
//
//Open for extension: You should be able to extend or change the behaviours of a class without efforts.
//Closed for modification: You must extend a class without changing the implementation.

//We can solve this problem creating a new protocol Printable, which will be implemented by the classes to log. Finally, printData will print an array of Printable.
//In this way, we create a new abstract layer between printData and the class to log, allowing the print of other classes like Bicycle and without changing the printData implementation.

import Foundation

protocol Printable {
    func printDetails() -> String
}

class Car: Printable {
    let name: String
    let color: String
    
    init(name: String, color: String) {
        self.name = name
        self.color = color
    }
    
    func printDetails() -> String {
        return "I'm \(name) and my color is \(color)"
    }
}

class Bicycle: Printable {
    let type: String
    
    init(type: String) {
        self.type = type
    }
    
    func printDetails() -> String {
        return "I'm a \(type)"
    }
}

class Logger {
    
    func printData() {
        let cars: [Printable] = [
            Car(name: "Batmobile", color: "Black"),
            Car(name: "SuperCar", color: "Gold"),
            Car(name: "FamilyCar", color: "Grey"),
            Bicycle(type: "BMX"),
            Bicycle(type: "Tandem")
        ]
        
        cars.forEach { car in
            print(car.printDetails())
        }
    }
}
