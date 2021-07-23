//
//  HotModel.swift
//  FootballTV
//
//  Created by nguyenhuyson2 on 11/11/20.
//  Copyright © 2020 Nguyen Anh Dao. All rights reserved.
//

import Foundation
class HotModel {
    var prev: String = ""
    var next: String = ""
    var contents: [ContentsHotModel] = [ContentsHotModel]()
    
    init(_ json: [String: Any]) {
        if let temp = json["contents"] as? [[String: Any]] {
            for item in temp{
                let itemAdd = ContentsHotModel(item)
                contents.append(itemAdd)
            }
        }
        if let temp = json["prev"] as? String { prev = temp }
        if let temp = json["next"] as? String { next = temp }
    }
}
