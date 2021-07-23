//
//  ContentHotModel.swift
//  FootballTV
//
//  Created by nguyenhuyson2 on 11/11/20.
//  Copyright © 2020 Nguyen Anh Dao. All rights reserved.
//

import Foundation
class ContentsHotModel {
    var day: String = ""
    var articles: [ArticlesModel] = [ArticlesModel]()
    
    init(_ json: [String: Any]) {
        if let temp = json["articles"] as? [[String: Any]] {
            for item in temp{
                let itemAdd = ArticlesModel(item)
                articles.append(itemAdd)
            }
        }
        if let temp = json["day"] as? String { day = temp }
    }
}
