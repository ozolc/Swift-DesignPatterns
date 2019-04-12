//
//  FactoryExercise.swift
//  Factory pattern
//
//  Created by Maksim Nosov on 12/04/2019.
//  Copyright © 2019 Maksim Nosov. All rights reserved.
//

import Foundation

enum Exercises {
    case jumping
    case squarting
    case swingPress
}

class FactoryExercise {
    static let defaultFactory = FactoryExercise()
    public init() {}
    
    func createExercise(name: Exercises) -> Exercise {
        switch name {
        case .squarting:
            return Squarting()
        case .jumping:
            return Jumping()
        case .swingPress:
            return SwingPress()
        }
    }
}
