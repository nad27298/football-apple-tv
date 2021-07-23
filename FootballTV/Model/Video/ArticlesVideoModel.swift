//
//  ArticlesVideoModel.swift
//  FootballTV
//
//  Created by nguyenhuyson on 11/17/20.
//  Copyright © 2020 Nguyen Anh Dao. All rights reserved.
//

import Foundation
class ArticlesVideoModel {
    var id: Int = 0
    var title: String = ""
    var comments_total: Int = 0
    var thumb: String = ""
    var slide_thumb: String = ""
    var top: Bool = false
    var is_video: Bool = false
    var template: String = ""
    var body: BodyHeadlineModel?
    var real_video_info: RealVideoModel?
    init(_ json: [String: Any]) {
        if let temp = json["id"] as? Int { id = temp }
        if let temp = json["title"] as? String { title = temp }
        if let temp = json["comments_total"] as? Int { comments_total = temp }
        if let temp = json["thumb"] as? String { thumb = temp }
        if let temp = json["slide_thumb"] as? String { slide_thumb = temp }
        if let temp = json["top"] as? Bool { top = temp }
        if let temp = json["is_video"] as? Bool { is_video = temp }
        if let temp = json["template"] as? String { template = temp }
        if let temp = json["body"] as? [String: Any] {
            self.body = BodyHeadlineModel(temp)
        }
        if let temp = json["real_video_info"] as? [String: Any] {
            self.real_video_info = RealVideoModel(temp)
        }
    }
}
