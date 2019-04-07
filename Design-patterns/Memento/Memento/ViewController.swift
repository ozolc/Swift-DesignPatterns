//
//  ViewController.swift
//  Memento
//
//  Created by Maksim Nosov on 05/04/2019.
//  Copyright © 2019 Maksim Nosov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var viewBoard: DrawView!
    
    var carrierState: CarrierState!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewBoard.lineColor = UIColor.black
        
        let lines = LinesManager.shared
        carrierState = CarrierState(linesManager: lines)

    }

    @IBAction func saveAction(_ sender: Any) {
        carrierState.saveLine()
    }
    
    @IBAction func loadAction(_ sender: Any) {
        carrierState.loadLine()
        carrierState.linesManager.printLines(in: viewBoard)
    }
    
    @IBAction func blueAction(_ sender: Any) {
        viewBoard.lineColor = #colorLiteral(red: 0.001094860258, green: 0.5894427299, blue: 0.9986342788, alpha: 1)
    }
    
    @IBAction func orangeAction(_ sender: Any) {
        viewBoard.lineColor = #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
    }
    
    @IBAction func greenAction(_ sender: Any) {
        viewBoard.lineColor = #colorLiteral(red: 0, green: 0.9768045545, blue: 0, alpha: 1)
    }
    
}

