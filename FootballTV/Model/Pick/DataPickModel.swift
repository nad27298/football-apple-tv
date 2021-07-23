//
//  DataPickModel.swift
//  FootballTV
//
//  Created by nguyenhuyson2 on 11/20/20.
//  Copyright © 2020 Nguyen Anh Dao. All rights reserved.
//

import Foundation
class DataPickModel {
    var rank: String = ""
    var team_id: String = ""
    var team_logo: String = ""
    var team_name: String = ""
    
    init(_ json: [String: Any]) {
        if let temp = json["rank"] as? String { rank = temp }
        if let temp = json["team_id"] as? String { team_id = temp }
        if let temp = json["team_logo"] as? String { team_logo = temp }
        if let temp = json["team_name"] as? String { team_name = temp }
    }

}
