//
//  productTableViewCell.swift
//  BikeLove
//
//  Created by Kevin Nguyen on 6/28/16.
//  Copyright © 2016 Kevin Nguyen. All rights reserved.
//

import UIKit

class productTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var priceTag: UILabel!
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
