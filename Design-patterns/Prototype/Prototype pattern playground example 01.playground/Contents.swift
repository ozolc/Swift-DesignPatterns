import UIKit

var str = "Prototype"

public protocol Copying {
    init(_ prototype: Self)
}

extension Copying {
    public func copy() -> Self {
        return type(of: self).init(self)
    }
}

class Person: Copying {
    
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    required convenience init(_ prototype: Person) {
        self.init(name: prototype.name)
    }

    
    func clone() -> Person {
        return Person(name: self.name)
    }
    
//    func clone() -> Person {
//        let person = Person()
//        person.name = name
//        return person
//    }
}

var person1 = Person(name: "Jim")
//person1.name = "Jim"

print(person1.name)

//var person2 = person1.clone()
var person2 = person1.copy()
//person2.name = "Jack"

print(person1.name)

print(person1 === person2)


