//
//  TableStatsModel.swift
//  FootballTV
//
//  Created by nguyenhuyson2 on 11/26/20.
//  Copyright © 2020 Nguyen Anh Dao. All rights reserved.
//

import Foundation
class TableStatsModel {
    var template: String = ""
    var contentall: ContentAllStatsModel?
    init(_ json: [String: Any]) {
        if let temp = json["template"] as? String { template = temp }
        if let temp = json["content"] as? [String: Any] {
            self.contentall = ContentAllStatsModel(temp)
        }
    }
}
