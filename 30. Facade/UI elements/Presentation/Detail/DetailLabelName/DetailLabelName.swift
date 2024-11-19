//
//  DetailLabelName.swift
//  UI elements
//
//  Created by Алексей Олудин on 20.09.2024.
//

import UIKit

class DetailLabelName: UILabel {

    private var customConfiguration: DetailLabelNameConfiguration?
    
    init(configuration: DetailLabelNameConfiguration) {
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
        self.text = params.text
        self.textColor = params.fontColor
        self.font = params.font
    }

}
