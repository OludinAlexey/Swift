//
//  CircleView.swift
//  Traffic Lights
//
//  Created by Алексей Олудин on 10.09.2024.
//

import UIKit

class CircleView: UIView {
    
    private var action: () -> Void = {}
    private var customConfiguration: CircleViewConfiguration?
    
    init(configuration: CircleViewConfiguration) {
        self.customConfiguration = configuration
        super.init(frame: CGRect())
        setParams()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setParams() {
        guard let params = customConfiguration else { return }
        
        self.translatesAutoresizingMaskIntoConstraints = params.translatesAutoresizingMaskIntoConstraints
        self.layer.borderWidth = params.borderWidth
        self.layer.borderColor = params.borderColor
        self.layer.cornerRadius = params.cornerRadius
        self.backgroundColor = params.backgroundColor
    }

}


extension CircleView {
    var radius: CGFloat {
            get {
                return self.layer.cornerRadius
            }
        }
    
    var diameter: CGFloat {
        get {
            return self.layer.cornerRadius * 2
        }
    }
}
