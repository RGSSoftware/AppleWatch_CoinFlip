//
//  ViewController.swift
//  Coin Flip
//
//  Created by PC on 5/4/15.
//  Copyright (c) 2015 Randel Smith. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var coinImageView: UIImageView!
    
    private var coinImages : NSMutableArray!
    
    private var stopIndex : Int!
    private var currentIndex : Int!
    
    private var isFlapping : Bool!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.coinImages = []
        self.coinImages.addObject(UIImage(named: "head.jpg")!)
        self.coinImages.addObject(UIImage(named: "tail.jpg")!)
        
        self.isFlapping = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func flipTouchUp() {
        
        if self.isFlapping != true {
            self.startAnimation()
            
            self.isFlapping = true
        }
    }
    
    func startAnimation(){
        self.coinImageView.image = UIImage(named: "tail.jpg")
        self.currentIndex = 0
        
        if Int(arc4random_uniform(2)) == 0{
            self.stopIndex = 9
        } else {
            self.stopIndex = 10
        }
        NSTimer.scheduledTimerWithTimeInterval(0.0, target: self, selector: Selector("showImageAtIndex:"), userInfo:0, repeats: false)
    }
    
    func showImageAtIndex(timer : NSTimer){
        
        if self.currentIndex != self.stopIndex{
            var index : Int = timer.userInfo as! Int
            
            var showIndex : Int
            if index  == 0 {
                showIndex = 1
            } else {
                showIndex = 0
            }
            self.currentIndex = self.currentIndex + 1
            self.coinImageView.image = self.coinImages[showIndex] as? UIImage
            
            NSTimer.scheduledTimerWithTimeInterval(0.2, target: self, selector: Selector("showImageAtIndex:"), userInfo: showIndex, repeats: false)
        } else {
            self.isFlapping = false
        }
    }

}

