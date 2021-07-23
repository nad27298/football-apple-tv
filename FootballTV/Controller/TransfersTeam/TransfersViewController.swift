//
//  TransfersViewController.swift
//  FootballTV
//
//  Created by nguyenhuyson2 on 11/18/20.
//  Copyright © 2020 Nguyen Anh Dao. All rights reserved.
//

import UIKit
import Alamofire
import Kingfisher


class TransfersViewController: UIViewController {
    
    @IBOutlet weak var collectionTransfers: UICollectionView!
    @IBOutlet weak var lblLast: UILabel!
    @IBOutlet weak var lblTop: UILabel!
    @IBOutlet weak var lblRumours: UILabel!
    @IBOutlet weak var imgLogo: UIImageView!
    
    var lastestData: LastestModel = LastestModel(["":""])
    var topData: TopModel = TopModel(["":""])
    
    var checkLoadData:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionTransfers.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        collectionTransfers.dataSource = self
        collectionTransfers.delegate = self
        collectionTransfers.register(UINib(nibName: "TransfersVC", bundle: nil), forCellWithReuseIdentifier: "TransfersVC")
        if self.checkLoadData == 0 {
            getDataLastestFromSever()
            lblLast.isHidden = false
            lblTop.isHidden = true
            lblRumours.isHidden = true
        } else {
            getDataTopFromSever()
            lblLast.isHidden = true
            lblTop.isHidden = false
            lblRumours.isHidden = true
        }
        let imageLogo = UserDefaults.standard.string(forKey: "IMG_LOGO") ?? ""
        imgLogo.getImageFromURL(imageLogo)
    }
    
    func getDataLastestFromSever() {
        Alamofire.request("http://n.allfootballapp.com/api/data/v1/transfer?type=latest&language=en").responseJSON { (response) in
            if let responseValue = response.result.value as? [String:Any]  {
                let returnJSON:LastestModel = LastestModel.init(responseValue)
                self.lastestData = returnJSON
                self.collectionTransfers.reloadData()
            }
        }
    }
    
    func getDataTopFromSever() {
        Alamofire.request("http://n.allfootballapp.com/api/data/v1/transfer?type=top&language=en").responseJSON { (response) in
            if let responseValue = response.result.value as? [String:Any]  {
                let returnJSON:TopModel = TopModel.init(responseValue)
                self.topData = returnJSON
                self.collectionTransfers.reloadData()
            }
        }
    }
    
    @IBAction func btn_Logo(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let pick:PickViewController = storyboard.instantiateViewController(withIdentifier: "Pick") as! PickViewController
        self.present(pick, animated: true)
    }
    
    @IBAction func btn_News(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "News") as! NewsViewController
        self.present(storyboard, animated: true)
    }
    
    @IBAction func btn_Match(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let match:MatchViewController = storyboard.instantiateViewController(withIdentifier: "Match") as! MatchViewController
        self.present(match, animated: true)
    }
    
    @IBAction func btn_Stats(_ sender: Any) {
        let stotryboard = UIStoryboard(name: "Main", bundle: nil)
        let stats:StatsViewController = stotryboard.instantiateViewController(withIdentifier: "StatsView") as! StatsViewController
        self.present(stats, animated: true)
    }
    
    @IBAction func btn_Video(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Video") as! VideoViewController
        self.present(storyboard, animated: true)
    }
    
    @IBAction func btn_Last(_ sender: Any) {
        self.checkLoadData = 0
        getDataLastestFromSever()
        lblLast.isHidden = false
        lblTop.isHidden = true
        lblRumours.isHidden = true
    }
    
    @IBAction func btn_Top(_ sender: Any) {
        self.checkLoadData = 1
        getDataTopFromSever()
        lblTop.isHidden = false
        lblLast.isHidden = true
        lblRumours.isHidden = true
    }
    
    @IBAction func btn_Rumours(_ sender: Any) {
        lblRumours.isHidden = false
        lblTop.isHidden = true
        lblLast.isHidden = true
    }
    
}

