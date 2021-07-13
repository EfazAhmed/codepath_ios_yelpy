//
//  RestaurantCell.swift
//  Yelpy
//
//  Created by Efaz on 7/11/21.
//  Copyright © 2021 memo. All rights reserved.
//

import UIKit

class RestaurantCell: UITableViewCell {

    @IBOutlet weak var restaurantImage: UIImageView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var ratingImage: UIImageView!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var reviewsLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
