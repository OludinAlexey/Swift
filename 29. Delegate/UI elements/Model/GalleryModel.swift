//
//  GalleryModel.swift
//  UI elements
//
//  Created by Алексей Олудин on 05.09.2024.
//

import UIKit
import Foundation


struct GalleryModel {
    var images: [UIImage]
    var likes: [Int] = []
    
    init() {
        images = []
        (0...12).forEach {
            images.append(UIImage(named: "gallery\($0)")!)
            likes.append(Int.random(in: 0..<100))
        }
    }
}


