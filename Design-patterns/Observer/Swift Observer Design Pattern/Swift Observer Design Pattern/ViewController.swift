//
//  ViewController.swift
//  Swift Observer Design Pattern
//
//  Created by Maksim Nosov on 08/04/2019.
//  Copyright © 2019 Maksim Nosov. All rights reserved.
//

import UIKit

// By adopting the ObservedProtocol, this view controller
// gains the capability for broadcasting notifications via
// NotificationCenter to ANY entities throughout this
// WHOLE APP whom are interested in receiving those notifications.
// Notice how little this class needs to do to gain
// notification capability?

class ViewController: UIViewController, ObservedProtocol {

    @IBOutlet weak var topBox: UIView!
    @IBOutlet weak var middleBox: UIView!
    @IBOutlet weak var bottomBox: UIView!
    
    // Mock up three entities whom are dependent upon a
    // critical resource: network connectivity. They need
    // to observe the status of the critical resource.
    
    var networkConnectionHandler0: NetworkConnectionHandler?
    var networkConnectionHandler1: NetworkConnectionHandler?
    var networkConnectionHandler2: NetworkConnectionHandler?
    
    // ObservedProtocol conformance -- two properties.
    let statusKey: StatusKey = StatusKey.networkStatusKey
    let notification: Notification.Name = .networkConnection
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Here are three entities now listening for notifications
        // from the enclosing ViewController class.
        networkConnectionHandler0 = NetworkConnectionHandler(view: topBox)
        networkConnectionHandler1 = NetworkConnectionHandler(view: middleBox)
        networkConnectionHandler2 = NetworkConnectionHandler(view: bottomBox)
    }

    // Mock up a critical resource whose state can change.
    // I'm pretending that this ViewController is
    // responsible for network reachability/connectivity.
    // When we have a network connection, all interested
    // listeners are informed. When network access is lost,
    // all interested listeners are informed.
    @IBAction func switchChanged(_ sender: Any) {
        
        let swtich: UISwitch = sender as! UISwitch
        
        if swtich.isOn {
            notifyObservers(about: NetworkConnectionStatus.connected.rawValue)
        } else {
            notifyObservers(about: NetworkConnectionStatus.disconnected.rawValue)
        }
        
    } // end func switchChanged
    
} // end class ViewController

