//
//  DetailView.swift
//  UI elements
//
//  Created by Алексей Олудин on 20.09.2024.
//

import UIKit

class DetailView: UIScrollView {

    private var customConfiguration: DetailViewConfiguration?
    
    init(configuration: DetailViewConfiguration) {
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
        self.isScrollEnabled = true
    }


}
