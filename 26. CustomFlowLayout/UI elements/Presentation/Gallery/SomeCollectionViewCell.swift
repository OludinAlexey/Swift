//
//  SomeCollectionViewCell.swift
//  UI elements
//
//  Created by Алексей Олудин on 28.08.2024.
//

import UIKit

class SomeCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var likeView: LikeView!
    @IBOutlet weak var someImageView: UIImageView!
    
    
    override func prepareForReuse() {
        super.prepareForReuse()
        likeView.configure(isLike: false, likeCount: 0)
    }
}
