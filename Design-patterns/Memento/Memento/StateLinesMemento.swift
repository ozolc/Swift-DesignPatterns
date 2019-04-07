//
//  StateLinesMemento.swift
//  Memento
//
//  Created by Maksim Nosov on 05/04/2019.
//  Copyright © 2019 Maksim Nosov. All rights reserved.
//

import Foundation

class StateLinesMemento {
    var linesArray: [LineModel]
    
    init(lines: [LineModel]) {
        self.linesArray = lines
    }
}

