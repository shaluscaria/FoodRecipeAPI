//
//  CustomTableCell.swift
//  ImageListView
//
//  Created by Shalu Scaria on 2017-09-07.
//  Copyright © 2017 Shalu Scaria. All rights reserved.
//

import UIKit

class CustomTableCell: UITableViewCell {
    
    
    @IBOutlet var recipeImage: UIImageView!
    
    
   
    @IBOutlet var recipeTitle: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
