//
//  NationalityModel.swift
//  FootballTV
//
//  Created by nguyenhuyson2 on 11/19/20.
//  Copyright © 2020 Nguyen Anh Dao. All rights reserved.
//

import Foundation
class NationnalityModel {
    var logo: String = ""
    var name: String = ""
    
    init(_ json: [String: Any]) {
        if let temp = json["logo"] as? String { logo = temp }
        if let temp = json["name"] as? String { name = temp }
    }
    
}
