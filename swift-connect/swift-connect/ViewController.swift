//
//  ViewController.swift
//  swift-connect
//
//  Created by GC on 1/31/17.
//  Copyright © 2017 eaon. All rights reserved.
//

import UIKit
import Alamofire
import IngenicoConnectKit

class ViewController: UIViewController {

    var session: Session?

    let region: Region.US
    let environment: Environment.preProduction
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

   override  func viewWillAppear (_ animated: Bool) {
        navigationItem.title = "Create Session"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func createSession(_ sender: UIButton) {
        let todoEndpoint: String = "https://ingenico-xseanle.c9users.io/sessions/create"
        Alamofire.request(todoEndpoint)
            .responseJSON { response in
                // check for errors
                guard response.result.error == nil else {
                    print("error calling GET on URL")
                    print(response.result.error!)
                    return
                }
                
                //make sure we got some JSON since that's what we expect
                guard let json = response.result.value as? [String: Any] else {
                    print("didn't get todo object as JSON from API")
                    print("Error: \(response.result.error)")
                    return
                }
                
                guard let clientSessionId = json["clientSessionId"] as? String else {
                    print("Could not get value from JSON")
                    return
                }
                
                guard let customerId = json["customerId"] as?
                    String else {
                    print("Count not get value from JSON")
                    return
                }
                
                session = Session(clientSessionId: clientSessionId, customerId: customerId, region: region, environment: environment, appIdentifier: AppConstants.kApplicationIdentifier)
                
                print(clientSessionId)
                print(customerId)
                
                func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
                    if (segue.identifier == "sessionKeys") {
                        let destinationVC:MainView = segue.destination as! MainView
                        
                        destinationVC.clientSessionId.text = clientSessionId
                        
                        destinationVC.customerId.text = customerId
                    
                    }
                }
        }
    }
}
