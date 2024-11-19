//
//  DetailLabelNameConfiguration.swift
//  UI elements
//
//  Created by Алексей Олудин on 20.09.2024.
//


import UIKit

struct DetailLabelNameConfiguration {
    let translatesAutoresizingMaskIntoConstraints = false
    let state: UIControl.State
    let borderWidth: CGFloat
    let borderColor: CGColor
    let cornerRadius: CGFloat
    let backgroundColor: UIColor
    let text: String
    let fontColor: UIColor
    let font: UIFont
}

extension DetailLabelNameConfiguration {
    static func primary() -> DetailLabelNameConfiguration {
        return DetailLabelNameConfiguration(
            state: .normal,
            borderWidth: 0,
            borderColor: UIColor.black.cgColor,
            cornerRadius: 1,
            backgroundColor: .clear,
            text: "Default Name",
            fontColor: .black,
            font: .systemFont(ofSize: 36, weight: .light)
        )
    }
}
