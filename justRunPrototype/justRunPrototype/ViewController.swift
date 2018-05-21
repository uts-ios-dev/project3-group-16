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

class ViewController: UIViewController, SettingsProtocol {

    var settingsVC: SettingsViewController?
    var levelSpeed: Float = 2.0
    var playerColour: UIColor = UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 1)
    var playerName: String = "Test"
    var levelTheme: Int = 1
    var levelDifficulty: Int = 1
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var settingsButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func viewWillAppear(_ animated: Bool) {
        nameTextField.backgroundColor = playerColour
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func setPlayerColour(valueSent: UIColor) {
        self.playerColour = valueSent
    }
    func setLevelTheme(valueSent: Int) {
        self.levelTheme = valueSent
    }
    func setDifficulty(valueSent: Int) {
        self.levelDifficulty = valueSent
    }
    func setLevelSpeed(valueSent: Float) {
        self.levelSpeed = valueSent
    }
    
    @IBAction func toSettings(_ sender: Any) {
        settingsVC = self.storyboard?.instantiateViewController(withIdentifier: "SettingsViewController") as? SettingsViewController
        settingsVC?.delegate = self
        self.navigationController?.pushViewController(settingsVC!, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "gameSegue"{
            let vc = segue.destination as! GameViewController
            vc.playerName = nameTextField.text!
        } else if segue.identifier == "settingsSegue"{
            let vc = segue.destination as! SettingsViewController
            vc.delegate = self
        }else{
            return
        }
    }
    
    @IBAction func unwindToMenu(unwindSegue: UIStoryboardSegue){
        
    }
}

