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
    
    init() {
        images = [UIImage()]
        (0...10).forEach { images.append(UIImage(named: "gallery\($0)")!) }
    }
}
