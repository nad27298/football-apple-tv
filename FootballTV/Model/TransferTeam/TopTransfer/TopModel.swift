//
//  TopModel.swift
//  FootballTV
//
//  Created by nguyenhuyson2 on 11/19/20.
//  Copyright © 2020 Nguyen Anh Dao. All rights reserved.
//

import Foundation
class TopModel {
    var next: String = ""
    var data: [DataModel] = [DataModel]()
    
    init(_ json: [String: Any]) {
        if let temp = json["next"] as? String { next = temp }
        if let temp = json["data"] as? [[String: Any]] {
            for item in temp {
                let itemAdd = DataModel(item)
                data.append(itemAdd)
            }
        }
    }
    
}
