//
//  Utils.swift
//  FootballTV
//
//  Created by nguyenhuyson2 on 11/28/20.
//  Copyright © 2020 Nguyen Anh Dao. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

extension UIImageView {
    func getImageFromURL(_ imgURL: String) {
        let url = URL(string: imgURL)
        let processor = DownsamplingImageProcessor(size: self.bounds.size)
            |> RoundCornerImageProcessor(cornerRadius: 0)
        self.kf.indicatorType = .activity
        self.kf.setImage(
            with: url,
            placeholder: UIImage(named: "placeholderImage"),
            options: [
                .processor(processor),
                .scaleFactor(UIScreen.main.scale),
                .transition(.fade(1)),
                .cacheOriginalImage
            ])
    }
}

