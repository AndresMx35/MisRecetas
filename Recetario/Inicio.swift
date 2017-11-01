//
//  ViewController.swift
//  Recetario
//
//  Created by Luis Andrés Rodríguez Santoyo on 29/10/17.
//  Copyright © 2017 Anadromo. All rights reserved.
//

import UIKit

class Inicio: UITableViewController {

    var recipes:[Recipe]! = []
    var recipe:Recipe!
    
    override func viewDidLoad() {
        super.viewDidLoad()

     
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        recipe = Recipe(
            name: "Tortilla de Patatas",
            image:#imageLiteral(resourceName: "tortilla_patatas"),
            time: 20,
            ingredients:[
                "Huevos",
                "Patatas",
                "Cebolla"
            ],
            steps:[
                "1.- Pelar las patatas y la cebolla",
                "2.- Cortar las patatas y la cebollas y freir",
                "3.- Batir los huevos y echar a la sarten durante un minuto con el resto"
            ]
        )
        recipes.append(recipe)
        
        recipe = Recipe(
            name: "Pizza Margarita",
            image:#imageLiteral(resourceName: "pizza_margarita"),
            time: 60,
            ingredients:[
                "Harina",
                "Levadura",
                "Aceite",
                "Sal",
                "Salsa Tomate",
                "Queso"
            ],
            steps:[
                "1.- Hacemos la masa con harina, levadura, aceite y sal",
                "2.- Dejamos reposar la masa durante 30 minutos",
                "3.- Extendemos la masa encima de una bandeja y añadimos el resto de los ingredientes",
                "4.- Dejamos hornear durante 12 minutos"
            ]
        )
        recipes.append(recipe)
        
        recipe = Recipe(
            name: "Hamburguesa con Queso",
            image: #imageLiteral(resourceName: "hamburguesa_queso"),
            time: 10,
            ingredients:[
                "Pan de hamburguesa",
                "Lechuga",
                "Jitomate",
                "Queso",
                "Carne de Hamburguesa"
            ],
            steps:[
                "1.- Poner la carne al fuego al gusto",
                "2.- Montar la hamburguesa con sus ingredientes entre los panes"
            ]
        )
        recipes.append(recipe)
        
        recipe = Recipe(
            name: "Ensalada Cesar",
            image: #imageLiteral(resourceName: "ensalada_cesar"),
            time: 15,
            ingredients:[
                "Lechuga",
                "Jitomate",
                "Cebolla",
                "Pimientos",
                "Salsa Cesar",
                "Pollo"
            ],
            steps:[
                "1.- Limpiar todas las verduras y picarlas",
                "2.- Freir el Pollo",
                "3.- Juntar todos los ingredientes y poner Salsa Cesar al gusto"
            ]
        )
        recipes.append(recipe)
        
        
        recipe = Recipe(
            name: "Paella",
            image: #imageLiteral(resourceName: "paella"),
            time: 30,
            ingredients:[
                "Arroz Bomba",
                "Marisco Variado",
                "Caldo de Pescado",
                "Guisantes"
            ],
            steps:[
                "1.- Tostar el arroz en una paellera",
                "2.- Tras dorarse, echar el caldo de pescado, el marisco y los guisantes",
                "3.- Dejar cocer el arroz a fuego lento hasta que todo el arroz se haya bebido el caldo"
            ]
        )
        recipes.append(recipe)
        
        
        recipe = Recipe(
            name: "Batido de Fresa",
            image: #imageLiteral(resourceName: "batido_fresa"),
            time: 5,
            ingredients:[
                "10 Fresas Maduras",
                "Leche",
                "Azúcar"
            ],
            steps:[
                "1.- Limpiar y cortar las fresas",
                "2.- Mezclar las fresas con leche y una cucharada de azucar",
                "3.- Triturar hasta que quede hecho papilla"
            ]
        )
        recipes.append(recipe)
        
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        navigationController?.hidesBarsOnSwipe = true

    }
    
