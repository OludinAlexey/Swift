//
//  SomeTableViewCell.swift
//  UI elements
//
//  Created by Алексей Олудин on 10.08.2024.
//

import UIKit

class SomeTableViewCell: UITableViewCell {

    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelDescription: UILabel!
    @IBOutlet weak var photoView: UIImageView!
    @IBOutlet weak var shadowView: UIView!
    
    
    override func prepareForReuse() {
        super.prepareForReuse()
        labelName.text = nil
        labelDescription.text = nil
        photoView.image = nil
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        photoView.clipsToBounds = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        photoView.layer.cornerRadius = photoView.frame.width / 10
        
        shadowView.layer.shadowOpacity = 0.9
        shadowView.layer.cornerRadius = photoView.frame.width / 10
        
        shadowView.layer.shadowColor = UIColor.black.cgColor
        shadowView.layer.shadowRadius = 4
        shadowView.layer.shadowOffset = .zero
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(name: String, description: String, photoName: String){
        labelName.text = name
        labelDescription.text = description
        photoView.image = UIImage(named: photoName)
    }

}
