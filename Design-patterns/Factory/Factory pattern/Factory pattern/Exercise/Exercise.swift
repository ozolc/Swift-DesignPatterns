//
//  Exercise.swift
//  Factory pattern
//
//  Created by Maksim Nosov on 12/04/2019.
//  Copyright © 2019 Maksim Nosov. All rights reserved.
//

import Foundation

protocol Exercise {
    var name: String { get }
    var type: String { get }
    
    func start()
    func stop()
}
