//
//  SettingsViewController.swift
//  justRunPrototype
//
//  Created by Alexander Leydon on 21/5/18.
//  Copyright © 2018 Alexander Leydon. All rights reserved.
//

import Foundation
import UIKit

class SettingsViewController: UIViewController {
    
    var delegate: SettingsProtocol?
    var levelSpeed: Float = 0.01
    var playerChara: Int = 0
    var playerName: String = "Test"
    var levelTheme: Int = 0
    var levelDifficulty: Int = 0

    @IBOutlet weak var levelSpeedSlider: UISlider!
    @IBOutlet weak var levelSpeedLabel: UILabel!
    
    @IBOutlet weak var charaSegment: UISegmentedControl!
    @IBOutlet weak var charaImage: UIImageView!
    
    @IBOutlet weak var difficultySegment: UISegmentedControl!
    @IBOutlet weak var levelThemeSegment: UISegmentedControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        levelSpeed = levelSpeedSlider.value
        levelSpeedLabel.text = String(levelSpeed)
        showCharacter()
    }
    
    func showCharacter(){
        switch playerChara{
        case 0:
            charaImage.image = UIImage(named: "dragonfly1.png")
            break;
        case 1:
            charaImage.image = UIImage(named: "bluebird1.png")
            break;
        case 2:
            charaImage.image = UIImage(named: "plane1.png")
            break;
        default: break;
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func charaChanged(_ sender: Any) {
        playerChara = charaSegment.selectedSegmentIndex
        showCharacter()
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
    @IBAction func updateSettings(_ sender: Any) {
        delegate?.setDifficulty(valueSent: levelDifficulty)
        delegate?.setLevelSpeed(valueSent: levelSpeed)
        delegate?.setLevelTheme(valueSent: levelTheme)
        delegate?.setPlayerChara(valueSent: playerChara)
    }
    
}
