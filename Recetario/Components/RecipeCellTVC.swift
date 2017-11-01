//
//  RecipeCellTVC.swift
//  Recetario
//
//  Created by Luis Andrés Rodríguez Santoyo on 30/10/17.
//  Copyright © 2017 Anadromo. All rights reserved.
//

import UIKit

class RecipeCellTVC: UITableViewCell {

    @IBOutlet weak var lblIngredients: UILabel!
    @IBOutlet weak var lblTime: UILabel!
    @IBOutlet weak var lblNameCell: UILabel!
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
