//
//  ButtonConfiguration.swift
//  Traffic Lights
//
//  Created by Алексей Олудин on 11.09.2024.
//

import UIKit

struct ButtonConfiguration {
    let translatesAutoresizingMaskIntoConstraints = false
    let title: String
    let state: UIControl.State
    let borderWidth: CGFloat
    let borderColor: CGColor
    let cornerRadius: CGFloat
    let backgroundColor: UIColor
    let action: () -> Void
    let isStarted: Bool
}

extension ButtonConfiguration {
    static func primary(title: String, action: @escaping () -> Void) -> ButtonConfiguration {
        return ButtonConfiguration(
            title: title,
            state: .normal,
            borderWidth: 2,
            borderColor: UIColor.red.cgColor,
            cornerRadius: 5,
            backgroundColor: .brown,
            action: action,
            isStarted: false
        )
    }
    
    static func second(title: String, action: @escaping () -> Void) -> ButtonConfiguration {
        return ButtonConfiguration(
            title: title,
            state: .normal,
            borderWidth: 3,
            borderColor: UIColor.blue.cgColor,
            cornerRadius: 10,
            backgroundColor: .cyan,
            action: action,
            isStarted: false
        )
    }
}
