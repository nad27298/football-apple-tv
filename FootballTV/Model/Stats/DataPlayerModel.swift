//
//  DataPlayerModel.swift
//  FootballTV
//
//  Created by nguyenhuyson2 on 11/27/20.
//  Copyright © 2020 Nguyen Anh Dao. All rights reserved.
//

import Foundation
class DataPlayerModel {
    var count: String = ""
    var person_logo: String = ""
    var person_name: String = ""
    var rank: String = ""
    var team_logo: String = ""
    var team_name: String = ""
    
    init(_ json: [String: Any]) {
        if let temp = json["count"] as? String { count = temp }
        if let temp = json["person_logo"] as? String { person_logo = temp }
        if let temp = json["person_name"] as? String { person_name = temp }
        if let temp = json["rank"] as? String { rank = temp }
        if let temp = json["team_logo"] as? String { team_logo = temp }
        if let temp = json["team_name"] as? String { team_name = temp }
    }
}
