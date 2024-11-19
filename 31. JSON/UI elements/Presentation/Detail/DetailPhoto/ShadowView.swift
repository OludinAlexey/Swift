//
//  ShadowView.swift
//  UI elements
//
//  Created by Алексей Олудин on 23.09.2024.
//

import UIKit

class ShadowView: UIView {

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }

    
    
    private func setupUI() {
        backgroundColor = .clear
        translatesAutoresizingMaskIntoConstraints = false
        contentMode = .scaleAspectFill
        
        layer.shadowOpacity = 0.9
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowRadius = 4
        layer.shadowOffset = .zero
    }

}
