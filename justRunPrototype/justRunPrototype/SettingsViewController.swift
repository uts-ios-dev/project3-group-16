//
//  SettingsViewController.swift
//  justRunPrototype
//
//  Created by Alexander Leydon on 21/5/18.
//  Copyright © 2018 Alexander Leydon. All rights reserved.
//
//  Update values when something changes

import Foundation
import UIKit

class SettingsViewController: UIViewController {
    
    var levelSpeed: Float = 5.0
    var playerColour: UIColor = UIColor.cyan
    var playerName: String = "Test"
    var levelTheme: Int = 1
    var levelDifficulty: Int = 1
    var red: CGFloat = CGFloat(0.5)
    var green: CGFloat = CGFloat(0.5)
    var blue: CGFloat = CGFloat(0.5)
    var alpha: CGFloat = CGFloat(0.5)

    @IBOutlet weak var levelSpeedSlider: UISlider!
    @IBOutlet weak var levelSpeedLabel: UILabel!
    @IBOutlet weak var playerColourRedSlider: UISlider!
    @IBOutlet weak var playerColourGreenSlider: UISlider!
    @IBOutlet weak var playerColourBlueSlider: UISlider!
    @IBOutlet weak var playerColourAlphaSlider: UISlider!
    @IBOutlet weak var playerColourImage: UIImageView!
    @IBOutlet weak var difficultySegment: UISegmentedControl!
    @IBOutlet weak var levelThemeSegment: UISegmentedControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        levelSpeed = levelSpeedSlider.value
        levelSpeedLabel.text = String(levelSpeed)
        red = CGFloat(playerColourRedSlider.value)
        green = CGFloat(playerColourGreenSlider.value)
        blue = CGFloat(playerColourBlueSlider.value)
        alpha = CGFloat(playerColourAlphaSlider.value)
        colourPlayer()
    }
    
    func colourPlayer(){
        playerColour = UIColor(red: red, green: green, blue: blue, alpha: alpha)
        playerColourImage.backgroundColor = playerColour
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func redChanged(_ sender: Any) {
        red = CGFloat(playerColourRedSlider.value)
        colourPlayer()
    }
    @IBAction func greenChanged(_ sender: Any) {
        green = CGFloat(playerColourGreenSlider.value)
        colourPlayer()
    }
    @IBAction func blueChanged(_ sender: Any) {
        blue = CGFloat(playerColourBlueSlider.value)
        colourPlayer()
    }
    @IBAction func alphaChnaged(_ sender: Any) {
        alpha = CGFloat(playerColourAlphaSlider.value)
        colourPlayer()
    }
    @IBAction func speedChanged(_ sender: Any) {
        levelSpeed = levelSpeedSlider.value
        levelSpeedLabel.text = String(levelSpeed) + " m/s"
    }
    @IBAction func difficultyChanged(_ sender: Any) {
        levelDifficulty = difficultySegment.selectedSegmentIndex
    }
    @IBAction func themeChanged(_ sender: Any) {
        levelTheme = levelThemeSegment.selectedSegmentIndex
    }
    
}
