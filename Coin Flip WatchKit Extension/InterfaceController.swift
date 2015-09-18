//
//  InterfaceController.swift
//  Coin Flip WatchKit Extension
//
//  Created by PC on 5/4/15.
//  Copyright (c) 2015 Randel Smith. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    @IBOutlet weak var coinInterfaceImage: WKInterfaceImage!
    
    private var coinImages : NSMutableArray!
    
    private var stopIndex : Int!
    private var currentIndex : Int!
    
    private var isFlapping : Bool!
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        
        self.coinImages = []
        self.coinImages.addObject(UIImage(named: "head.jpg")!)
        self.coinImages.addObject(UIImage(named: "tail.jpg")!)
        
        self.isFlapping = false
    }

    @IBAction func flipTouchUp() {
        
        if self.isFlapping != true {
            self.startAnimation()
            
            self.isFlapping = true
        }
    }

    func startAnimation(){
        self.coinInterfaceImage.setImage(UIImage(named: "tail.jpg"))
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
            self.coinInterfaceImage.setImage(self.coinImages[showIndex] as? UIImage)
            
            NSTimer.scheduledTimerWithTimeInterval(0.2, target: self, selector: Selector("showImageAtIndex:"), userInfo: showIndex, repeats: false)
        } else {
          self.isFlapping = false
        }
    }
}


