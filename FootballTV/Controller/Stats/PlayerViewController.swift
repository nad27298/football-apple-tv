//
//  PlayerViewController.swift
//  FootballTV
//
//  Created by nguyenhuyson2 on 11/27/20.
//  Copyright © 2020 Nguyen Anh Dao. All rights reserved.
//

import UIKit
import Alamofire
import Kingfisher

class PlayerViewController: UIViewController {
    
    @IBOutlet weak var viewBlue: UIView!
    @IBOutlet weak var viewGreen: UIView!
    @IBOutlet weak var tblviewPlayer: UITableView!
    @IBOutlet weak var lblBarTitle: UILabel!
    @IBOutlet weak var lblBarName: UILabel!
        @IBOutlet weak var imgLogo: UIImageView!
    
    var checkLeaguePlayer: Int = 0
    var checkIndexPlayer: Int = 0
    
    var playerData: PlayerStatsModel = PlayerStatsModel(["":""])
    
    var arrGoals: [String] = ["http://sport-data.allfootballapp.com/soccer/biz/data/person_ranking?app=af&version=337&platform=ios&type=goals&season_id=17139", "http://sport-data.allfootballapp.com/soccer/biz/data/person_ranking?app=af&version=337&platform=ios&type=goals&season_id=17133", "http://sport-data.allfootballapp.com/soccer/biz/data/person_ranking?app=af&version=337&platform=ios&type=goals&season_id=17179", "http://sport-data.allfootballapp.com/soccer/biz/data/person_ranking?app=af&version=337&platform=ios&type=goals&season_id=17051", "http://sport-data.allfootballapp.com/soccer/biz/data/person_ranking?app=af&version=337&platform=ios&type=goals&season_id=16786"]
    
    var arrAssists: [String] = ["http://sport-data.allfootballapp.com/soccer/biz/data/person_ranking?app=af&version=337&platform=ios&type=assists&season_id=17139", "http://sport-data.allfootballapp.com/soccer/biz/data/person_ranking?app=af&version=337&platform=ios&type=assists&season_id=17133", "http://sport-data.allfootballapp.com/soccer/biz/data/person_ranking?app=af&version=337&platform=ios&type=assists&season_id=17179", "http://sport-data.allfootballapp.com/soccer/biz/data/person_ranking?app=af&version=337&platform=ios&type=assists&season_id=17051", "http://sport-data.allfootballapp.com/soccer/biz/data/person_ranking?app=af&version=337&platform=ios&type=assists&season_id=16786"]
    
    var arrKeyPasses: [String] = ["http://sport-data.allfootballapp.com/soccer/biz/data/person_ranking?app=af&version=337&platform=ios&type=key_passes&season_id=17139", "http://sport-data.allfootballapp.com/soccer/biz/data/person_ranking?app=af&version=337&platform=ios&type=key_passes&season_id=17133", "http://sport-data.allfootballapp.com/soccer/biz/data/person_ranking?app=af&version=337&platform=ios&type=key_passes&season_id=17179", "http://sport-data.allfootballapp.com/soccer/biz/data/person_ranking?app=af&version=337&platform=ios&type=key_passes&season_id=17051", "http://sport-data.allfootballapp.com/soccer/biz/data/person_ranking?app=af&version=337&platform=ios&type=key_passes&season_id=16786"]
    
    var arrShot: [String] = ["http://sport-data.allfootballapp.com/soccer/biz/data/person_ranking?app=af&version=337&platform=ios&type=shots&season_id=17139", "http://sport-data.allfootballapp.com/soccer/biz/data/person_ranking?app=af&version=337&platform=ios&type=shots&season_id=17133", "http://sport-data.allfootballapp.com/soccer/biz/data/person_ranking?app=af&version=337&platform=ios&type=shots&season_id=17179", "http://sport-data.allfootballapp.com/soccer/biz/data/person_ranking?app=af&version=337&platform=ios&type=shots&season_id=17051", "http://sport-data.allfootballapp.com/soccer/biz/data/person_ranking?app=af&version=337&platform=ios&type=shots&season_id=16786"]
    
