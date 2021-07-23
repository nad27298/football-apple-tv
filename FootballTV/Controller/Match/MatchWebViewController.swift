//
//  MatchWebViewController.swift
//  FootballTV
//
//  Created by nguyenhuyson2 on 11/25/20.
//  Copyright © 2020 Nguyen Anh Dao. All rights reserved.
//

import UIKit
import Alamofire
import Kingfisher

class MatchWebViewController: UIViewController {
    
    @IBOutlet weak var tableViewMatch: UITableView!
    @IBOutlet weak var lblNameLeague: UILabel!
    @IBOutlet weak var lblFTA: UILabel!
    @IBOutlet weak var imgLogoA: UIImageView!
    @IBOutlet weak var lblNameA: UILabel!
    @IBOutlet weak var lblFTB: UILabel!
    @IBOutlet weak var imgLogoB: UIImageView!
    @IBOutlet weak var lblNameB: UILabel!
    @IBOutlet weak var lblPeriod: UILabel!
    
    
    var matchWebData:ListMatchModel = ListMatchModel(["":""])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if matchWebData.competition_bk_logo == "" {
            let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
            backgroundImage.image = UIImage(named: "SanFootball")
            backgroundImage.contentMode = UIView.ContentMode.scaleAspectFill
            self.view.insertSubview(backgroundImage, at: 0)
        } else {
            let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
            backgroundImage.getImageFromURL(matchWebData.competition_bk_logo)
            backgroundImage.contentMode = UIView.ContentMode.scaleAspectFill
            self.view.insertSubview(backgroundImage, at: 0)
        }
        tableViewMatch.delegate = self
        tableViewMatch.dataSource = self
        tableViewMatch.register(UINib(nibName: "MatchTVC", bundle: nil), forCellReuseIdentifier: "MatchTVC")
        lblNameA.text = matchWebData.team_A_name
        lblNameB.text = matchWebData.team_B_name
        lblFTA.text = matchWebData.fs_A
        lblFTB.text = matchWebData.fs_B
        lblNameLeague.text = matchWebData.competition_name
        lblPeriod.text = matchWebData.period
        lblFTA.layer.cornerRadius = 35
        lblFTB.layer.cornerRadius = 35
        lblFTA.layer.masksToBounds = true
        lblFTB.layer.masksToBounds = true
        imgLogoA.getImageFromURL(matchWebData.team_A_logo)
        imgLogoB.getImageFromURL(matchWebData.team_B_logo)
    }

}

extension MatchWebViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return matchWebData.events.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:MatchTVC = tableView.dequeueReusableCell(withIdentifier: "MatchTVC") as! MatchTVC
        cell.backgroundColor = .white
        cell.lblName.text = matchWebData.events[indexPath.row].person_name
        cell.lblTime.text = matchWebData.events[indexPath.row].minute + "'"
        cell.imgHinh.getImageFromURL(matchWebData.events[indexPath.row].logo)
        if matchWebData.events[indexPath.row].team_id == matchWebData.team_A_id {
            cell.imgLogo.getImageFromURL(matchWebData.team_A_logo)
        } else if matchWebData.events[indexPath.row].team_id == matchWebData.team_B_id {
            cell.imgLogo.getImageFromURL(matchWebData.team_B_logo)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }



}


