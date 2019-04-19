//
//  ViewController.swift
//  Command
//
//  Created by Maksim Nosov on 19/04/2019.
//  Copyright © 2019 Maksim Nosov. All rights reserved.
//

import UIKit

protocol BaseCommand {
    func undo() -> String
    func forward(_ str: String)
}

class StringUndoCommand: BaseCommand {
    private var originalString: String
    private var currentString: String
    
    init(argument: String) {
        originalString = argument
        currentString = argument
    }
    
    func forward(_ str: String) {
        currentString.append(str)
        printString()
    }
    
    func printString() {
        print(currentString)
    }
    
    func undo() -> String {
        currentString.removeAll()
        printString()
        return currentString
    }
}

class CommandExecuter {
    private var arrayOfCommand = [BaseCommand]()
    
    func addCommand(command: BaseCommand) {
        arrayOfCommand.append(command)
    }
    
    func forward(_ str: String) {
        for command in arrayOfCommand {
            command.forward(str)
        }
    }
    
    func undoLast() -> String {
        var title = String()
        for command in arrayOfCommand {
            title = command.undo()
        }
        return title
    }
}

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    let commandExecutor = CommandExecuter()
    var cmdUndo: StringUndoCommand?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.delegate = self
    }

    @IBAction func undoAction(_ sender: Any) {
        textField.text = commandExecutor.undoLast()
    }
    
}

extension ViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        cmdUndo = StringUndoCommand(argument: textField.text!)
        commandExecutor.addCommand(command: cmdUndo!)
        commandExecutor.forward(string)
        
        return true
    }
}
