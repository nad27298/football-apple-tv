//
//  PickAll.swift
//  FootballTV
//
//  Created by nguyenhuyson2 on 11/20/20.
//  Copyright © 2020 Nguyen Anh Dao. All rights reserved.
//

import Foundation
class PickkAllModel {
    var template: String = ""
    var content:ContentPickModel?
    
    init(_ json: [String: Any]) {
        if let temp = json["template"] as? String { template = temp }
        if let temp = json["content"] as? [String: Any] {
            self.content = ContentPickModel(temp)
        }
    }
}
