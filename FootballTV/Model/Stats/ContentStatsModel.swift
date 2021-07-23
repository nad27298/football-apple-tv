//
//  ContentStatsModel.swift
//  FootballTV
//
//  Created by nguyenhuyson2 on 11/26/20.
//  Copyright © 2020 Nguyen Anh Dao. All rights reserved.
//

import Foundation
class ContentStatsModel {
    var name: String = ""
    var data: [DataStatsModel] = [DataStatsModel]()
    
    init(_ json: [String: Any]) {
        if let temp = json["name"] as? String { name = temp }
        if let temp = json["data"] as? [[String: Any]] {
            for item in temp {
                let itemAdd = DataStatsModel(item)
                data.append(itemAdd)
            }
        }
    }
    
}
