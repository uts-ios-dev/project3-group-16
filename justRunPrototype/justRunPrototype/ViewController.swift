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

class ViewController: UIViewController, SettingsProtocol, UITextFieldDelegate {

    var settingsVC: SettingsViewController?
    var levelSpeed: Float = 0.01
    var playerChara: Int = 0
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
        nameTextField.backgroundColor = UIColor.cyan
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func setPlayerChara(valueSent: Int) {
        self.playerChara = valueSent
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
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.nameTextField.endEditing(true)
        return true
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
            vc.levelDifficulty = levelDifficulty
            vc.playerChara = playerChara
            vc.levelSpeed = levelSpeed
            vc.levelTheme = levelTheme
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

