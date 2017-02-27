//
//  ViewController.swift
//  TicTacToe
//
//  Created by Kevin Le on 2/27/17.
//  Copyright © 2017 Kevinvle. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    
    
    @IBAction func buttonPressed(_ sender: AnyObject) { // Note I had to add "Object" after "Any". Reference: https://stackoverflow.com/questions/39606073/cant-drag-button-action-to-existing-function-in-xcode-8
        
        
        
        sender.setImage(UIImage(named: "nought.png"), for: []) // Empty array to specify the default state
        
        
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

