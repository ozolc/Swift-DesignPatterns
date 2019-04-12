import UIKit

var str = "Adapter pattern"

protocol BirdProtocol {
    func sing()
    func fly()
}

class Bird: BirdProtocol {
    func sing() {
        print("sing sing")
    }
    
    func fly() {
        print("I'm flying")
    }
    
}

class Raven {
    func flySearchAndDestroy(){
        print("I'm destroying")
    }
    
    func voice() {
        print("Kaaar - kaaar")
    }
}

class RavenAdapter: BirdProtocol {
    private var raven: Raven
    
    init(adaptee: Raven) {
        self.raven = adaptee
    }
    
    func sing() {
        raven.flySearchAndDestroy()
    }
    
    func fly() {
        raven.voice()
    }
    
    
}

func makeTheBirdTest(bird: BirdProtocol) {
    bird.fly()
    bird.sing()
}

let simpleBird = Bird()
//let simpleRaven = Raven()
let ravenAdapter = RavenAdapter(adaptee: Raven())

makeTheBirdTest(bird: simpleBird)
makeTheBirdTest(bird: ravenAdapter)

