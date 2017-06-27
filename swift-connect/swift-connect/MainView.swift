//
//  MainView.swift
//  swift-connect
//
//  Created by GC on 2/16/17.
//  Copyright © 2017 eaon. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

class MainView: UIViewController {
    
    @IBOutlet weak var clientSessionId: UILabel!
    @IBOutlet weak var customerId: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        navigationItem.title = "Session"
        navigationItem.backBarButtonItem?.title = "Back"
    }
    
}
