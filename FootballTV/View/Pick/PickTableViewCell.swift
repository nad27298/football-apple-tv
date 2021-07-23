//
//  PickTableViewCell.swift
//  FootballTV
//
//  Created by nguyenhuyson2 on 11/6/20.
//  Copyright © 2020 Nguyen Anh Dao. All rights reserved.
//

import UIKit
import Alamofire
import Kingfisher

protocol ClassPickDelegate: AnyObject {
    func backtoPickViewController()
}

class PickTableViewCell: UITableViewCell {
    
    @IBOutlet weak var collectionView: UICollectionView!
    weak var delegate: ClassPickDelegate?
    
    var allPickData: PickkAllModel = PickkAllModel(["":""])
    var pickDataIn: DataPickModel = DataPickModel(["":""])
    
    var arrLink: [String] = ["http://sport-data.allfootballapp.com/soccer/biz/data/team_ranking?app=af&version=337&platform=ios&type=goals&season_id=1800&language=vi-VN", "http://sport-data.allfootballapp.com/soccer/biz/data/team_ranking?app=af&version=337&platform=ios&type=goals&season_id=17139&language=vi-VN", "http://sport-data.allfootballapp.com/soccer/biz/data/team_ranking?app=af&version=337&platform=ios&type=goals&season_id=17133&language=en", "http://sport-data.allfootballapp.com/soccer/biz/data/team_ranking?app=af&version=337&platform=ios&type=goals&season_id=17051&language=vi-VN", "http://sport-data.allfootballapp.com/soccer/biz/data/team_ranking?app=af&version=337&platform=ios&type=goals&season_id=17179&language=vi-VN", "http://sport-data.allfootballapp.com/soccer/biz/data/team_ranking?app=af&version=337&platform=ios&type=goals&season_id=16786&language=vi-VN"]
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "PickCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "PickCollectionViewCell")
        collectionView.reloadData()
    }
    
    
    func getDataAllPickFromSever(index: Int) {
        Alamofire.request(arrLink[index]).responseJSON { (response) in
            if let responseValue = response.result.value as? [String:Any]  {
                let returnJSON:PickkAllModel = PickkAllModel.init(responseValue)
                self.allPickData = returnJSON
                self.collectionView.reloadData()
            }
        }
    }
    
}
extension PickTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return allPickData.content?.datapick.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:PickCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "PickCollectionViewCell", for: indexPath) as! PickCollectionViewCell
        cell.lblCollection.text = allPickData.content?.datapick[indexPath.row].team_name
        let url = allPickData.content!.datapick[indexPath.row].team_logo
        cell.imgCollection.getImageFromURL(url)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        UserDefaults.standard.set(allPickData.content!.datapick[indexPath.row].team_logo, forKey: "IMG_LOGO")
        delegate?.backtoPickViewController()
    }
    
    func collectionView(_ collectionView: UICollectionView, canFocusItemAt indexPath: IndexPath) -> Bool {
        return true
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
                cell.backgroundColor = .clear
            }, completion: nil)
        }
    }
    
}
extension PickTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 180, height: 180)
    }
    
    
}