    //Esconder la barra de estado Wifi, Bateria, etc...
    override var prefersStatusBarHidden: Bool{
        return true
    }
    
    //MARK: - UITableViewDataSource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipes.count
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let recipe = recipes[indexPath.row]
        let cellID = "recipeCell"
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as!  RecipeCellTVC
        
        //cell.ivImageCell.image = recipe.image
        //cell.lblRecipeNameCell.text = recipe.name
        
       // if recipe.isFavorite {  cell.accessoryType = .checkmark } else{ cell.accessoryType = .none}
        
        
        cell.ivImageCell.image = recipe.image
        cell.lblNameCell.text = recipe.name!
        cell.lblTime.text = "\(recipe.time!) Minutos"
        cell.lblIngredients.text = "Ingredientes: \(recipe.ingredients.count)"
        
        //cell.ivImageCell.layer.cornerRadius =  //Hace lor bordes de la imagen
        //cell.ivImageCell.clipsToBounds = true // Hace un recorte hasta el limite
        
        //cell.textLabel?.text = recipe.name
        //cell.imageView?.image = recipe.image
        //cell.imageView?.contentMode = .scaleAspectFill
        return cell
    }
    
    /*
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        switch editingStyle{
        case .delete:
            recipes.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            break
        default:
            break
        }
        
    }
    */
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        //Accion Compartir
        let shareAction:UITableViewRowAction = UITableViewRowAction(style: .default, title: "Compartir") { (action, indexPath) in
            
            let shareDefaultText = "Estoy mirando la receta de \(self.recipes[indexPath.row].name!) en la App \"Mi Recetario\" hecha por Andrés Rodríguez."
            
            let activityController:UIActivityViewController = UIActivityViewController(activityItems: [shareDefaultText], applicationActivities: nil)
            
            self.present(activityController, animated: true, completion: nil)
        }
        
        //Accion Borrar
        let deleteAction:UITableViewRowAction = UITableViewRowAction(style: .destructive, title: "Borrar") { (action, indexPath) in
            
            self.recipes.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .fade)
        }
        
        shareAction.backgroundColor = UIColor.lightGray
        
        
        return [deleteAction, shareAction]
    }
    
    
    //MARK: - UITableViewDelegate

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //let recipe = recipes[indexPath.row]
        
        //selectedRecipe = recipe
        
       /* let alertController = UIAlertController(title: recipes[indexPath.row].name, message: "Valorar este plato", preferredStyle: .actionSheet)
        
        let detailsAction = UIAlertAction(title: "Ver más", style: .default, handler: nil)
        
        alertController.addAction(detailsAction)
        
        var titleMarkAsFavorite:String!
        var styleMarkAsFavorite:UIAlertActionStyle!
        
        if recipes[indexPath.row].isFavorite{
            titleMarkAsFavorite = "Eliminar de Favoritos"
            styleMarkAsFavorite =  UIAlertActionStyle.destructive
        }else{
            titleMarkAsFavorite = "Agregar a Favoritos"
            styleMarkAsFavorite =  UIAlertActionStyle.default
        }
        
        
        let markAsFavoriteAction = UIAlertAction(title: titleMarkAsFavorite, style: styleMarkAsFavorite){ (action) in
            recipe.isFavorite = !recipe.isFavorite
            tableView.reloadData()
        }
        
        alertController.addAction(markAsFavoriteAction)
        
        let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        
        alertController.addAction(cancelAction)
        
        self.present(alertController,animated: true,completion: nil) */
    }
    
    //MARK: - Segue Methods
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let segueID:String! = segue.identifier
        
        switch segueID {
       
        case "recipeDetails":
            
            if let indexPath = tableView.indexPathForSelectedRow{
                
                let selectedRecipe = recipes[indexPath.row]
                
                let destinationViewController = segue.destination as! RecipeDetailsVC
                
                destinationViewController.recipe = selectedRecipe
            }
            
            break
        
        default:
            break
       
        }
    }

}

