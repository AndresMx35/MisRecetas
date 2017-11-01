//
//  FullRecipeCellTVC.swift
//  Recetario
//
//  Created by Luis Andrés Rodríguez Santoyo on 30/10/17.
//  Copyright © 2017 Anadromo. All rights reserved.
//

import UIKit

class FullRecipeCellTVC: UITableViewCell {

    @IBOutlet weak var lblRecipeNameCell: UILabel!
    @IBOutlet weak var ivImageCell: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
