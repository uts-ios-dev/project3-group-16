//
//  GameViewController.swift
//  justRunPrototype
//
//  Created by Alexander Leydon on 21/5/18.
//  Copyright © 2018 Alexander Leydon. All rights reserved.
//
// Create player, level and an array of collectables and obstacles

import Foundation
import UIKit

class GameViewController: UIViewController {
    
    var levelSpeed: Float = 2.0
    var playerColour: UIColor = UIColor.cyan
    var playerName: String = "Test"
    var levelTheme: Int = 1
    var levelDifficulty: Int = 1
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func viewWillAppear(_ animated: Bool) {
        label.text = playerName
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "highscoreSegue"{
            
        }
    }
}
