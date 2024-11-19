//
//  CircleLayer.swift
//  Traffic Lights. CALayer
//
//  Created by Алексей Олудин on 13.09.2024.
//
import UIKit

class CircleLayer: CAShapeLayer {
    
    private var params: CircleLayerParams
    private var circlePath: UIBezierPath
    var delay: Double
    
    override init() {
        self.params = CircleLayerParams(x: 0, y: 0, radius: 1, fillColor: .clear, strokeColor: .clear, delay: 0)
        circlePath = UIBezierPath(
            arcCenter: CGPoint(x: params.x, y: params.y),
            radius: CGFloat(params.radius),
            startAngle: params.startAngle,
            endAngle: params.endAngle,
            clockwise: true
        )
        self.delay = params.delay
        super.init()
    }
    
    init(params: CircleLayerParams) {
        self.params = params
        circlePath = UIBezierPath(
            arcCenter: CGPoint(x: params.x, y: params.y),
            radius: CGFloat(params.radius),
            startAngle: params.startAngle,
            endAngle: params.endAngle,
            clockwise: true
        )
        delay = params.delay
        super.init()
        makeCircle()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func makeCircle(){
        circlePath.stroke()
        self.path = circlePath.cgPath
        self.fillColor = params.fillColor.cgColor
        self.strokeColor = params.strokeColor.cgColor
        self.opacity = params.opacity
    }
}
