//
//  ListMatchModel.swift
//  FootballTV
//
//  Created by nguyenhuyson2 on 11/24/20.
//  Copyright © 2020 Nguyen Anh Dao. All rights reserved.
//

import Foundation
class ListMatchModel: NSObject {
    var team_A_id: String = ""
    var team_A_logo: String = ""
    var team_A_name: String = ""
    var team_B_id: String = ""
    var team_B_logo: String = ""
    var team_B_name: String = ""
    var date_utc: String = ""
    var period: String = ""
    var start_play: String = ""
    var fs_A: String = ""
    var fs_B: String = ""
    var competition_name: String = ""
    var round: String = ""
    var competition_bk_logo: String = ""
    var events: [EventMatchModel] = [EventMatchModel]()
  
    
    init(_ json: [String: Any]) {
        
        if let temp = json["team_A_id"] as? String { team_A_id = temp }
        if let temp = json["team_A_logo"] as? String { team_A_logo = temp }
        if let temp = json["team_A_name"] as? String { team_A_name = temp }
        if let temp = json["team_B_id"] as? String { team_B_id = temp }
        if let temp = json["team_B_logo"] as? String { team_B_logo = temp }
        if let temp = json["team_B_name"] as? String { team_B_name = temp }
        if let temp = json["date_utc"] as? String { date_utc = temp }
        if let temp = json["period"] as? String { period = temp }
        if let temp = json["start_play"] as? String { start_play = temp }
        if let temp = json["fs_A"] as? String { fs_A = temp }
        if let temp = json["fs_B"] as? String { fs_B = temp }
        if let temp = json["competition_name"] as? String { competition_name = temp }
        if let temp = json["round"] as? String { round = temp }
        if let temp = json["competition_bk_logo"] as? String { competition_bk_logo = temp }
        if let temp = json["events"] as? [[String: Any]] {
            for item in temp {
                let itemAdd = EventMatchModel(item)
                events.append(itemAdd)
            }
        }
    }
}
