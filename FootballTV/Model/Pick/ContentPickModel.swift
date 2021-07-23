//
//  ContentPickModel.swift
//  FootballTV
//
//  Created by nguyenhuyson2 on 11/20/20.
//  Copyright © 2020 Nguyen Anh Dao. All rights reserved.
//

import Foundation
class ContentPickModel {
    var top: Int = 0
    var end: Int = 0
    var datapick: [DataPickModel] = [DataPickModel]()
    
    init(_ json: [String: Any]) {
        if let temp = json["top"] as? Int { top = temp }
        if let temp = json["end"] as? Int { end = temp }
        if let temp = json["data"] as? [[String: Any]] {
            for item in temp {
                let itemAdd = DataPickModel(item)
                datapick.append(itemAdd)
            }
        }
    }
}
