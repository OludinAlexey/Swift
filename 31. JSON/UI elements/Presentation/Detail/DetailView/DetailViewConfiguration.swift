//
//  DetailViewConfiguration.swift
//  UI elements
//
//  Created by Алексей Олудин on 20.09.2024.
//

import UIKit

struct DetailViewConfiguration {
    let translatesAutoresizingMaskIntoConstraints = false
    let state: UIControl.State
    let borderWidth: CGFloat
    let borderColor: CGColor
    let cornerRadius: CGFloat
    let backgroundColor: UIColor
}

extension DetailViewConfiguration {
    static func primary(color: UIColor, radius: CGFloat) -> DetailViewConfiguration {
        return DetailViewConfiguration(
            state: .normal,
            borderWidth: 0,
            borderColor: UIColor.black.cgColor,
            cornerRadius: radius,
            backgroundColor: color
        )
    }
}
