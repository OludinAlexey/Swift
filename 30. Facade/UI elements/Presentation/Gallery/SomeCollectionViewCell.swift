//
//  SomeCollectionViewCell.swift
//  UI elements
//
//  Created by Алексей Олудин on 28.08.2024.
//

import UIKit

protocol SomeCollectionViewCellDelegate: AnyObject {
    func cellDidTap()
}

class SomeCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var likeView: LikeView!
    @IBOutlet weak var someImageView: UIImageView!
    
    weak var delegate: SomeCollectionViewCellDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupGestures()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupGestures()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        likeView.configure(isLike: false, likeCount: 0)
    }
    
    private func setupGestures() {
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(cellDidTap)))
    }
    
    @objc private func cellDidTap() {
        delegate?.cellDidTap()
    }
}
