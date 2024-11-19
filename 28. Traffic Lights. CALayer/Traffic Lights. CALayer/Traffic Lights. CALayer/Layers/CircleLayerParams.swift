//
//  CircleLayer.swift
//  Traffic Lights. CALayer
//
//  Created by Алексей Олудин on 13.09.2024.
//

import UIKit

struct CircleLayerParams {
    let x: Int
    let y: Int
    let radius: CGFloat
    let fillColor: UIColor
    let strokeColor: UIColor
    let startAngle: CGFloat = 0
    let endAngle: CGFloat = CGFloat(Double.pi * 2)
    let opacity: Float = 0.5
    let delay: Double
}

extension CircleLayerParams {
    static func red(x: Int, y: Int) -> CircleLayerParams {
        return CircleLayerParams(
            x: x,
            y: y,
            radius: 70,
            fillColor: .red,
            strokeColor: .black,
            delay: 7.6
        )
    }
    
    static func yellow(x: Int, y: Int) -> CircleLayerParams {
        return CircleLayerParams(
            x: x,
            y: y,
            radius: 70,
            fillColor: .yellow,
            strokeColor: .black,
            delay: 2.6
        )
    }
    
    static func green(x: Int, y: Int) -> CircleLayerParams {
        return CircleLayerParams(
            x: x,
            y: y,
            radius: 70,
            fillColor: .green,
            strokeColor: .black,
            delay: 2.6
        )
    }
}
