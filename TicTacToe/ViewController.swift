//
//  ViewController.swift
//  TicTacToe
//
//  Created by Kevin Le on 2/27/17.
//  Copyright © 2017 Kevinvle. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    // 1 is noughts, 2 is player
 
    var activePlayer = 1
    
    var gameState = [0, 0 ,0 ,0 ,0 ,0 ,0 ,0 ,0] // 0 - empty, 1 - nought, 2 - crosses
    
    
    @IBAction func buttonPressed(_ sender: AnyObject) { // Note I had to add "Object" after "Any". Reference: https://stackoverflow.com/questions/39606073/cant-drag-button-action-to-existing-function-in-xcode-8
        
        let activePosition = sender.tag - 1 // We're redefining activePosition each time the buttonPressed method is called, we use let instead of var
        
        if gameState[activePosition] == 0 {
            
            gameState[activePosition] = activePlayer
            
            
        if activePlayer == 1 {
            
            sender.setImage(UIImage(named: "nought.png"), for: []) // Empty array to specify the default state
            
            activePlayer = 2
            
            
            
            
        } else {
            
            sender.setImage(UIImage(named: "cross.png"), for: []) // Empty array to specify the default state
            
            activePlayer = 1
            
            }
        
        }
        
        print(sender.tag)
        
        
        
        
        
        
   
    }
    
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

