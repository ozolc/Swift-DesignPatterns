//
//  Jumping.swift
//  Factory pattern
//
//  Created by Maksim Nosov on 12/04/2019.
//  Copyright © 2019 Maksim Nosov. All rights reserved.
//

import Foundation

class Jumping: Exercise {
    var name: String = "Прыжки"
    
    var type: String = "Упражение для ног"
    
    func start() {
        print("Начинаем прыжки")
    }
    
    func stop() {
        print("Заканчиваем прыжки")
    }
    
    
}
