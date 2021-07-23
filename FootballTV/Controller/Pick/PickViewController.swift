//
//  PickViewController.swift
//  FootballTV
//
//  Created by nguyenhuyson2 on 11/6/20.
//  Copyright © 2020 Nguyen Anh Dao. All rights reserved.
//

import UIKit
import Alamofire
import Kingfisher

class PickViewController: UIViewController, ClassPickDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var nameTour:Array<String> = ["National", "Premier League", "La Liga", "Bundesliga", "Seri A", "Ligue 1"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "PickTableViewCell", bundle: nil), forCellReuseIdentifier: "PickTableViewCell")
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "Frame 22")
        backgroundImage.contentMode = UIView.ContentMode.scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)
    }
    
}

extension PickViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return nameTour[section]
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        if let headerView = view as? UITableViewHeaderFooterView {
            headerView.textLabel?.textColor = .white
            headerView.textLabel?.font = UIFont(name: "Futura Medium", size: 35)
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return nameTour.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:PickTableViewCell = tableView.dequeueReusableCell(withIdentifier: "PickTableViewCell") as! PickTableViewCell
        cell.getDataAllPickFromSever(index: indexPath.section)
        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 240
    }
    
    
    func tableView(_ tableView: UITableView, canFocusRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    
    func backtoPickViewController() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let new:NewsViewController = storyboard.instantiateViewController(withIdentifier: "News") as! NewsViewController
        self.present(new, animated: true, completion: nil)
    }
    
    
}



