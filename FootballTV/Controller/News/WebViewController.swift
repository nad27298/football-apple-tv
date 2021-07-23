//
//  WebViewController.swift
//  FootballTV
//
//  Created by nguyenhuyson on 11/16/20.
//  Copyright © 2020 Nguyen Anh Dao. All rights reserved.
//

import UIKit
import Kingfisher
import Alamofire

class WebViewController: UIViewController {
    
    let textView = UITextView()
    let imageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(textView)
        view.addSubview(imageView)
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 1000).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 400).isActive = true
        imageView.contentMode = .scaleAspectFit
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        textView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 20).isActive = true
        textView.topAnchor.constraint(equalTo: view.topAnchor, constant: 440).isActive = true
        textView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 20).isActive = true
        textView.layer.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        textView.font = UIFont.systemFont(ofSize: 30)
        textView.isUserInteractionEnabled = true       // ScrollView TextView Apple TV
        textView.isScrollEnabled = true
        textView.showsVerticalScrollIndicator = true
        textView.bounces = true
        textView.panGestureRecognizer.allowedTouchTypes = [NSNumber(value: UITouch.TouchType.indirect.rawValue)]
    }
    
    
}

