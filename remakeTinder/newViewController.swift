//
//  newViewController.swift
//  remakeTinder
//
//  Created by Sierra Klix on 11/3/18.
//  Copyright © 2018 Ryan McCommon. All rights reserved.
//

import UIKit

class newViewController: UIViewController {
    @IBOutlet weak var navBar: UIImageView!
    
    @IBOutlet weak var proPic: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func tapedDone(_ sender: Any) {
        performSegue(withIdentifier: "oldSegue", sender: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}