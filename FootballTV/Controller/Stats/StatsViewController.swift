//
//  StatsViewController.swift
//  FootballTV
//
//  Created by nguyenhuyson2 on 11/26/20.
//  Copyright © 2020 Nguyen Anh Dao. All rights reserved.
//

import UIKit
import Alamofire
import Kingfisher

class StatsViewController: UIViewController {
    @IBOutlet weak var viewBar: UIView!
    @IBOutlet weak var viewStt: UIView!
    @IBOutlet weak var tblViewStats: UITableView!
    @IBOutlet weak var lblBarTitle: UILabel!
    @IBOutlet weak var lblBarName: UILabel!
    @IBOutlet weak var btnTable: UIButton!
    @IBOutlet weak var imgLogo: UIImageView!
    var tableData: TableStatsModel = TableStatsModel(["":""])
    
    var checkLeagueTable: Int = 0
    var checkIndexTable: Int = 0
    
    var arrTable: [String] = ["http://sport-data.allfootballapp.com/soccer/biz/data/standing?season_id=17139&app=af&version=337&platform=ios", "http://sport-data.allfootballapp.com/soccer/biz/data/standing?season_id=17133&app=af&version=337&platform=ios", "http://sport-data.allfootballapp.com/soccer/biz/data/standing?season_id=17179&app=af&version=337&platform=ios", "http://sport-data.allfootballapp.com/soccer/biz/data/standing?season_id=17051&app=af&version=337&platform=ios", "http://sport-data.allfootballapp.com/soccer/biz/data/standing?season_id=16786&app=af&version=337&platform=ios"]
   
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(viewBar)
        view.addSubview(viewStt)
        tblViewStats.delegate = self
        tblViewStats.dataSource  = self
        tblViewStats.register(UINib(nibName: "StatsTVC", bundle: nil), forCellReuseIdentifier: "StatsTVC")
        lblBarTitle.layer.cornerRadius = 20
        lblBarTitle.layer.masksToBounds = true
        lblBarName.layer.cornerRadius = 20
        lblBarName.layer.masksToBounds = true
        let imageLogo = UserDefaults.standard.string(forKey: "IMG_LOGO") ?? ""
        imgLogo.getImageFromURL(imageLogo)
        lblBarName.text = "Table"
        getTableDataFromSever(arrTable[checkLeagueTable])
        switch checkIndexTable {
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
            lblBarTitle.text = "Bundesliga BK"
            loadScreenImage("Bundesliga BK")
        case 4:
            lblBarTitle.text = "Ligue 1"
            loadScreenImage("Ligue 1 BK")
        default:
            lblBarTitle.text = ""
        }
    }
    
    
    func getTableDataFromSever(_ url: String) {
        Alamofire.request(url).responseJSON { (responds) in
            if let respondsValue = responds.result.value as? [String: Any] {
                let returnJSON:TableStatsModel = TableStatsModel.init(respondsValue)
                self.tableData = returnJSON
                self.tblViewStats.reloadData()
            }
        }
    }
    
    func loadScreenImage(_ imgScreen: String) {
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: imgScreen)!)
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
    
    @IBAction func btn_EPL(_ sender: Any) {
        self.checkLeagueTable = 0
        lblBarTitle.text = "EPL"
        loadScreenImage("EPL BK")
        getTableDataFromSever(arrTable[0])
    }
    
    @IBAction func btn_LaLiga(_ sender: Any) {
        self.checkLeagueTable = 1
        loadScreenImage("La Liga BK")
        lblBarTitle.text = "La Liga"
        getTableDataFromSever(arrTable[1])
    }
    
    @IBAction func btn_SerieA(_ sender: Any) {
        self.checkLeagueTable = 2
        loadScreenImage("Serie A BK")
        lblBarTitle.text = "Serie A"
        getTableDataFromSever(arrTable[2])
    }
    
    @IBAction func btn_Bundesliga(_ sender: Any) {
        self.checkLeagueTable = 3
        loadScreenImage("Bundesliga BK")
        lblBarTitle.text = "Bundesliga"
        getTableDataFromSever(arrTable[3])
    }
    
    @IBAction func btn_Ligue1(_ sender: Any) {
        self.checkLeagueTable = 4
        loadScreenImage("Ligue 1 BK")
        lblBarTitle.text = "Ligue 1"
        getTableDataFromSever(arrTable[4])
    }
    
    @IBAction func btn_Table(_ sender: Any) {
    }
    
    func getLoadScreenPlayer(_ int: Int) {
        self.checkIndexTable = int
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let player:PlayerViewController = storyboard.instantiateViewController(withIdentifier: "Player") as! PlayerViewController
        player.checkLeaguePlayer = checkLeagueTable
        player.checkIndexPlayer = checkIndexTable
        self.present(player, animated: false)
    }
    
    @IBAction func btn_Goals(_ sender: Any) {
        getLoadScreenPlayer(0)
    }
    
    @IBAction func btn_Assists(_ sender: Any) {
        getLoadScreenPlayer(1)
    }
    
    @IBAction func btn_KeyPasses(_ sender: Any) {
        getLoadScreenPlayer(2)
    }
    
    @IBAction func btn_Shots(_ sender: Any) {
        getLoadScreenPlayer(3)
    }
    
    @IBAction func btn_Passes(_ sender: Any) {
        getLoadScreenPlayer(4)
    }
    
    @IBAction func btn_Fouls(_ sender: Any) {
        getLoadScreenPlayer(5)
    }
    
    
}

extension StatsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return tableData.contentall?.rounds.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.contentall?.rounds[section].content?.data.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:StatsTVC = tableView.dequeueReusableCell(withIdentifier: "StatsTVC") as! StatsTVC
        cell.backgroundColor = .white
        cell.lblRank.text = tableData.contentall?.rounds[indexPath.section].content?.data[indexPath.row].rank
        cell.lblName.text = tableData.contentall?.rounds[indexPath.section].content?.data[indexPath.row].team_name
        cell.lblTotal.text = tableData.contentall?.rounds[indexPath.section].content?.data[indexPath.row].matches_total
        cell.lblWin.text = tableData.contentall?.rounds[indexPath.section].content?.data[indexPath.row].matches_won
        cell.lblDraw.text = tableData.contentall?.rounds[indexPath.section].content?.data[indexPath.row].matches_draw
        cell.lblLost.text = tableData.contentall?.rounds[indexPath.section].content?.data[indexPath.row].matches_lost
        cell.lblPts.text = tableData.contentall?.rounds[indexPath.section].content?.data[indexPath.row].points
        cell.lblPA.text = (tableData.contentall?.rounds[indexPath.section].content?.data[indexPath.row].goals_pro ?? "") + "/" + (tableData.contentall?.rounds[indexPath.section].content?.data[indexPath.row].goals_against ?? "")
        cell.imgLogo.getImageFromURL(tableData.contentall?.rounds[indexPath.section].content?.data[indexPath.row].team_logo ?? "")
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
}
