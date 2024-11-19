//
//  DetailPhoto.swift
//  UI elements
//
//  Created by Алексей Олудин on 22.09.2024.
//

import UIKit

class DetailPhoto: UIView {

    private var photoImageView = UIImageView()
    private var name: String = "neo"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    init(frame: CGRect, photoName: String) {
        super.init(frame: frame)
        name = photoName
        setupUI()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        photoImageView.frame = bounds
    }
    
    func setImage(photoName: String)
    {
        setupPhotoImageView(photoName: photoName)
    }
    
    private func setupUI() {
        backgroundColor = .clear
        translatesAutoresizingMaskIntoConstraints = false
        contentMode = .scaleAspectFill
        
        addSubviews()
        setupPhotoImageView()
    }
    
    private func addSubviews() {
        addSubview(photoImageView)
    }
    
    
    private func setupPhotoImageView() {
        photoImageView.image = UIImage(named: name)
    }
    
    private func setupPhotoImageView(photoName: String) {
        photoImageView.image = UIImage(named: photoName)
        photoImageView.contentMode = .scaleAspectFit
    }
}

