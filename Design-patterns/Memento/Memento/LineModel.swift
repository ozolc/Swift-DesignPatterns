//
//  LineModel.swift
//  Memento
//
//  Created by Maksim Nosov on 05/04/2019.
//  Copyright © 2019 Maksim Nosov. All rights reserved.
//

import UIKit

struct LineModel {
    var start: CGPoint
    var end: CGPoint
    var color: UIColor
    
    init(start: CGPoint, end: CGPoint, color: UIColor) {
        self.start = start
        self.end = end
        self.color = color
    }
}
