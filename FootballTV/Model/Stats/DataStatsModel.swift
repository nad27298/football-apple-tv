//
//  DataStatsModel.swift
//  FootballTV
//
//  Created by nguyenhuyson2 on 11/26/20.
//  Copyright © 2020 Nguyen Anh Dao. All rights reserved.
//

import Foundation
class DataStatsModel {
    var rank: String = ""
    var team_name: String = ""
    var team_logo: String = ""
    var matches_total: String = ""
    var matches_won: String = ""
    var matches_draw: String = ""
    var matches_lost: String = ""
    var goals_against: String = ""
    var goals_pro: String = ""
    var points: String = ""
    
    init(_ json: [String: Any]) {
        if let temp = json["rank"] as? String { rank = temp }
        if let temp = json["team_name"] as? String { team_name = temp }
        if let temp = json["team_logo"] as? String { team_logo = temp }
        if let temp = json["matches_total"] as? String { matches_total = temp }
        if let temp = json["matches_won"] as? String { matches_won = temp }
        if let temp = json["matches_draw"] as? String { matches_draw = temp }
        if let temp = json["matches_lost"] as? String { matches_lost = temp}
        if let temp = json["goals_against"] as? String { goals_against = temp }
        if let temp = json["goals_pro"] as? String { goals_pro = temp }
        if let temp = json["points"] as? String { points = temp }
    }
    
}
