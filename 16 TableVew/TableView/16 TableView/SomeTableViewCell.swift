//
//  SomeTableViewCell.swift
//  16 TableView
//
//  Created by Алексей Олудин on 10.08.2024.
//

import UIKit

class SomeTableViewCell: UITableViewCell {

    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var `switch`: UISwitch!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func buttonDidTap(_ sender: UIButton) {
        print(label.text)
    }
}
