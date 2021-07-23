//
//  DataModel.swift
//  FootballTV
//
//  Created by nguyenhuyson2 on 11/19/20.
//  Copyright © 2020 Nguyen Anh Dao. All rights reserved.
//

import Foundation
class DataModel {
    var money: String = ""
    var date:String = ""
    var person:PersonModel?
    var toteam:ToTeamModel?
    var fromteam:FromTeamModel?
    init(_ json: [String: Any]) {
        if let temp = json["money"] as? String { money = temp }
        if let temp = json["date"] as? String { date = temp }
        if let temp = json["person"] as? [String: Any] {
            self.person = PersonModel(temp)
        }
        if let temp = json["to_team"] as? [String: Any] {
            self.toteam = ToTeamModel(temp)
        }
        if let temp = json["from_team"] as? [String: Any] {
            self.fromteam = FromTeamModel(temp)
        }
    }
}
