//
//  Recipe.swift
//  Recetario
//
//  Created by Luis Andrés Rodríguez Santoyo on 30/10/17.
//  Copyright © 2017 Anadromo. All rights reserved.
//

import Foundation
import UIKit

class Recipe: NSObject{
    //Propiedades
    var name: String!
    var image: UIImage!
    var time: Int!              //Minutes
    var ingredients:[String]!
    var steps: [String]!
    //var isFavorite:Bool! = false
    var rating:String! = "rating"
    
    override init(){
        
    }
    
    init(name:String, image:UIImage, time:Int, ingredients:[String], steps:[String]){
        self.name = name
        self.image = image
        self.time = time
        self.ingredients = ingredients
        self.steps = steps
    }
    
}
