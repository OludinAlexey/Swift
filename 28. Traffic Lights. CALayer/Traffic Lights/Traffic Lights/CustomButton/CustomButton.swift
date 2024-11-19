//
//  CustomButton.swift
//  Traffic Lights
//
//  Created by Алексей Олудин on 11.09.2024.
//

import UIKit

class CustomButton: UIButton {
    
    private var action: () -> Void = {}
    private var customConfiguration: ButtonConfiguration?
    var isStarted: Bool = false
    
    init(configuration: ButtonConfiguration) {
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
        self.setTitle(params.title, for: params.state)
        self.layer.borderWidth = params.borderWidth
        self.layer.borderColor = params.borderColor
        self.layer.cornerRadius = params.cornerRadius
        self.backgroundColor = params.backgroundColor
        self.addTarget(self, action: #selector(tappedButton), for: .touchUpInside)
        self.action = params.action
        self.isStarted = params.isStarted
    }

    
    @objc private func tappedButton() {
        print("Custom Button")
        action()
        print("-----------")
    }
}
