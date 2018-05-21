//
//  Player.swift
//  justRunPrototype
//
//  Created by Alexander Leydon on 21/5/18.
//  Copyright © 2018 Alexander Leydon. All rights reserved.
//

import UIKit

class Player: Codable{
    
    var name: String
    var score: Double
    
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let archivedURL = DocumentsDirectory.appendingPathComponent("players")
    
    init(name: String, score: Double){
        self.name = name
        self.score = score
    }
    required convenience init(coder aDecoder: NSCoder){
        let name = aDecoder.decodeObject(forKey: "name") as! String
        let score = aDecoder.decodeDouble(forKey: "score")
        self.init(name: name, score:score)
    }
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: "name")
        aCoder.encode(score, forKey: "score")
    }
}
