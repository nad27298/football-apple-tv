//
//  BodyHeadlineModel.swift
//  FootballTV
//
//  Created by nguyenhuyson2 on 11/19/20.
//  Copyright © 2020 Nguyen Anh Dao. All rights reserved.
//

import Foundation
class BodyHeadlineModel {
    var title: String = ""
    var time: String = ""
    var published_time: String = ""
    var writer: String = ""
    var body: String = ""
  
    init(_ json: [String: Any]) {
        if let temp = json["title"] as? String { title = temp }
        if let temp = json["time"] as? String { time = temp }
        if let temp = json["published_time"] as? String { published_time = temp }
        if let temp = json["writer"] as? String { writer = temp }
        if let temp = json["body"] as? String { body = temp }
    }
}
