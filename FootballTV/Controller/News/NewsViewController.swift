//
//  NewsViewController.swift
//  FootballTV
//
//  Created by nguyenhuyson2 on 11/9/20.
//  Copyright © 2020 Nguyen Anh Dao. All rights reserved.
//

import UIKit
import Kingfisher
import Alamofire

class NewsViewController: UIViewController {
    
    @IBOutlet weak var collectionV1: UICollectionView!
    @IBOutlet weak var buttonHeadLine: UIButton!
    @IBOutlet weak var lblBarTitle: UILabel!
    @IBOutlet weak var lblBarTime: UILabel!
    @IBOutlet weak var btnLast: UIButton!
    @IBOutlet weak var btnTop: UIButton!
    @IBOutlet weak var btnRumours: UIButton!
    @IBOutlet weak var imgNews: UIImageView!
    @IBOutlet weak var imgLogo: UIImageView!
    
    var headlineData:HeadlineModel = HeadlineModel(["":""])
    var hotData: HotModel = HotModel(["":""])
    var officiaData: OfficialModel = OfficialModel(["":""])
    var transfersData:TransfersModel = TransfersModel(["":""])
    var laligaData: LaLigaModel = LaLigaModel(["":""])
    var fifaData: FIFAModel = FIFAModel(["":""])
    var bundesligaData: BundesligaModel = BundesligaModel(["":""])
    var seriaData: SeriAModel = SeriAModel(["":""])
    var bettingData: BettingModel = BettingModel(["":""])
    var eplData: EPLModel = EPLModel(["":""])
    var europeData:EuropeModel = EuropeModel(["":""])
    var depthData: DepthModel = DepthModel(["":""])

    var checkLoadData:Int = 0
    
