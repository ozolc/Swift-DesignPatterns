//Interface Segregation Principle

import Foundation

protocol Workable {
    func work()
}

protocol Feedable {
    func eat()
}

struct ManWorker: Workable, Feedable {
    func work() {
        print("Man Worker working...")
    }
    
    func eat() {
        print("Man Worker eating...")
    }
}

struct Robot: Workable {
    func work() {
        print("Robot working..")
    }
}

let man = ManWorker()
man.work()
man.eat()

let robot = Robot()
robot.work()
