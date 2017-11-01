//
//  RecipeDetailsCellTVC.swift
//  Recetario
//
//  Created by Luis Andrés Rodríguez Santoyo on 31/10/17.
//  Copyright © 2017 Anadromo. All rights reserved.
//

import UIKit

class RecipeDetailsCellTVC: UITableViewCell {

    @IBOutlet weak var lblValue: UILabel!
    @IBOutlet weak var lblKey: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
