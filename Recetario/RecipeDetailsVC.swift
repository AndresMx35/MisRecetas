//
//  RecipeDetailsVC.swift
//  Recetario
//
//  Created by Luis Andrés Rodríguez Santoyo on 31/10/17.
//  Copyright © 2017 Anadromo. All rights reserved.
//

import UIKit

class RecipeDetailsVC: UIViewController {
    @IBOutlet weak var ivRatingImage: UIButton!
    
    var recipe:Recipe!

    @IBOutlet weak var ivRecipeImage: UIImageView!
    @IBOutlet weak var tvRecipeDetailsTable: UITableView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationController?.hidesBarsOnSwipe = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        updateView()
    }
    
    //Esconder la barra de estado Wifi, Bateria, etc...
    override var prefersStatusBarHidden: Bool{
        return true
    }

    func updateView(){
        self.tvRecipeDetailsTable.estimatedRowHeight = 84.0
        self.tvRecipeDetailsTable.rowHeight = UITableViewAutomaticDimension
        title = recipe.name
        ivRecipeImage.image = recipe.image
        self.ivRatingImage.setImage(UIImage(named:self.recipe.rating), for: .normal)
        tvRecipeDetailsTable.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 0.25)
        tvRecipeDetailsTable.tableFooterView = UIView(frame: CGRect.zero)
        tvRecipeDetailsTable.separatorColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 0.75)
    }
    
    @IBAction func close(segue:UIStoryboardSegue){
        if let rateRecipeViewController = segue.source as? RateRecipeVC {
            if let ratingSelected = rateRecipeViewController.ratingSelected {
                self.recipe.rating = ratingSelected
                self.ivRatingImage.setImage(UIImage(named:self.recipe.rating), for: .normal)
            }
        }
    }
    
}

extension RecipeDetailsVC: UITableViewDataSource{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "recipeCell") as! RecipeDetailsCellTVC
        
        cell.backgroundColor = UIColor.clear
        
        switch indexPath.section {
        case 0:
            switch indexPath.row{
            case 0:
                cell.lblKey.text = "Nombre:"
                cell.lblValue.text = recipe.name
                break
            case 1:
                cell.lblKey.text = "Tiempo:"
                cell.lblValue.text = "\(recipe.time!) minutos"
                break
            /*case 2:
                cell.lblKey.text = "Favorita:"
                if recipe.isFavorite{
                    cell.lblValue.text = "Si"
                }else{
                    cell.lblValue.text = "No"
                }
                
                break*/
            default:
                
                break
            }
            break
        case 1:
            if indexPath.row == 0{
                cell.lblKey.text = "Ingredientes:"
                cell.lblValue.text = ""
            }else{
                cell.lblKey.text = ""
                cell.lblValue.text = recipe.ingredients[indexPath.row - 1]
            }
            break
        case 2:
            if indexPath.row == 0{
                cell.lblKey.text = "Pasos:"
                cell.lblValue.text = ""
            }else{
                cell.lblKey.text = ""
                cell.lblValue.text = recipe.steps[indexPath.row - 1]
            }
            break
        default:
            break
        }
        
       
        
        return cell
    }
    
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section{
        case 0:
            return 2
        case 1:
            return recipe.ingredients.count
        case 2:
            return recipe.steps.count
        default:
            return 0
        }
    }
    
     func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section{
            case 0:
                return "Información de la Receta"
            
            case 1:
                return "Ingredientes"
            
            case 2:
                return "Preparación"
            
            default:
            return ""
        }
    }
}

extension RecipeDetailsVC: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
