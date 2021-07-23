//
//  PersonModel.swift
//  FootballTV
//
//  Created by nguyenhuyson2 on 11/19/20.
//  Copyright © 2020 Nguyen Anh Dao. All rights reserved.
//

import Foundation
class PersonModel {
    var id: Int = 0
    var name: String = ""
    var logo: String = ""
    var age: String = ""
    var position: String = ""
    var nationality:NationnalityModel?
    
    init(_ json: [String: Any]) {
        if let temp = json["id"] as? Int { id = temp }
        if let temp = json["name"] as? String { name = temp }
        if let temp = json["logo"] as? String { logo = temp }
        if let temp = json["age"] as? String { age = temp }
        if let temp = json["position"] as? String { position = temp }
        if let temp = json["nationality"] as? [String: Any] {
            self.nationality = NationnalityModel(temp)
        }
    }
    
}
