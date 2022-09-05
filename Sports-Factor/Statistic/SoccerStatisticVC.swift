//
//  SoccerStatisticVC.swift
//  Sports-Factor
//
//  Created by Демид Стариков on 04.09.2022.
//

import UIKit

class SoccerStatisticVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet var gameCol: UICollectionView!
    
    @IBOutlet var statView: UIView!
    
    var gameCell = MatchesCollectionViewCell()
    
    var gameID = ""
    
    var statistic : [StatPre] = []
    
    @IBOutlet var goals1: UILabel!
    @IBOutlet var goals2: UILabel!
    
    @IBOutlet var blows1: UILabel!
    @IBOutlet var blows2: UILabel!
    
    @IBOutlet var corner1: UILabel!
    @IBOutlet var corner2: UILabel!
    
    @IBOutlet var penalties1: UILabel!
    @IBOutlet var penalties2: UILabel!
    
    @IBOutlet var redCards1: UILabel!
    @IBOutlet var redCards2: UILabel!
    
    var games : [StatPre] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gameCol.dataSource = self
        gameCol.delegate = self
        
        let url = URL(string: "https://spoyer.com/api/get.php?login=ayna&token=12784-OhJLY5mb3BSOx0O&task=eventdata&game_id=\(gameID)")

        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request, completionHandler: { data, response, error -> Void in
            
            do {
                let jsonDecoder = JSONDecoder()
                let responseModel = try jsonDecoder.decode(soccerStat.self, from: data!)
                self.games = responseModel.results
                
                DispatchQueue.main.async {
                     self.statLoad()
                }
               
            } catch {
                print("JSON Serialization error")
            }
        }).resume()
        
    }

    func statLoad() {
        goals1.text = games.first?.stats.goals?.first
        goals2.text = games.first?.stats.goals?.last

        if games.first?.stats.attacks?.first != nil {
            blows1.text = games.first?.stats.attacks?.first
        } else {
            blows1.text = "0"
        }

        if games.first?.stats.attacks?.last != nil {
            blows2.text = games.first?.stats.attacks?.last
        } else {
            blows2.text = "0"
        }
        corner1.text = games.first?.stats.corners?.first
        corner2.text = games.first?.stats.corners?.last

        penalties1.text = games.first?.stats.penalties?.first
        penalties2.text = games.first?.stats.penalties?.last

        redCards1.text = games.first?.stats.redcards?.first
        redCards2.text = games.first?.stats.redcards?.last
    }

    

    @IBAction func backButton(_ sender: UIButton) {
        AppDelegate.shared.playAudioFile()
        dismiss(animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        var cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MatchesCollectionViewCell", for: indexPath) as! MatchesCollectionViewCell
        
        cell = gameCell
        
        return cell
    }
    
    
}
