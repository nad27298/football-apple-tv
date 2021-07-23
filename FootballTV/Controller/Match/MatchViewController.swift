//
//  MatchViewController.swift
//  FootballTV
//
//  Created by nguyenhuyson2 on 11/24/20.
//  Copyright © 2020 Nguyen Anh Dao. All rights reserved.
//

import UIKit
import Alamofire
import Kingfisher

class MatchViewController: UIViewController {

    @IBOutlet weak var collectionViewMatch: UICollectionView!
    @IBOutlet weak var lblBarTitle: UILabel!
    @IBOutlet weak var lblBarTime: UILabel!
    @IBOutlet weak var imgBarLogo: UIImageView!
    @IBOutlet weak var imgLogo: UIImageView!
    
    var matchData:MatchModel = MatchModel(["":""])
    
    var arrLink: [String] = ["http://match.allfootballapp.com/app/oldMatchList/matchList?type=important&version=337&platform=iphone&language=en-VN", "http://match.allfootballapp.com/app/oldMatchList/matchList?type=global&version=337&platform=iphone&language=en-VN", "http://match.allfootballapp.com/app/oldMatchList/matchList?type=local&version=337&platform=iphone&language=en-VN", "http://match.allfootballapp.com/app/oldMatchList/leagueMatchList?cid=4&version=337&platform=iphone&language=en-VN", "http://match.allfootballapp.com/app/oldMatchList/leagueMatchList?cid=5&version=337&platform=iphone&language=en-VN", "http://match.allfootballapp.com/app/oldMatchList/leagueMatchList?cid=3&version=337&platform=iphone&language=en-VN", "http://match.allfootballapp.com/app/oldMatchList/leagueMatchList?cid=9&version=337&platform=iphone&language=en-VN", "http://match.allfootballapp.com/app/oldMatchList/leagueMatchList?cid=12&version=337&platform=iphone&language=en-VN"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let bgImage = UIImageView()
        bgImage.image = UIImage(named: "Rectangle 252")
        bgImage.contentMode = .scaleToFill
        self.collectionViewMatch.backgroundView = bgImage
        collectionViewMatch.delegate = self
        collectionViewMatch.dataSource = self
        collectionViewMatch.register(UINib(nibName: "MatchVC", bundle: nil), forCellWithReuseIdentifier: "MatchVC")
        lblBarTitle.layer.cornerRadius = 20
        lblBarTitle.layer.masksToBounds = true
        timeStampUpdate()
        getBarMatch("Main", "Main")
        getDataMatchFromSever(arrLink[0])
        let imageLogo = UserDefaults.standard.string(forKey: "IMG_LOGO") ?? ""
        imgLogo.getImageFromURL(imageLogo)
    }
    
    func timeStampUpdate() {
        let timeStamp = Date.currentTimeStamp
        let date = Date(timeIntervalSince1970: TimeInterval(timeStamp))
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(abbreviation: "GMT +7") //Set timezone that you want
        dateFormatter.locale = NSLocale.current
        dateFormatter.dateFormat = "HH:mm" //Specify your format that you want
        let strDate = dateFormatter.string(from: date)
        lblBarTime.text = "Last Update: " + strDate
    }
    
    func getBarMatch(_ textTitle: String,_ imgLogo: String) {
        lblBarTitle.text = textTitle
        imgBarLogo.image = UIImage(named: imgLogo)
    }
    
