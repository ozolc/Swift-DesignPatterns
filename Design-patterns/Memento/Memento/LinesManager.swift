//
//  LinesManager.swift
//  Memento
//
//  Created by Maksim Nosov on 07/04/2019.
//  Copyright © 2019 Maksim Nosov. All rights reserved.
//

import UIKit

class LinesManager {
    static let shared = LinesManager()
    
    var linesArray = [LineModel]()
    
    func save() -> StateLinesMemento {
        return StateLinesMemento(lines: self.linesArray)
    }
    
    func load(state: StateLinesMemento) {
        self.linesArray = state.linesArray
    }
    
    func printLines(in view: UIView) {
        for v in view.layer.sublayers! {
            v.removeFromSuperlayer()
        }
        
        for line in linesArray {
            let path = UIBezierPath()
            path.move(to: line.start)
            path.addLine(to: line.end)
            self.drawShapeLayer(path, line.color, view)
            self.drawShapeLayer(path, line.color, view)
        }
    }
    
    private func drawShapeLayer(_ path: UIBezierPath, _ lineColor: UIColor, _ view: UIView) {
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.strokeColor = lineColor.cgColor
        shapeLayer.lineWidth = 10
        shapeLayer.fillColor = UIColor.clear.cgColor
        view.layer.addSublayer(shapeLayer)
        view.setNeedsDisplay()
    }
    
}
