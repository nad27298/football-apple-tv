//
//  BettingModel.swift
//  FootballTV
//
//  Created by nguyenhuyson on 11/13/20.
//  Copyright © 2020 Nguyen Anh Dao. All rights reserved.
//

import Foundation
class BettingModel {
    var id: Int = 0
    var label: String = ""
    var prev: String = ""
    var next: String = ""
    var articles: [ArticlesModel] = [ArticlesModel]()
    
    init(_ json: [String: Any]) {
        if let temp = json["id"] as? Int { id = temp }
        if let temp = json["label"] as? String { label = temp }
        if let temp = json["prev"] as? String { prev = temp }
        if let temp = json["next"] as? String { next = temp }
        if let temp = json["articles"] as? [[String: Any]] {
            for item in temp{
                let itemAdd = ArticlesModel(item)
                articles.append(itemAdd)
            }
        }
    }
}
