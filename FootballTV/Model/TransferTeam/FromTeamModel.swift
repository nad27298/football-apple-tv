//
//  FromTeamModel.swift
//  FootballTV
//
//  Created by nguyenhuyson2 on 11/19/20.
//  Copyright © 2020 Nguyen Anh Dao. All rights reserved.
//

import Foundation
class FromTeamModel {
    var name: String = ""
    var logo: String = ""
    
    init(_ json: [String: Any]) {
        if let temp = json["name"] as? String { name = temp }
        if let temp = json["logo"] as? String { logo = temp }
    }
    
    
}