    var arrPasese: [String] = ["http://sport-data.allfootballapp.com/soccer/biz/data/person_ranking?app=af&version=337&platform=ios&type=passes&season_id=17139", "http://sport-data.allfootballapp.com/soccer/biz/data/person_ranking?app=af&version=337&platform=ios&type=passes&season_id=17133", "http://sport-data.allfootballapp.com/soccer/biz/data/person_ranking?app=af&version=337&platform=ios&type=passes&season_id=17179", "http://sport-data.allfootballapp.com/soccer/biz/data/person_ranking?app=af&version=337&platform=ios&type=passes&season_id=17051", "http://sport-data.allfootballapp.com/soccer/biz/data/person_ranking?app=af&version=337&platform=ios&type=passes&season_id=16786"]
    
    var arrFouls: [String] = ["http://sport-data.allfootballapp.com/soccer/biz/data/person_ranking?app=af&version=337&platform=ios&type=fouls&season_id=17139", "http://sport-data.allfootballapp.com/soccer/biz/data/person_ranking?app=af&version=337&platform=ios&type=fouls&season_id=17133", "http://sport-data.allfootballapp.com/soccer/biz/data/person_ranking?app=af&version=337&platform=ios&type=fouls&season_id=17179", "http://sport-data.allfootballapp.com/soccer/biz/data/person_ranking?app=af&version=337&platform=ios&type=fouls&season_id=17051", "http://sport-data.allfootballapp.com/soccer/biz/data/person_ranking?app=af&version=337&platform=ios&type=fouls&season_id=16786"]
   
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(viewBlue)
        view.addSubview(viewGreen)
        tblviewPlayer.delegate = self
        tblviewPlayer.dataSource = self
        tblviewPlayer.register(UINib(nibName: "PlayerTVC", bundle: nil), forCellReuseIdentifier: "PlayerTVC")
        lblBarTitle.layer.cornerRadius = 20
        lblBarTitle.layer.masksToBounds = true
        lblBarName.layer.cornerRadius = 20
        lblBarName.layer.masksToBounds = true
        let imageLogo = UserDefaults.standard.string(forKey: "IMG_LOGO") ?? ""
        imgLogo.getImageFromURL(imageLogo)
        checkLoadLeagueData(checkLeaguePlayer)
        switch checkLeaguePlayer {
        case 0:
            lblBarTitle.text = "EPL"
            loadScreenImage("EPL BK")
        case 1:
            lblBarTitle.text = "La Liga"
            loadScreenImage("La Liga BK")
        case 2:
            lblBarTitle.text = "Serie A"
            loadScreenImage("Serie A BK")
        case 3:
            lblBarTitle.text = "Bundesliga"
            loadScreenImage("Bundesliga BK")
        case 4:
            lblBarTitle.text = "Ligue 1"
            loadScreenImage("Ligue 1 BK")
        default:
            lblBarTitle.text = ""
        }
        switch checkIndexPlayer {
        case 0:
            lblBarName.text = "Goal"
        case 1:
            lblBarName.text = "Assists"
        case 2:
            lblBarName.text = "Key Passes"
        case 3:
            lblBarName.text = "Shots"
        case 4:
            lblBarName.text = "Passes"
        case 5:
            lblBarName.text = "Fouls"
        default:
            lblBarName.text = ""
        }
    }
    
    func loadScreenImage(_ imgScreen: String) {
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: imgScreen) ?? UIImage())
    }
    
    func getPlayerDataFromSever(_ url: String) {
        Alamofire.request(url).responseJSON { (responds) in 
            if let respondsValue = responds.result.value as? [String: Any] {
                let returnJSON: PlayerStatsModel = PlayerStatsModel.init(respondsValue)
                self.playerData = returnJSON
                self.tblviewPlayer.reloadData()
            }
        }
    }
    
    @IBAction func btn_Logo(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let pick:PickViewController = storyboard.instantiateViewController(withIdentifier: "Pick") as! PickViewController
        self.present(pick, animated: true)
    }

    @IBAction func btn_News(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let news:NewsViewController = storyboard.instantiateViewController(withIdentifier: "News") as! NewsViewController
        self.present(news, animated: true)
    }
    
    @IBAction func btn_Match(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let match:MatchViewController = storyboard.instantiateViewController(withIdentifier: "Match") as! MatchViewController
        self.present(match, animated: true)
    }
    
    @IBAction func btn_Stats(_ sender: Any) {
    }
    
    @IBAction func btn_Video(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let video:VideoViewController = storyboard.instantiateViewController(withIdentifier: "Video") as! VideoViewController
        self.present(video, animated: true)
    }
    
    func checkLoadLeagueData(_ int: Int) {
        switch checkIndexPlayer {
        case 0:
            getPlayerDataFromSever(arrGoals[int])
        case 1:
            getPlayerDataFromSever(arrAssists[int])
        case 2:
            getPlayerDataFromSever(arrKeyPasses[int])
        case 3:
            getPlayerDataFromSever(arrShot[int])
        case 4:
            getPlayerDataFromSever(arrPasese[int])
        case 5:
            getPlayerDataFromSever(arrFouls[int])
        default:
            print("Default Error")
        }
    }
    
    @IBAction func btn_EPL(_ sender: Any) {
        self.checkLeaguePlayer = 0
        lblBarTitle.text = "EPL"
        loadScreenImage("EPL BK")
        checkLoadLeagueData(0)
    }
        
    @IBAction func btn_LaLiga(_ sender: Any) {
        self.checkLeaguePlayer = 1
        lblBarTitle.text = "La Liga"
        loadScreenImage("La Liga BK")
        checkLoadLeagueData(1)
    }
    
    @IBAction func btn_SerieA(_ sender: Any) {
        self.checkLeaguePlayer = 2
        checkLoadLeagueData(2)
    }
    
    @IBAction func btn_Bundesliga(_ sender: Any) {
        self.checkLeaguePlayer = 3
        lblBarTitle.text = "Bundesliga"
        loadScreenImage("Bundesliga BK")
        checkLoadLeagueData(3)
    }
    
    @IBAction func btn_Ligue1(_ sender: Any) {
        self.checkLeaguePlayer = 4
        lblBarTitle.text = "Ligue 1"
        loadScreenImage("Ligue 1 BK")
        checkLoadLeagueData(4)
    }
    
    @IBAction func btn_Table(_ sender: Any) {
        let stotryboard = UIStoryboard(name: "Main", bundle: nil)
        let stats:StatsViewController = stotryboard.instantiateViewController(withIdentifier: "StatsView") as! StatsViewController
        stats.checkLeagueTable = checkLeaguePlayer
        stats.checkIndexTable = checkIndexPlayer
        self.present(stats, animated: false)
    }
    
    @IBAction func btn_Goals(_ sender: Any) {
        self.checkIndexPlayer = 0
        lblBarName.text = "Goals"
        getPlayerDataFromSever(arrGoals[checkLeaguePlayer])
    }
    
    @IBAction func btn_Assists(_ sender: Any) {
        self.checkIndexPlayer = 1
        lblBarName.text = "Assists"
        getPlayerDataFromSever(arrAssists[checkLeaguePlayer])
    }
    
    @IBAction func btn_KeyPasses(_ sender: Any) {
        self.checkIndexPlayer = 2
        lblBarName.text = "Key Passes"
        getPlayerDataFromSever(arrKeyPasses[checkLeaguePlayer])
    }
    
    @IBAction func btn_Shots(_ sender: Any) {
        self.checkIndexPlayer = 3
        lblBarName.text = "Shots"
        getPlayerDataFromSever(arrShot[checkLeaguePlayer])
    }
    
    @IBAction func btn_Passes(_ sender: Any) {
        self.checkIndexPlayer = 4
        lblBarName.text = "Passes"
        getPlayerDataFromSever(arrPasese[checkLeaguePlayer])
    }
    
    @IBAction func btn_Fouls(_ sender: Any) {
        self.checkIndexPlayer = 5
        lblBarName.text = "Fouls"
        getPlayerDataFromSever(arrFouls[checkLeaguePlayer])
    }
    
    
}

extension PlayerViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return playerData.contentplayer?.dataplayer.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:PlayerTVC = tableView.dequeueReusableCell(withIdentifier: "PlayerTVC") as! PlayerTVC
        cell.backgroundColor = .white
        cell.lblRank.text = playerData.contentplayer?.dataplayer[indexPath.row].rank
        cell.lblName.text = playerData.contentplayer?.dataplayer[indexPath.row].person_name
        cell.lblTeamName.text = playerData.contentplayer?.dataplayer[indexPath.row].team_name
        cell.lblCount.text = playerData.contentplayer?.dataplayer[indexPath.row].count
        cell.imgPersonLogo.getImageFromURL(playerData.contentplayer?.dataplayer[indexPath.row].person_logo ?? "")
        cell.imgTeamLogo.getImageFromURL(playerData.contentplayer?.dataplayer[indexPath.row].team_logo ?? "")
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    
}
