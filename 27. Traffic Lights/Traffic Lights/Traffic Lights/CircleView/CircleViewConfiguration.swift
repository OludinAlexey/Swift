//
//  CircleViewConfiguration.swift
//  Traffic Lights
//
//  Created by Алексей Олудин on 10.09.2024.
//


import UIKit

struct CircleViewConfiguration {
    let translatesAutoresizingMaskIntoConstraints = false
    let state: UIControl.State
    let borderWidth: CGFloat
    let borderColor: CGColor
    let cornerRadius: CGFloat
    let backgroundColor: UIColor
}

extension CircleViewConfiguration {
    static func primary(color: UIColor, radius: CGFloat) -> CircleViewConfiguration {
        return CircleViewConfiguration(
            state: .normal,
            borderWidth: 2,
            borderColor: UIColor.black.cgColor,
            cornerRadius: radius,
            backgroundColor: color
        )
    }
}

