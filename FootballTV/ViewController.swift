//
//  ViewController.swift
//  FootballTV
//
//  Created by MeoBeo on 11/5/20.
//  Copyright © 2020 Nguyen Anh Dao. All rights reserved.
//

import UIKit

extension Date {
    static var currentTimeStamp: Int64{
        return Int64(Date().timeIntervalSince1970)
    }
}

class ViewController: UIViewController {
    @IBOutlet weak var lblgioithieu: UILabel!
    @IBOutlet weak var btnSkip: UIButton!
    @IBOutlet weak var btnGet: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "Frame 21")
        backgroundImage.contentMode = UIView.ContentMode.scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)
    }
    
    @IBAction func btn_Get(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let pick:PickViewController = storyboard.instantiateViewController(withIdentifier: "Pick") as! PickViewController
        self.present(pick, animated: true)
    }
    @IBAction func btn_Skip(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let new:NewsViewController = storyboard.instantiateViewController(withIdentifier: "News") as! NewsViewController
        self.present(new, animated: true, completion: nil)
    }
    
}


