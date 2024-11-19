//
//  DetailLabelDescription.swift
//  UI elements
//
//  Created by Алексей Олудин on 23.09.2024.
//

import UIKit

class DetailLabelDescription: UILabel {

    private var customConfiguration: DetailLabelDescriptionConfiguration?
    
    init(configuration: DetailLabelDescriptionConfiguration) {
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
        self.numberOfLines = params.numberOfLines
        self.textAlignment = params.textAlignment
        self.font = params.font
    }


}