    var test: String = ""
        
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionV1.delegate = self
        collectionV1.dataSource = self
        collectionV1.register(UINib(nibName: "CollectionVC1", bundle: nil), forCellWithReuseIdentifier: "CollectionVC1")
        getDataHeadlineFromSever()
        lblBarTitle.layer.cornerRadius = 20
        lblBarTitle.layer.masksToBounds = true
        timeStampUpdate()
        getNewsLabel("Headline", true, true, true, false)
        let imageLogo = UserDefaults.standard.string(forKey: "IMG_LOGO") ?? ""
        imgLogo.getImageFromURL(imageLogo)
        print(test)
    }
    
    func getDataHeadlineFromSever() {
        Alamofire.request("http://api.allfootballapp.com/app/tabs/iphone/1.json?countryCode=VN&platform=iphone&version=337&uuid_id=0").responseJSON { (response) in
            if let responseValue = response.result.value as? [String:Any]  {
                let returnJSON:HeadlineModel = HeadlineModel.init(responseValue)
                self.headlineData = returnJSON
                self.collectionV1.reloadData()
            }
        }
    }
    func getDataHotFromSever() {
        Alamofire.request("http://api.allfootballapp.com/app/tabs/iphone/106.json?hot=1&countryCode=VN&platform=iphone&version=337").responseJSON { (response) in
            if let responseValue = response.result.value as? [String:Any]  {
                let returnJSON:HotModel = HotModel.init(responseValue)
                self.hotData = returnJSON
                self.collectionV1.reloadData()
            }
        }
    }
    func getDataOfficialFromSever() {
        Alamofire.request("http://api.allfootballapp.com/app/tabs/iphone/116.json?countryCode=VN&platform=iphone&version=337").responseJSON { (response) in
            if let responseValue = response.result.value as? [String:Any]  {
                let returnJSON:OfficialModel = OfficialModel.init(responseValue)
                self.officiaData = returnJSON
                self.collectionV1.reloadData()
            }
        }
    }
    func getDataTransfersFromSever() {
        Alamofire.request("http://api.allfootballapp.com/app/tabs/iphone/2.json?countryCode=VN&platform=iphone&version=337").responseJSON { (response) in
            if let responseValue = response.result.value as? [String:Any]  {
                let returnJSON:TransfersModel = TransfersModel.init(responseValue)
                self.transfersData = returnJSON
                self.collectionV1.reloadData()
            }
        }
    }
    func getDataLaLigaFromSever() {
        Alamofire.request("http://api.allfootballapp.com/app/tabs/iphone/5.json?countryCode=VN&platform=iphone&version=337").responseJSON { (response) in
            if let responseValue = response.result.value as? [String:Any]  {
                let returnJSON:LaLigaModel = LaLigaModel.init(responseValue)
                self.laligaData = returnJSON
                self.collectionV1.reloadData()
            }
        }
    }
    func getDataFIFAFromSever() {
        Alamofire.request("http://api.allfootballapp.com/app/tabs/iphone/111.json?countryCode=VN&platform=iphone&version=337").responseJSON { (response) in
            if let responseValue = response.result.value as? [String:Any]  {
                let returnJSON:FIFAModel = FIFAModel.init(responseValue)
                self.fifaData = returnJSON
                self.collectionV1.reloadData()
            }
        }
    }
    func getDataBundesligaFromSever() {
        Alamofire.request("http://api.allfootballapp.com/app/tabs/iphone/6.json?countryCode=VN&platform=iphone&version=337").responseJSON { (response) in
            if let responseValue = response.result.value as? [String:Any]  {
                let returnJSON:BundesligaModel = BundesligaModel.init(responseValue)
                self.bundesligaData = returnJSON
                self.collectionV1.reloadData()
            }
        }
    }
    func getDataSeriAFromSever() {
        Alamofire.request("http://api.allfootballapp.com/app/tabs/iphone/7.json?countryCode=VN&platform=iphone&version=337").responseJSON { (response) in
            if let responseValue = response.result.value as? [String:Any]  {
                let returnJSON:SeriAModel = SeriAModel.init(responseValue)
                self.seriaData = returnJSON
                self.collectionV1.reloadData()
            }
        }
    }
    func getDataBettingFromSever() {
        Alamofire.request("http://api.allfootballapp.com/app/tabs/iphone/113.json?countryCode=VN&platform=iphone&version=337").responseJSON { (response) in
            if let responseValue = response.result.value as? [String:Any]  {
                let returnJSON:BettingModel = BettingModel.init(responseValue)
                self.bettingData = returnJSON
                self.collectionV1.reloadData()
            }
        }
    }
    func getDataEPLFromSever() {
        Alamofire.request("http://api.allfootballapp.com/app/tabs/iphone/4.json?countryCode=VN&platform=iphone&version=337").responseJSON { (response) in
            if let responseValue = response.result.value as? [String:Any]  {
                let returnJSON:EPLModel = EPLModel.init(responseValue)
                self.eplData = returnJSON
                self.collectionV1.reloadData()
            }
        }
    }
    func getDataEuropeFromSever() {
        Alamofire.request("http://api.allfootballapp.com/app/tabs/iphone/15.json?countryCode=VN&platform=iphone&version=337").responseJSON { (response) in
            if let responseValue = response.result.value as? [String:Any]  {
                let returnJSON:EuropeModel = EuropeModel.init(responseValue)
                self.europeData = returnJSON
                self.collectionV1.reloadData()
            }
        }
    }
    func getDataDepthFromSever() {
        Alamofire.request("http://api.allfootballapp.com/app/tabs/iphone/3.json?countryCode=VN&platform=iphone&version=337").responseJSON { (response) in
            if let responseValue = response.result.value as? [String:Any]  {
                let returnJSON:DepthModel = DepthModel.init(responseValue)
                self.depthData = returnJSON
                self.collectionV1.reloadData()
            }
        }
    }
    
    
    
    @IBAction func btn_Last(_ sender: Any) {
        let stotyboard = UIStoryboard(name: "Main", bundle: nil)
        let transfers:TransfersViewController = stotyboard.instantiateViewController(withIdentifier: "Transfers") as! TransfersViewController
        transfers.checkLoadData = 0
        transfers.getDataLastestFromSever()
        self.present(transfers, animated: true)
    }
    
    @IBAction func btn_Top(_ sender: Any) {
        let stotyboard = UIStoryboard(name: "Main", bundle: nil)
        let transfers:TransfersViewController = stotyboard.instantiateViewController(withIdentifier: "Transfers") as! TransfersViewController
        transfers.checkLoadData = 1
        transfers.getDataTopFromSever()
        self.present(transfers, animated: true)
    }
    
    @IBAction func btn_Rumours(_ sender: Any) {
    }
    
    @IBAction func btn_Logo(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let pick:PickViewController = storyboard.instantiateViewController(withIdentifier: "Pick") as! PickViewController
        self.present(pick, animated: true)
    }
    
    @IBAction func btn_News(_ sender: Any) {
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
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let video:VideoViewController = storyboard.instantiateViewController(withIdentifier: "Video") as! VideoViewController
        self.present(video, animated: true)
    }
    
    func timeStampUpdate() {
        let timeStamp = Date.currentTimeStamp
        let date = Date(timeIntervalSince1970: TimeInterval(timeStamp))
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(abbreviation: "GMT +7") //Set timezone that you want
        dateFormatter.locale = NSLocale.current
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm" //Specify your format that you want
        let strDate = dateFormatter.string(from: date)
        lblBarTime.text = "Last Update: " + strDate
    }
    
    func getNewsLabel(_ textTitle: String,_ lastest: Bool,_ top: Bool,_ rumours: Bool,_ img: Bool) {
        lblBarTitle.text = textTitle
        btnLast.isHidden = lastest
        btnTop.isHidden = top
        btnRumours.isHidden = rumours
        imgNews.isHidden = img
    }
    
    @IBAction func btnHeadline(_ sender: Any) {
        self.checkLoadData = 0
        getDataHeadlineFromSever()
        timeStampUpdate()
        getNewsLabel("Headline", true, true, true, false)
    }
    
    @IBAction func btnHot(_ sender: Any) {
        self.checkLoadData = 1
        self.getDataHotFromSever()
        timeStampUpdate()
        getNewsLabel("Hot", true, true, true, false)
    }
    
    @IBAction func btnOfficial(_ sender: Any) {
        self.checkLoadData = 2
        self.getDataOfficialFromSever()
        timeStampUpdate()
        getNewsLabel("Official", true, true, true, false)
    }
    
    @IBAction func btnTransfer(_ sender: Any) {
        self.checkLoadData = 3
        self.getDataTransfersFromSever()
        timeStampUpdate()
        getNewsLabel("Transfer", false, false, false, true)
    }
    
    @IBAction func btnLaliga(_ sender: Any) {
        self.checkLoadData = 4
        self.getDataLaLigaFromSever()
        timeStampUpdate()
        getNewsLabel("La Liga", true, true, true, false)
    }
    
    @IBAction func btnFifa(_ sender: Any) {
        self.checkLoadData = 5
        self.getDataFIFAFromSever()
        timeStampUpdate()
        getNewsLabel("FIFA 20", true, true, true, false)
    }
    
    @IBAction func btnBundesliga(_ sender: Any) {
        self.checkLoadData = 6
        self.getDataBundesligaFromSever()
        timeStampUpdate()
        getNewsLabel("Bundesliga", true, true, true, false)
    }
    
    @IBAction func btnSeriA(_ sender: Any) {
        self.checkLoadData = 7
        self.getDataSeriAFromSever()
        timeStampUpdate()
        getNewsLabel("Serie A", true, true, true, false)
    }
    
    @IBAction func btnBetting(_ sender: Any) {
        self.checkLoadData = 8
        self.getDataBettingFromSever()
        timeStampUpdate()
        getNewsLabel("Betting", true, true, true, false)
    }
    
    @IBAction func btnEPL(_ sender: Any) {
        self.checkLoadData = 9
        self.getDataEPLFromSever()
        timeStampUpdate()
        getNewsLabel("EPL", true, true, true, false)
    }
    
    @IBAction func btnEurope(_ sender: Any) {
        self.checkLoadData = 10
        self.getDataEuropeFromSever()
        timeStampUpdate()
        getNewsLabel("Europe", true, true, true, false)
    }
    
    @IBAction func btnDepth(_ sender: Any) {
        self.checkLoadData = 11
        self.getDataDepthFromSever()
        timeStampUpdate()
        getNewsLabel("Depth", true, true, true, false)
    }
    
}

