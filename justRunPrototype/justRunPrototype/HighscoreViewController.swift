//
//  HighscoreViewController.swift
//  justRunPrototype
//
//  Created by Alexander Leydon on 21/5/18.
//  Copyright © 2018 Alexander Leydon. All rights reserved.
//

import Foundation
import UIKit

class HighscoreViewController: UITableViewController{
    var players: [Player] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func loadData(){
        let docsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let archiveURL = docsDirectory.appendingPathComponent("Highscores").appendingPathExtension("txt")
        let jsonDecoder = JSONDecoder()
        if let scoreData = try? Data(contentsOf: archiveURL),
            let decodedScores = try? jsonDecoder.decode([Player].self, from: scoreData){
            self.players = decodedScores
            self.tableView.reloadData()
        }
    }
    func saveData(player: Player){
        var updatedData = self.players
        updatedData.append(player)
        let docsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let archiveURL = docsDirectory.appendingPathComponent("Highscores").appendingPathExtension("txt")
        do{
            let data = try JSONEncoder().encode(updatedData)
            try data.write(to: archiveURL, options: .noFileProtection)
        } catch{
            print("Error whilst saving data")
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        loadData()
        players.sort(by: {$0.score > $1.score})
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return players.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "playerCell", for: indexPath)
        
        // Configure the cell...
        let item = players[indexPath.row]
        cell.textLabel?.text = item.name
        cell.detailTextLabel?.text = String(Int(item.score))
        return cell
    }
}
