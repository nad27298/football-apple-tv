//
//  MatchModel.swift
//  FootballTV
//
//  Created by nguyenhuyson2 on 11/24/20.
//  Copyright © 2020 Nguyen Anh Dao. All rights reserved.
//

import Foundation
class MatchModel: NSObject {
    var list: [ListMatchModel] = [ListMatchModel]()
    var prev: String = ""
    var next: String = ""
  
    
    init(_ json: [String: Any]) {
        if let temp = json["list"] as? [[String: Any]] {
            for item in temp{
                let itemAdd = ListMatchModel(item)
                list.append(itemAdd)
            }
        }
        if let temp = json["prev"] as? String { prev = temp }
        if let temp = json["next"] as? String { next = temp }
    }
}