extension NewsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        switch checkLoadData {
        case 1:
            return hotData.contents.count
        default:
            return 1
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch checkLoadData {
        case 0:
            return headlineData.articles.count
        case 1:
            return hotData.contents[section].articles.count
        case 2:
            return officiaData.articles.count
        case 3:
            return transfersData.articles.count
        case 4:
            return laligaData.articles.count
        case 5:
            return fifaData.articles.count
        case 6:
            return bundesligaData.articles.count
        case 7:
            return seriaData.articles.count
        case 8:
            return bettingData.articles.count
        case 9:
            return eplData.articles.count
        case 10:
            return europeData.articles.count
        case 11:
            return depthData.articles.count
        default:
            return 0
        }
    }
    
    func getLoadCollectionView(_ title: String,_ time: String?,_ comment: String,_ img: String,_ indexPath: IndexPath) -> UICollectionViewCell  {
        let cell:CollectionVC1 = collectionV1.dequeueReusableCell(withReuseIdentifier: "CollectionVC1", for: indexPath) as! CollectionVC1
        cell.lblTitle.text = title
        cell.lblTime.text = time
        cell.lblComment.text = "Comment: " + comment
        cell.imgHinh.getImageFromURL(img)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:UICollectionViewCell? = nil
        switch checkLoadData {
        case 0:
            let title = headlineData.articles[indexPath.row].title
            let time = headlineData.articles[indexPath.row].body?.published_time
            let comment = String(headlineData.articles[indexPath.row].comments_total)
            let img = headlineData.articles[indexPath.row].thumb
            return getLoadCollectionView(title, time, comment, img, indexPath)
        case 1:
            let title = hotData.contents[indexPath.section].articles[indexPath.row].title
            let time = hotData.contents[indexPath.section].articles[indexPath.row].body?.published_time
            let comment = String(hotData.contents[indexPath.section].articles[indexPath.row].comments_total)
            let img = hotData.contents[indexPath.section].articles[indexPath.row].thumb
            return getLoadCollectionView(title, time, comment, img, indexPath)
        case 2:
            let title = officiaData.articles[indexPath.row].title
            let time = officiaData.articles[indexPath.row].body?.published_time
            let comment = String(officiaData.articles[indexPath.row].comments_total)
            let img = officiaData.articles[indexPath.row].thumb
            return getLoadCollectionView(title, time, comment, img, indexPath)
        case 3:
            let title = transfersData.articles[indexPath.row].title
            let time = transfersData.articles[indexPath.row].body?.published_time
            let comment = String(transfersData.articles[indexPath.row].comments_total)
            let img = transfersData.articles[indexPath.row].thumb
            return getLoadCollectionView(title, time, comment, img, indexPath)
        case 4:
            let title = laligaData.articles[indexPath.row].title
            let time = laligaData.articles[indexPath.row].body?.published_time
            let comment = String(laligaData.articles[indexPath.row].comments_total)
            let img = laligaData.articles[indexPath.row].thumb
            return getLoadCollectionView(title, time, comment, img, indexPath)
        case 5:
            let title = fifaData.articles[indexPath.row].title
            let time = fifaData.articles[indexPath.row].body?.published_time
            let comment = String(fifaData.articles[indexPath.row].comments_total)
            let img = fifaData.articles[indexPath.row].thumb
            return getLoadCollectionView(title, time, comment, img, indexPath)
        case 6:
            let title = bundesligaData.articles[indexPath.row].title
            let time = bundesligaData.articles[indexPath.row].body?.published_time
            let comment = String(bundesligaData.articles[indexPath.row].comments_total)
            let img = bundesligaData.articles[indexPath.row].thumb
            return getLoadCollectionView(title, time, comment, img, indexPath)
        case 7:
            let title = seriaData.articles[indexPath.row].title
            let time = seriaData.articles[indexPath.row].body?.published_time
            let comment = String(seriaData.articles[indexPath.row].comments_total)
            let img = seriaData.articles[indexPath.row].thumb
            return getLoadCollectionView(title, time, comment, img, indexPath)
        case 8:
            let title = bettingData.articles[indexPath.row].title
            let time = bettingData.articles[indexPath.row].body?.published_time
            let comment = String(bettingData.articles[indexPath.row].comments_total)
            let img = bettingData.articles[indexPath.row].thumb
            return getLoadCollectionView(title, time, comment, img, indexPath)
        case 9:
            let title = eplData.articles[indexPath.row].title
            let time = eplData.articles[indexPath.row].body?.published_time
            let comment = String(eplData.articles[indexPath.row].comments_total)
            let img = eplData.articles[indexPath.row].thumb
            return getLoadCollectionView(title, time, comment, img, indexPath)
        case 10:
            let title = europeData.articles[indexPath.row].title
            let time = europeData.articles[indexPath.row].body?.published_time
            let comment = String(europeData.articles[indexPath.row].comments_total)
            let img = europeData.articles[indexPath.row].thumb
            return getLoadCollectionView(title, time, comment, img, indexPath)
        case 11:
            let title = depthData.articles[indexPath.row].title
            let time = depthData.articles[indexPath.row].body?.published_time
            let comment = String(depthData.articles[indexPath.row].comments_total)
            let img = depthData.articles[indexPath.row].thumb
            return getLoadCollectionView(title, time, comment, img, indexPath)
        default:
            return cell!
        }
    }
    
    func getWebLoadHTML(imgURL: String, htmlBody: String?) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let web:WebViewController = storyboard.instantiateViewController(withIdentifier: "WebView") as! WebViewController
        let url = URL(string: imgURL)
        let data = try? Data(contentsOf: url!)
        web.imageView.image = UIImage(data: data!)
        let html = htmlBody
        let stringData = html!.data(using: String.Encoding.utf8, allowLossyConversion: true)
        let attributedString = try? NSAttributedString(
            data: stringData!,
            options: [.documentType: NSAttributedString.DocumentType.html],
            documentAttributes: nil)
        web.textView.attributedText = attributedString!
        self.present(web, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch checkLoadData {
        case 0:
            let imgURL = headlineData.articles[indexPath.row].slide_thumb
            let htmlBody = headlineData.articles[indexPath.row].body?.body
            getWebLoadHTML(imgURL: imgURL, htmlBody: htmlBody)
        case 1:
            let imgURL = hotData.contents[indexPath.section].articles[indexPath.row].slide_thumb
            let htmlBody = hotData.contents[indexPath.section].articles[indexPath.row].body?.body
            getWebLoadHTML(imgURL: imgURL, htmlBody: htmlBody)
        case 2:
            let imgURL = officiaData.articles[indexPath.row].slide_thumb
            let htmlBody = officiaData.articles[indexPath.row].body?.body
            getWebLoadHTML(imgURL: imgURL, htmlBody: htmlBody)
        case 3:
            let imgURL = transfersData.articles[indexPath.row].slide_thumb
            let htmlBody = transfersData.articles[indexPath.row].body?.body
            getWebLoadHTML(imgURL: imgURL, htmlBody: htmlBody)
        case 4:
            let imgURL = laligaData.articles[indexPath.row].slide_thumb
            let htmlBody = laligaData.articles[indexPath.row].body?.body
            getWebLoadHTML(imgURL: imgURL, htmlBody: htmlBody)
        case 5:
            let imgURL = fifaData.articles[indexPath.row].slide_thumb
            let htmlBody = fifaData.articles[indexPath.row].body?.body
            getWebLoadHTML(imgURL: imgURL, htmlBody: htmlBody)
        case 6:
            let imgURL = bundesligaData.articles[indexPath.row].slide_thumb
            let htmlBody = bundesligaData.articles[indexPath.row].body?.body
            getWebLoadHTML(imgURL: imgURL, htmlBody: htmlBody)
        case 7:
            let imgURL = seriaData.articles[indexPath.row].slide_thumb
            let htmlBody = seriaData.articles[indexPath.row].body?.body
            getWebLoadHTML(imgURL: imgURL, htmlBody: htmlBody)
        case 8:
            let imgURL = bettingData.articles[indexPath.row].slide_thumb
            let htmlBody = bettingData.articles[indexPath.row].body?.body
            getWebLoadHTML(imgURL: imgURL, htmlBody: htmlBody)
        case 9:
            let imgURL = eplData.articles[indexPath.row].slide_thumb
            let htmlBody = eplData.articles[indexPath.row].body?.body
            getWebLoadHTML(imgURL: imgURL, htmlBody: htmlBody)
        case 10:
            let imgURL = europeData.articles[indexPath.row].slide_thumb
            let htmlBody = europeData.articles[indexPath.row].body?.body
            getWebLoadHTML(imgURL: imgURL, htmlBody: htmlBody)
        case 11:
            let imgURL = depthData.articles[indexPath.row].slide_thumb
            let htmlBody = depthData.articles[indexPath.row].body?.body
            getWebLoadHTML(imgURL: imgURL, htmlBody: htmlBody)
        default:
            print("getWebLoadHTML Default")
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

extension NewsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 355, height: 340)
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




