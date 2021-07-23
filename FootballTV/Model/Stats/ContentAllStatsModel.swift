//
//  ContentAllStatsModel.swift
//  FootballTV
//
//  Created by nguyenhuyson2 on 11/26/20.
//  Copyright © 2020 Nguyen Anh Dao. All rights reserved.
//

import Foundation
class ContentAllStatsModel {
    var description: String = ""
    var rounds: [RoundsStatsModel] = [RoundsStatsModel]()
    init(_ json: [String: Any]) {
        if let temp = json["description"] as? String { description = temp }
        if let temp = json["rounds"] as? [[String: Any]] {
            for item in temp {
                let itemAdd = RoundsStatsModel(item)
                rounds.append(itemAdd)
            }
        }
    }
}
