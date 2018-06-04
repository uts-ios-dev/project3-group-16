//
//  GameViewController.swift
//  justRunPrototype
//
//  Created by Alexander Leydon on 21/5/18.
//  Copyright © 2018 Alexander Leydon. All rights reserved.
//

import Foundation
import UIKit
import SpriteKit

extension SKNode {
    class func unarchiveFromFile(_ file : String) -> SKNode? {
        
        let path = Bundle.main.path(forResource: file, ofType: "sks")
        
        let sceneData: Data?
        do {
            sceneData = try Data(contentsOf: URL(fileURLWithPath: path!), options: .mappedIfSafe)
        } catch _ {
            sceneData = nil
        }
        let archiver = NSKeyedUnarchiver(forReadingWith: sceneData!)
        
        archiver.setClass(self.classForKeyedUnarchiver(), forClassName: "SKScene")
        let scene = archiver.decodeObject(forKey: NSKeyedArchiveRootObjectKey) as! GameScene
        archiver.finishDecoding()
        return scene
    }
}

class GameViewController: UIViewController, GameProtocol {
    
    @IBOutlet weak var GameView: SKView!
    var gameScene: GameScene?
    var screenSize = UIScreen.main.bounds
    var levelSpeed: Float = 0.01
    var playerChara: Int = 0
    var playerName: String = "Test"
    var levelTheme: Int = 1
    var levelDifficulty: Int = 1
    var playerScore: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if let scene = GameScene.unarchiveFromFile("GameScene") as? GameScene {
            gameScene = scene
            gameScene?.gameDelegate = self
            gameScene?.playerChara = playerChara
            gameScene?.levelTheme = levelTheme
            gameScene?.levelSpeed = levelSpeed
            gameScene?.levelDifficulty = levelDifficulty
            // Configure the view.
            let skView = GameView!
            skView.showsFPS = true
            skView.showsNodeCount = true
            
            /* Sprite Kit applies additional optimizations to improve rendering performance */
            skView.ignoresSiblingOrder = true
            
            /* Set the scale mode to scale to fit the window */
            scene.scaleMode = .aspectFill
            
            skView.presentScene(scene)
        }
    }
    
    override var shouldAutorotate : Bool {
        return true
    }
    
    func setPlayerScore(valueSent: Int) {
        self.playerScore = valueSent
    }
    func toHighscores() {
        let highscore = self.storyboard?.instantiateViewController(withIdentifier: "HighscoreViewController") as? HighscoreViewController
        let player = Player(name: playerName, score: playerScore)
        highscore?.loadData()
        highscore?.saveData(player: player)
        self.navigationController?.pushViewController(highscore!, animated: true)
    }
    
    override var supportedInterfaceOrientations : UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return UIInterfaceOrientationMask.allButUpsideDown
        } else {
            return UIInterfaceOrientationMask.all
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "highscoreSegue"{
            _ = segue.destination as! HighscoreViewController
        }
    }
}
