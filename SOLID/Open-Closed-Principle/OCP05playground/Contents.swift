import Foundation

protocol Printable {
    func printData() -> String
}

class Elephant: Printable {
    func printData() -> String {
        return "I'm \(String(describing: Elephant.self)) and have and trunk."
    }
}

class Monkey: Printable {
    func printData() -> String {
        return "I'm \(String(describing: Monkey.self)) and like bananas."
    }
}

class Animal {
    
    func printAnimalPhrase(animals: [Printable]) {
        for animal in animals {
            print(animal.printData())
        }
    }
}

let elephant = Elephant()
let monkey = Monkey()

var animals = Animal()
animals.printAnimalPhrase(animals: [elephant, monkey])

