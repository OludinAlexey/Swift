//
//  LikeView.swift
//  UI elements
//
//  Created by Алексей Олудин on 08.09.2024.
//

import UIKit

class LikeView: UIView {

    private var likeImageView = UIImageView()
    private var likeCounterLabel = UILabel()
    
    private var likeCount: Int = 0
    private var isSelected: Bool = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        likeImageView.frame = bounds
    }
    
    func configure(isLike: Bool, likeCount: Int){
        self.likeCount = likeCount
        isSelected = isLike
        
        likeCounterLabel.text = isSelected ? String(likeCount + 1) : String(likeCount)
        likeImageView.alpha = isSelected ? 0.8 : 0.5
    }
    
    private func setupUI(){
        backgroundColor = .clear
        addSubviews()
        setupLikeImageView()
        setupLikeCounterLabel()
    }
    
    private func addSubviews(){
        addSubview(likeImageView)
        addSubview(likeCounterLabel)
        
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapView)))
    }
    
    @objc private func tapView(){
        animateTap()
    }
    
    private func setupLikeImageView(){
        likeImageView.tintColor = .red.withAlphaComponent(0.8)
        likeImageView.image = UIImage(systemName: "heart.fill")
    }
    
    private func setupLikeCounterLabel(){
        likeCounterLabel.textColor = .white
        likeCounterLabel.font = .systemFont(ofSize: 12, weight: .semibold)
        likeCounterLabel.translatesAutoresizingMaskIntoConstraints = false
        likeCounterLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        likeCounterLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
    private func animateTap(){
        isSelected.toggle()
        UIView.transition(
            with: self,
            duration: 0.3,
            animations: {[self] in
                likeCounterLabel.text = isSelected ? String(likeCount + 1) : String(likeCount)
                likeImageView.alpha = isSelected ? 0.8 : 0.5
            }
        )
    }
}
