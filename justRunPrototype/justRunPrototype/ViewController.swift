//
//  ViewController.swift
//  justRunPrototype
//
//  Created by Alexander Leydon on 14/5/18.
//  Copyright © 2018 Alexander Leydon. All rights reserved.
//
// Need to change levelTheme, levelDifficulty and playerPosition
// from Int to a more appropriate type. And add an init
import UIKit

class ViewController: UIViewController {

    var levelSpeed: Float = 2.0
    var playerColour: UIColor = UIColor.cyan
    var playerName: String = "Test"
    var levelTheme: Int = 1
    var levelDifficulty: Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func unwindToMenu(unwindSegue: UIStoryboardSegue){
        
    }
}

