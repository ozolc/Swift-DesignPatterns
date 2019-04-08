//
//  ViewController.swift
//  Observer
//
//  Created by Maksim Nosov on 08/04/2019.
//  Copyright © 2019 Maksim Nosov. All rights reserved.
//

import UIKit

protocol Observer: class {
    func update(subject: NotificationCenters)
}

class NotificationCenters {
    var state: Int = {
        return Int(arc4random_uniform(10))
    }()
    
    private lazy var observers = [Observer]()
    
    func subscribe(_ observer: Observer) {
        print(#function)
        observers.append(observer)
    }
    
    func unsubscribe(_ observer: Observer) {
        if let index = observers.firstIndex(where: {$0 === observer}) {
            observers.remove(at: index)
            print(#function)
        }
    }
    
    func notify() {
        print(#function)
        observers.forEach( { $0.update(subject: self)})
    }
    
    func someBusinesLogic() {
        print(#function)
        state = Int(arc4random_uniform(10))
        notify()
    }
    
}

class ConcreteObserverA: Observer {
    func update(subject: NotificationCenters) {
        print("ConcreteObserverA: \(subject.state)")
    }
}

class ViewController: UIViewController, Observer {

    @IBOutlet weak var outOneLabel: UILabel!
    
    let notificationCenter = NotificationCenters()
    let observer1 = ConcreteObserverA()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func update(subject: NotificationCenters) {
        outOneLabel.text =  "State subject: \(subject.state)"
    }

    @IBAction func updateAction(_ sender: UIButton) {
        notificationCenter.someBusinesLogic()
    }
    
    @IBAction func subscriveSwitch(_ sender: UISwitch) {
        if sender.isOn {
            notificationCenter.subscribe(self)
            notificationCenter.subscribe(observer1)
        } else {
            notificationCenter.unsubscribe(self)
            notificationCenter.unsubscribe(observer1)
        }
    }
}

