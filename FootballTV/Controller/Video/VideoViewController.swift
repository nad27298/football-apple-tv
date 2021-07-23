//
//  VideoViewController.swift
//  FootballTV
//
//  Created by nguyenhuyson on 11/17/20.
//  Copyright © 2020 Nguyen Anh Dao. All rights reserved.
//

import UIKit
import Alamofire
import Kingfisher
import AVKit

class VideoViewController: UIViewController {
    
    
    @IBOutlet weak var collectionViewVideo: UICollectionView!
    @IBOutlet weak var viewBlue: UIView!
    @IBOutlet weak var lblLabel: UILabel!
    @IBOutlet weak var btnAll: UIButton!
    @IBOutlet weak var btnHightlights: UIButton!
    @IBOutlet weak var imgLogo: UIImageView!
    
    var checkLoadData:Int = 0
    
    var videoAllData:VideoAllModel = VideoAllModel(["":""])
    var videoHightlighsData: VideoHightlightsModel = VideoHightlightsModel(["":""])

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(viewBlue)
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "Rectangle 234")
        backgroundImage.contentMode = UIView.ContentMode.scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)
        lblLabel.text = "ALL FOOTBALL"
        collectionViewVideo.delegate = self
        collectionViewVideo.dataSource = self
        collectionViewVideo.layer.cornerRadius = 20
        let imageLogo = UserDefaults.standard.string(forKey: "IMG_LOGO") ?? ""
        imgLogo.getImageFromURL(imageLogo)
        collectionViewVideo.register(UINib(nibName: "VideoCollectionVC", bundle: nil), forCellWithReuseIdentifier: "VideoCollectionVC")
        getDataAllFootballFromSever()

    }
    
    func getDataAllFootballFromSever() {
        Alamofire.request("http://api.allfootballapp.com/app/tabs/iphone/11.json&countryCode=VN").responseJSON { (response) in
            if let responseValue = response.result.value as? [String:Any]  {
                let returnJSON:VideoAllModel = VideoAllModel.init(responseValue)
                self.videoAllData = returnJSON
                self.collectionViewVideo.reloadData()
            }
        }
    }
    
    func getDataHightlightsFootballFromSever() {
        Alamofire.request("http://api.allfootballapp.com/app/tabs/iphone/12.json&countryCode=VN?language=en").responseJSON { (response) in
            if let responseValue = response.result.value as? [String:Any]  {
                let returnJSON:VideoHightlightsModel = VideoHightlightsModel.init(responseValue)
                self.videoHightlighsData = returnJSON
                self.collectionViewVideo.reloadData()
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
    
    @IBAction func btn_Video(_ sender: Any) {
    }
    
    @IBAction func btn_Stats(_ sender: Any) {
        let stotryboard = UIStoryboard(name: "Main", bundle: nil)
        let stats:StatsViewController = stotryboard.instantiateViewController(withIdentifier: "StatsView") as! StatsViewController
        self.present(stats, animated: true)
    }
    
    @IBAction func btn_All(_ sender: Any) {
        self.checkLoadData = 0
        lblLabel.text = "All Football"
        getDataAllFootballFromSever()
    }
    
    @IBAction func btn_Highlight(_ sender: Any) {
        self.checkLoadData = 1
        lblLabel.text = "Hightlights Football"
        getDataHightlightsFootballFromSever()
    }
 
     
}

extension VideoViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if checkLoadData == 0 {
            return videoAllData.articles.count
        } else if checkLoadData == 1 {
            return videoHightlighsData.articles.count
        } else {
            return 0
        }
    }
    
    func getLoadCollectionView(_ textTitle: String,_ videoImgURL: String,_ indexPath: IndexPath) -> UICollectionViewCell {
        let cell:VideoCollectionVC = collectionViewVideo.dequeueReusableCell(withReuseIdentifier: "VideoCollectionVC", for: indexPath) as! VideoCollectionVC
        cell.lblTitle.text = textTitle
        cell.imgHinh.getImageFromURL(videoImgURL)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:UICollectionViewCell? = nil
        if checkLoadData == 0 {
            let textTitle = videoAllData.articles[indexPath.row].title
            let videoImgURL = videoAllData.articles[indexPath.row].slide_thumb
            return getLoadCollectionView(textTitle, videoImgURL, indexPath)
        } else if checkLoadData == 1 {
            let textTitle = videoHightlighsData.articles[indexPath.row].title
            let videoImgURL = videoHightlighsData.articles[indexPath.row].slide_thumb
            return getLoadCollectionView(textTitle, videoImgURL, indexPath)
        } else {
            return cell!
        }
    }
    
    func getLoadLinkVideo(_ url: String) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let videoplayer:VideoPlayerViewController = storyboard.instantiateViewController(withIdentifier: "VideoPlayer") as! VideoPlayerViewController
        videoplayer.url = url
        self.present(videoplayer, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if checkLoadData == 0 {
            let url = videoAllData.articles[indexPath.row].real_video_info!.real_video_url
            getLoadLinkVideo(url)
        } else if checkLoadData == 1 {
            let url = videoHightlighsData.articles[indexPath.row].real_video_info!.real_video_url
            getLoadLinkVideo(url)
        }
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

extension VideoViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 550, height: 400)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