extension TransfersViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        if checkLoadData == 0 {
            return 1
        } else if checkLoadData == 1 {
            return 1
        } else {
            return 0
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if checkLoadData == 0 {
            return lastestData.data.count
        } else if checkLoadData == 1 {
            return topData.data.count
        } else {
            return 0
        }
    }
    
    func getLoadCollectionView(_ rank: Bool,_ textRank: String,_ textName: String,_ textFromClub: String,_ textToClub: String,_ textPrice:String,_ textAge: String,_ textPosition: String,_ imgURL1: String,_ imgURL2: String,_ imgURL3: String,_ imgURL4: String,_ indexPath: IndexPath) -> UICollectionViewCell {
        let cell:TransfersVC = collectionTransfers.dequeueReusableCell(withReuseIdentifier: "TransfersVC", for: indexPath) as! TransfersVC
        cell.lblRank.isHidden = rank
        cell.lblRank.text = textRank
        cell.lblName.text = textName
        cell.lblFromClub.text = textFromClub
        cell.lblToClub.text = textToClub
        cell.lblPrice.text = textPrice
        cell.lblAge.text = "Age " + textAge + " / " + textPosition
        cell.imgName.getImageFromURL(imgURL1)
        cell.imgFromClub.getImageFromURL(imgURL2)
        cell.imgToClub.getImageFromURL(imgURL3)
        cell.imgCoutry.getImageFromURL(imgURL4)
        return cell
    }
    
        
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:UICollectionViewCell? = nil
        if checkLoadData == 0 {
            let textRank = "\(indexPath.row + 1)"
            let textName = lastestData.data[indexPath.row].person?.name ?? ""
            let textFromClub = lastestData.data[indexPath.row].fromteam?.name ?? ""
            let textToClub = lastestData.data[indexPath.row].toteam?.name ?? ""
            let textPrice = lastestData.data[indexPath.row].money
            let textAge = lastestData.data[indexPath.row].person?.age ?? ""
            let textPosition = lastestData.data[indexPath.row].person?.position ?? ""
            let imgURL1 = lastestData.data[indexPath.row].person?.logo ?? ""
            let imgURL2 = lastestData.data[indexPath.row].fromteam?.logo ?? ""
            let imgURL3 = lastestData.data[indexPath.row].toteam?.logo ?? ""
            let imgURL4 = (lastestData.data[indexPath.row].person?.nationality?.logo ?? "")
            return getLoadCollectionView(true, textRank, textName, textFromClub, textToClub, textPrice, textAge, textPosition, imgURL1, imgURL2, imgURL3, imgURL4, indexPath)
        } else if checkLoadData == 1 {
            let textRank = "\(indexPath.row + 1)"
            let textName = topData.data[indexPath.row].person?.name ?? ""
            let textFromClub = topData.data[indexPath.row].fromteam?.name ?? ""
            let textToClub = topData.data[indexPath.row].toteam?.name ?? ""
            let textPrice = topData.data[indexPath.row].money
            let textAge = topData.data[indexPath.row].person?.age ?? ""
            let textPosition = topData.data[indexPath.row].person?.position ?? ""
            let imgURL1 = topData.data[indexPath.row].person?.logo ?? ""
            let imgURL2 = topData.data[indexPath.row].fromteam?.logo ?? ""
            let imgURL3 = topData.data[indexPath.row].toteam?.logo ?? ""
            let imgURL4 = (topData.data[indexPath.row].person?.nationality?.logo ?? "")
            return getLoadCollectionView(false, textRank, textName, textFromClub, textToClub, textPrice, textAge, textPosition, imgURL1, imgURL2, imgURL3, imgURL4, indexPath)
        } else {
            return cell!
        }
        
    }
    
    override func didUpdateFocus(in context: UIFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
        if let cell = context.nextFocusedView as? UICollectionViewCell {
            coordinator.addCoordinatedAnimations({ () -> Void in
                cell.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
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

extension TransfersViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 830, height: 238)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 30, left: 100, bottom: 30, right: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
