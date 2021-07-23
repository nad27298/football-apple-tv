//
//  VideoHighlightsModel.swift
//  FootballTV
//
//  Created by nguyenhuyson on 11/17/20.
//  Copyright © 2020 Nguyen Anh Dao. All rights reserved.
//

import Foundation
class VideoHightlightsModel {
    var articles: [ArticlesVideoModel] = [ArticlesVideoModel]()
    var prev: String = ""
    var next: String = ""
  
    
    init(_ json: [String: Any]) {
        if let temp = json["articles"] as? [[String: Any]] {
            for item in temp{
                let itemAdd = ArticlesVideoModel(item)
                articles.append(itemAdd)
            }
        }
        if let temp = json["prev"] as? String { prev = temp }
        if let temp = json["next"] as? String { next = temp }
    }
}
