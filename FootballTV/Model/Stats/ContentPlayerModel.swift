//
//  ContentPlayerModel.swift
//  FootballTV
//
//  Created by nguyenhuyson2 on 11/27/20.
//  Copyright © 2020 Nguyen Anh Dao. All rights reserved.
//

import Foundation
class ContentPlayerModel {
    var top: Int = 0
    var end: Int = 0
    var dataplayer: [DataPlayerModel] = [DataPlayerModel]()
    init(_ json: [String: Any]) {
        if let temp = json["top"] as? Int { top = temp }
        if let temp = json["end"] as? Int { end = temp }
        if let temp = json["data"] as? [[String: Any]] {
            for item in temp {
                let itemAdd = DataPlayerModel(item)
                dataplayer.append(itemAdd)
            }
        }
    }
}
