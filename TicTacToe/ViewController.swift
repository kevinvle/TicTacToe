//
//  ViewController.swift
//  TicTacToe
//
//  Created by Kevin Le on 2/27/17.
//  Copyright © 2017 Kevinvle. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var winnerLabel: UILabel!

    @IBOutlet var playAgainButton: UIButton!
    
    @IBAction func playAgain(_ sender: AnyObject) {

         activeGame = true
        
         activePlayer = 1
        
         gameState = [0, 0 ,0 ,0 ,0 ,0 ,0 ,0 ,0] // 0 - empty, 1 - nought, 2 - crosses
        
        for i in 1..<10 { // 1 to 10 and 1 less than 10
            
            if let button = view.viewWithTag(i) as? UIButton { // You should set i to non zero. Cast that to UIButton because view is returning a general view which is any kind of UI element and we want to use some button specific features so we need to cast it as a button.
                
                button.setImage(nil, for: []) // Get rid of images for normal state
            }
            
            winnerLabel.isHidden = true
            playAgainButton.isHidden = true
            
            winnerLabel.center = CGPoint(x: winnerLabel.center.x - 500, y: winnerLabel.center.y)
            
            playAgainButton.center = CGPoint(x: playAgainButton.center.x - 500, y: playAgainButton.center.y)
            
        }
    
    }

    // 1 is noughts, 2 is player
    
    var activeGame = true
 
    var activePlayer = 1
    
    var gameState = [0, 0 ,0 ,0 ,0 ,0 ,0 ,0 ,0] // 0 - empty, 1 - nought, 2 - crosses

    let winningCombinations = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8]] // e.g. 0,1,2 combination from left to right horizontally. 1,4,7 vertically
    
    @IBAction func buttonPressed(_ sender: AnyObject) { // Note I had to add "Object" after "Any". Reference: https://stackoverflow.com/questions/39606073/cant-drag-button-action-to-existing-function-in-xcode-8
        
        let activePosition = sender.tag - 1 // We're redefining activePosition each time the buttonPressed method is called, we use let instead of var
        
        if gameState[activePosition] == 0 && activeGame {
            
            gameState[activePosition] = activePlayer

        if activePlayer == 1 {
            
            sender.setImage(UIImage(named: "nought.png"), for: []) // Empty array to specify the default state
            
            activePlayer = 2
            
        } else {
            
            sender.setImage(UIImage(named: "cross.png"), for: []) // Empty array to specify the default state
            
            activePlayer = 1
            
            }
            
            for combination in winningCombinations {
                
                if gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]] { // We want to check if combos are [1, 1, 1] noughts or [2, 2, 2] crosses
                    
                    // We have a winner!
                    
                    activeGame = false
                    
                    winnerLabel.isHidden = false
                    
                    playAgainButton.isHidden = false
                    
                    if (gameState[combination[0]]) == 1 { // Number of the winner
                        
                        winnerLabel.text = "Nought has won!"
                        
                    } else {
                        
                        winnerLabel.text = "Crosses has won!"
                    }
                    
                    UIView.animate(withDuration: 1, animations: {
                        
                        self.winnerLabel.center = CGPoint(x: self.winnerLabel.center.x + 500, y: self.winnerLabel.center.y) // We're inside a closure happening outside the main thread. So we need to use self to make oit clear that we're referring to something outside of the closure and specifically in the view controller
                        
                        self.playAgainButton.center = CGPoint(x: self.playAgainButton.center.x + 500, y: self.playAgainButton.center.y)
                        
                    })
                    
                }
            }
    
        }
   
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        winnerLabel.isHidden = true
        playAgainButton.isHidden = true
        
        winnerLabel.center = CGPoint(x: winnerLabel.center.x - 500, y: winnerLabel.center.y)
        playAgainButton.center = CGPoint(x: playAgainButton.center.x - 500, y: playAgainButton.center.y)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

