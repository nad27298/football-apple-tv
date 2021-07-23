//
//  RoundsStatsModel.swift
//  FootballTV
//
//  Created by nguyenhuyson2 on 11/26/20.
//  Copyright © 2020 Nguyen Anh Dao. All rights reserved.
//

import Foundation
class RoundsStatsModel {
    var content: ContentStatsModel?
    init(_ json: [String: Any]) {
        if let temp = json["content"] as? [String: Any] {
            self.content = ContentStatsModel(temp)
        }
    }
}
