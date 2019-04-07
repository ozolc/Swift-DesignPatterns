//
//  CarrierState.swift
//  Memento
//
//  Created by Maksim Nosov on 07/04/2019.
//  Copyright © 2019 Maksim Nosov. All rights reserved.
//

import Foundation

class CarrierState {
    var state: StateLinesMemento?
    var linesManager: LinesManager
    
    init(linesManager: LinesManager) {
        self.linesManager = linesManager
    }
    
    public func saveLine() {
        state = linesManager.save()
    }
    
    func loadLine() {
        guard state != nil else { return }
        linesManager.load(state: state!)
    }
}
