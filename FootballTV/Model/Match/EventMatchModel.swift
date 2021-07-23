//
//  EventMatchModel.swift
//  FootballTV
//
//  Created by nguyenhuyson2 on 11/24/20.
//  Copyright © 2020 Nguyen Anh Dao. All rights reserved.
//

import Foundation
class EventMatchModel: NSObject {
    
    var team_id: String = ""
    var person_name: String = ""
    var logo: String = ""
    var minute: String = ""

    init(_ json: [String: Any]) {
       
        if let temp = json["team_id"] as? String { team_id = temp }
        if let temp = json["person_name"] as? String { person_name = temp }
        if let temp = json["logo"] as? String { logo = temp }
        if let temp = json["minute"] as? String { minute = temp }
        
    }
}
