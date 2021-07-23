//
//  PlayerStatsModel.swift
//  FootballTV
//
//  Created by nguyenhuyson2 on 11/27/20.
//  Copyright © 2020 Nguyen Anh Dao. All rights reserved.
//

import Foundation
class PlayerStatsModel {
    var template: String = ""
    var contentplayer: ContentPlayerModel?
    init(_ json: [String: Any]) {
        if let temp = json["template"] as? String { template = temp }
        if let temp = json["content"] as? [String: Any] {
            self.contentplayer = ContentPlayerModel(temp)
        }
    }
}
