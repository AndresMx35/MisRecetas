//
//  RateRecipeVC.swift
//  Recetario
//
//  Created by Luis Andrés Rodríguez Santoyo on 31/10/17.
//  Copyright © 2017 Anadromo. All rights reserved.
//

import UIKit

class RateRecipeVC: UIViewController {

    @IBOutlet weak var ivFeedbackImage: UIImageView!
    @IBOutlet weak var ratingStackView: UIStackView!
    @IBOutlet weak var rateGreatButton: UIButton!
    @IBOutlet weak var rateGoodButton: UIButton!
    @IBOutlet weak var rateDislikeButton: UIButton!
    
    var ratingSelected:String!
    
    override func viewDidLoad() {
    
        
        super.viewDidLoad()
        
        
        let blurEffect = UIBlurEffect(style: .dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        ivFeedbackImage.addSubview(blurEffectView)
        
        let scale = CGAffineTransform(scaleX: 0.0, y: 0.0)
        let translation = CGAffineTransform(translationX: 0.0, y: 1000.0)

        //ratingStackView.transform = scale.concatenating(translation)
        
        rateGreatButton.transform = scale.concatenating(translation)
        rateGoodButton.transform = scale.concatenating(translation)
        rateDislikeButton.transform = scale.concatenating(translation)

    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
       /* UIView.animate(withDuration: 0.5, delay: 0.0, options: [], animations: {
            self.ratingStackView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        }, completion: nil)*/
        
        UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.5, options: [], animations: {
            self.rateGreatButton.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)

        }, completion: { (success) in
            UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.5, options: [], animations: {
                self.rateGoodButton.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
                
            }, completion: {(succes) in
                
                UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.5, options: [], animations: {
                    self.rateDislikeButton.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
                    
                }, completion: nil)
            })
        
        })
    }
    
    @IBAction func ratePressed(_ sender: UIButton) {
            let buttonTag = sender.tag
        
            switch buttonTag {
            case 1:
                ratingSelected = "great"
                break
            case 2:
                ratingSelected = "good"

                break
            case 3:
                ratingSelected = "dislike"

                break
            default:
                break
            }
        
        performSegue(withIdentifier: "unwindToRecipeDetailView", sender: sender)
    }
    
    
}
