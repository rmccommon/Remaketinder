//
//  ViewController.swift
//  remakeTinder
//
//  Created by Sierra Klix on 10/29/18.
//  Copyright © 2018 Ryan McCommon. All rights reserved.
//

import UIKit

class cardViewController: UIViewController {
    @IBOutlet weak var profPic: UIImageView!
    @IBOutlet weak var navBar: UIImageView!
    @IBOutlet weak var actionButtons: UIImageView!
    
    var mainCenter : CGPoint!
    var ystarted: CGFloat!
    var fadeTrans: FadeTransition!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        profPic.layer.cornerRadius = 50
        profPic.clipsToBounds = true
        mainCenter = profPic.center
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func tapedInfo(_ sender: Any) {
        performSegue(withIdentifier: "newSegue", sender: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }



    
    @IBAction func movedPic(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: view)
        
        if(sender.state == .began){
            ystarted = sender.location(in: profPic).y
            
        }else if(sender.state == .changed){
            //bottom half
            if(ystarted<=204){
                //moving left
                if(translation.x < 0){
                    let transAmnt = max(-50, Double(translation.x))
                    let rotateAmnt = max(-45,Double(translation.x)) *    Double.pi / 180
                    profPic.transform = CGAffineTransform(translationX: CGFloat(transAmnt), y: 0)
                    profPic.transform = profPic.transform.rotated(by: CGFloat(rotateAmnt))
                    if(translation.x < -50){
                        fadePicOut()
                    }
                }
                //moving right
                else{
                    let transAmnt = min(50, Double(translation.x))
                    let rotateAmnt = min(45,Double(translation.x)) *    Double.pi / 180
                    profPic.transform = CGAffineTransform(translationX: CGFloat(transAmnt), y: 0)
                    profPic.transform = profPic.transform.rotated(by: CGFloat(rotateAmnt))
                    if(translation.x > 50){
                        fadePicOut()
                    }
                }
            }
            //bottom half
            else{
                //moving left
                if(translation.x < 0){
                    let transAmnt = max(-50, Double(translation.x))
                    let rotateAmnt = max(-45,Double(translation.x)) *    Double.pi / 180
                    profPic.transform = CGAffineTransform(translationX: CGFloat(transAmnt), y: 0)
                    profPic.transform = profPic.transform.rotated(by: CGFloat(-rotateAmnt))
                    if(translation.x < -50){
                        fadePicOut()
                    }
                    
                }
                //moving right
                else{
                    let transAmnt = min(50, Double(translation.x))
                    let rotateAmnt = min(45,Double(translation.x)) *    Double.pi / 180
                    profPic.transform = CGAffineTransform(translationX: CGFloat(transAmnt), y: 0)
                    profPic.transform = profPic.transform.rotated(by: CGFloat(-rotateAmnt))
                    if(translation.x > 50){
                        fadePicOut()
                    }
                }
            }
            
        }else if(sender.state == .ended){
            UIView.animate(withDuration: 0.4, animations: {
                self.profPic.transform = CGAffineTransform.identity
            })
            
        }
    }
    

    
    func fadePicOut(){
        UIView.animate(withDuration: 0.2, animations: {
            self.profPic.alpha = 0;
        })
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Access the ViewController that you will be transitioning too, a.k.a, the destinationViewController.
        let destinationViewController = segue.destination
        
        // Set the modal presentation style of your destinationViewController to be custom.
        destinationViewController.modalPresentationStyle = UIModalPresentationStyle.custom
        
        // Create a new instance of your fadeTransition.
        fadeTrans = FadeTransition()
        
        // Tell the destinationViewController's  transitioning delegate to look in fadeTransition for transition instructions.
        destinationViewController.transitioningDelegate = fadeTrans
        
        // Adjust the transition duration. (seconds)
        fadeTrans.duration = 0.5
    }
    
    
}