    func getDataMatchFromSever(_ url: String) {
        Alamofire.request(url).responseJSON { (responds) in
            if let responsValue = responds.result.value as? [String: Any] {
                let returnJSON:MatchModel = MatchModel.init(responsValue)
                self.matchData = returnJSON
                self.collectionViewMatch.reloadData()
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
    }
    
    @IBAction func btn_Stats(_ sender: Any) {
        let stotryboard = UIStoryboard(name: "Main", bundle: nil)
        let stats:StatsViewController = stotryboard.instantiateViewController(withIdentifier: "StatsView") as! StatsViewController
        self.present(stats, animated: true)
    }
    
    @IBAction func btn_Videos(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let video:VideoViewController = storyboard.instantiateViewController(withIdentifier: "Video") as! VideoViewController
        self.present(video, animated: true)
    }
    
    @IBAction func btn_Main(_ sender: Any) {
        timeStampUpdate()
        getBarMatch("Main", "Main")
        getDataMatchFromSever(arrLink[0])
    }
    
    @IBAction func btn_Global(_ sender: Any) {
        timeStampUpdate()
        getBarMatch("Global", "Global")
        getDataMatchFromSever(arrLink[1])
    }
    
    @IBAction func btn_Local(_ sender: Any) {
        timeStampUpdate()
        getBarMatch("Local", "Local")
        getDataMatchFromSever(arrLink[2])
    }
    
    @IBAction func btn_EPL(_ sender: Any) {
        timeStampUpdate()
        getBarMatch("EPL", "EPL")
        getDataMatchFromSever(arrLink[3])
    }
    
    @IBAction func btn_Bundesliga(_ sender: Any) {
        timeStampUpdate()
        getBarMatch("Bundesliga", "Bundesliga")
        getDataMatchFromSever(arrLink[4])
    }
    
    @IBAction func btn_LaLiga(_ sender: Any) {
        timeStampUpdate()
        getBarMatch("La Liga", "La Liga")
        getDataMatchFromSever(arrLink[5])
    }
    
    @IBAction func btn_SerieA(_ sender: Any) {
        timeStampUpdate()
        getBarMatch("Serie A", "Serie A")
        getDataMatchFromSever(arrLink[6])
    }
    
    @IBAction func btn_Ligue1(_ sender: Any) {
        timeStampUpdate()
        getBarMatch("Ligue 1", "Ligue 1")
        getDataMatchFromSever(arrLink[7])
    }
        
}

extension MatchViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return matchData.list.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:MatchVC = collectionView.dequeueReusableCell(withReuseIdentifier: "MatchVC", for: indexPath) as! MatchVC
        cell.lblRound.text = matchData.list[indexPath.row].round
        cell.lblTime.text = matchData.list[indexPath.row].start_play
        cell.lblNameA.text = matchData.list[indexPath.row].team_A_name
        cell.imgLogoA.getImageFromURL(matchData.list[indexPath.row].team_A_logo)
        cell.lblFTA.text = matchData.list[indexPath.row].fs_A
        cell.lblNameB.text = matchData.list[indexPath.row].team_B_name
        cell.imgLogoB.getImageFromURL(matchData.list[indexPath.row].team_B_logo)
        cell.lblFTB.text = matchData.list[indexPath.row].fs_B
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let matchweb:MatchWebViewController = storyboard.instantiateViewController(withIdentifier: "MatchWeb") as! MatchWebViewController
        matchweb.matchWebData = matchData.list[indexPath.row]
        self.present(matchweb, animated: true)
    }
    
    override func didUpdateFocus(in context: UIFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
        if let cell = context.nextFocusedView as? UICollectionViewCell {
            coordinator.addCoordinatedAnimations({ () -> Void in
                cell.transform = CGAffineTransform(scaleX: 1.05, y: 1.05)
                cell.layer.borderWidth = 1
                cell.layer.cornerRadius = 10
                cell.backgroundColor = .gray
            }, completion: nil)
        }
        if let cell = context.previouslyFocusedItem as? UICollectionViewCell {
            coordinator.addCoordinatedAnimations({ () -> Void in
                cell.transform = CGAffineTransform.identity
                cell.layer.borderWidth = 0
                cell.backgroundColor = .white
            }, completion: nil)
        }
    }
    
}

extension MatchViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 600, height: 170)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 30, left: 30, bottom: 30, right: 30)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}
