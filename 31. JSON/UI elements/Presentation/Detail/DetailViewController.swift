//
//  DetailViewController.swift
//  UI elements
//
//  Created by Алексей Олудин on 20.09.2024.
//

import UIKit

class DetailViewController: UIViewController {
    
    private lazy var detailView = DetailView(configuration: DetailViewConfiguration.primary(color: .white, radius: 0))
    private lazy var detailLabelName = DetailLabelName(configuration: DetailLabelNameConfiguration.primary())
    private lazy var shadowView = ShadowView()
    private lazy var detailPhoto = DetailPhoto()
    private lazy var detailLabelDescription = DetailLabelDescription(configuration: DetailLabelDescriptionConfiguration.primary())
    
    
    var labelName: String = ""
    var labelDescription: String = ""
    var photoName: String = "neo"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailLabelName.text = labelName
        detailPhoto.setImage(photoName: photoName)
        detailLabelDescription.text = labelDescription
        setSubview()
        setLayout()
    }
    
    private func setSubview(){
        view.addSubview(detailView)
        detailView.addSubview(detailLabelName)
        detailView.addSubview(shadowView)
        shadowView.addSubview(detailPhoto)
        detailView.addSubview(detailLabelDescription)
    }
    
    private func setLayout(){
        
        NSLayoutConstraint.activate([
            
            detailView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            detailView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 4),
            detailView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 4),
            detailView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -4),
            detailView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            detailLabelName.centerXAnchor.constraint(equalTo: detailView.contentLayoutGuide.centerXAnchor),
            detailLabelName.topAnchor.constraint(equalTo: detailView.contentLayoutGuide.topAnchor, constant: 50),
            
            shadowView.centerXAnchor.constraint(equalTo: detailView.contentLayoutGuide.centerXAnchor),
            shadowView.topAnchor.constraint(equalTo: detailView.contentLayoutGuide.topAnchor, constant: 160),
            shadowView.heightAnchor.constraint(equalToConstant: 256),
            shadowView.widthAnchor.constraint(equalToConstant: 256),
            
            detailPhoto.centerXAnchor.constraint(equalTo: shadowView.centerXAnchor),
            detailPhoto.topAnchor.constraint(equalTo: shadowView.topAnchor),
            detailPhoto.heightAnchor.constraint(equalTo: shadowView.heightAnchor),
            detailPhoto.widthAnchor.constraint(equalTo: shadowView.widthAnchor),
            
            detailLabelDescription.centerXAnchor.constraint(equalTo: detailView.centerXAnchor),
            detailLabelDescription.topAnchor.constraint(equalTo: detailPhoto.bottomAnchor, constant: 50),
            detailLabelDescription.bottomAnchor.constraint(equalTo: detailView.contentLayoutGuide.bottomAnchor),
            detailLabelDescription.leadingAnchor.constraint(equalTo: detailView.leadingAnchor, constant: 8),
            detailLabelDescription.trailingAnchor.constraint(equalTo: detailView.trailingAnchor, constant: -8)
        ])
        
    }

}
