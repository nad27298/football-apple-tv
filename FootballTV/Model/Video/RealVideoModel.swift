//
//  RealVideoModel.swift
//  FootballTV
//
//  Created by nguyenhuyson on 11/17/20.
//  Copyright © 2020 Nguyen Anh Dao. All rights reserved.
//

import Foundation
class RealVideoModel {
    
    var real_video_url: String = ""
    var video_cover: String = ""

    init(_ json: [String: Any]) {
       
        if let temp = json["real_video_url"] as? String { real_video_url = temp }
        if let temp = json["video_cover"] as? String { video_cover = temp }

    }
}
