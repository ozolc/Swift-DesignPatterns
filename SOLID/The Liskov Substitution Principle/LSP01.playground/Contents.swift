import Foundation

// Create an abstract interface with some behaviour(bark)
protocol Barker {
    func bark()
}

extension Barker {
    func bark() {
        print("Bark")
    }
}

// Create another abstract interface with some additional behaviours (bark+sniff)
protocol DrugSniffer: Barker {
    func sniffDrugs()
}

extension DrugSniffer {
    func sniffDrugs() {
        print("Sniff Drugs")
    }
}

// Create another abstract interface with some additional behaviours (bark+swimm)
protocol Swimmer: Barker {
    func swim()
}

extension Swimmer {
    func swim() {
        print("Swimm")
    }
}

class GermanShephard: DrugSniffer {}
class BelgianMalinois: Swimmer, DrugSniffer {}
class Poodle: Swimmer {}

let poodle = Poodle()
poodle.bark()
poodle.swim()
