//
//  ViewController.swift
//  Factory pattern
//
//  Created by Maksim Nosov on 12/04/2019.
//  Copyright © 2019 Maksim Nosov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var exerciseArray = [Exercise]()

    override func viewDidLoad() {
        super.viewDidLoad()
        createExercise(exName: .jumping)
        createExercise(exName: .squarting)
        createExercise(exName: .swingPress)
        runExecise()
    }
    
    func createExercise(exName: Exercises) {
        let newExercise = FactoryExercise.defaultFactory.createExercise(name: exName)
        exerciseArray.append(newExercise)
    }
    
    func runExecise() {
        exerciseArray.forEach { exercise in
            exercise.start()
            exercise.stop()
        }
    }

}

