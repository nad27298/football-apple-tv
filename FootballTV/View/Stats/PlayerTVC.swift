//
//  PlayerTVC.swift
//  FootballTV
//
//  Created by nguyenhuyson2 on 11/27/20.
//  Copyright © 2020 Nguyen Anh Dao. All rights reserved.
//

import UIKit

class PlayerTVC: UITableViewCell {
    @IBOutlet weak var lblRank: UILabel!
    @IBOutlet weak var imgPersonLogo: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var imgTeamLogo: UIImageView!
    @IBOutlet weak var lblTeamName: UILabel!
    @IBOutlet weak var lblCount: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
