//
//  DetailLabelDescriptionConfiguration.swift
//  UI elements
//
//  Created by Алексей Олудин on 23.09.2024.
//

import UIKit

struct DetailLabelDescriptionConfiguration {
    let translatesAutoresizingMaskIntoConstraints = false
    let state: UIControl.State
    let borderWidth: CGFloat
    let borderColor: CGColor
    let cornerRadius: CGFloat
    let backgroundColor: UIColor
    let text: String
    let fontColor: UIColor
    let numberOfLines: Int
    let textAlignment: NSTextAlignment
    let font: UIFont
}

extension DetailLabelDescriptionConfiguration {
    static func primary() -> DetailLabelDescriptionConfiguration {
        return DetailLabelDescriptionConfiguration(
            state: .normal,
            borderWidth: 0,
            borderColor: UIColor.black.cgColor,
            cornerRadius: 1,
            backgroundColor: .clear,
            text: "Default description",
            fontColor: .black,
            numberOfLines: 0,
            textAlignment: .justified,
            font: .systemFont(ofSize: 16, weight: .light)
        )
    }
}
