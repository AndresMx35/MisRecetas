//
//  InicioVC.swift
//  Recetario
//
//  Created by Luis Andrés Rodríguez Santoyo on 30/10/17.
//  Copyright © 2017 Anadromo. All rights reserved.
//

import UIKit

class InicioVC: UIViewController, UITableViewDelegate {

    //Esconder bara de tareas (Wifi, bateria, red, etc...)
    override var prefersStatusBarHidden: Bool{
        return true
    }
    
    @IBOutlet weak var tableview: UITableView!
    var recipes:[Recipe]! = []
    var recipe:Recipe!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableview.delegate = self
        self.tableview.dataSource = self

        
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
    }

}

extension InicioVC:UITableViewDataSource{
   
    //MARK: ~UITableViewDataSource
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipes.count
    }
    
     func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let recipe = recipes[indexPath.row]
        let cellID = "recipeCell"
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        
        cell.textLabel?.text = recipe.name
        cell.imageView?.image = recipe.image
        cell.imageView?.contentMode = .scaleAspectFill
        return cell
    }

}
