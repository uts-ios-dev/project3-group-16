//
//  SettingsProtocol.swift
//  justRunPrototype
//
//  Created by Alexander Leydon on 21/5/18.
//  Copyright © 2018 Alexander Leydon. All rights reserved.
//

import Foundation
import UIKit
protocol SettingsProtocol {
    func setPlayerColour(valueSent: UIColor)
    func setLevelSpeed(valueSent: Float)
    func setDifficulty(valueSent: Int)
    func setLevelTheme(valueSent: Int)
}
