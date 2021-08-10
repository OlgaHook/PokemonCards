//
//  DetailViewController.swift
//  PokemonCards
//
//  Created by olga.krjuckova on 10/08/2021.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var detailImageView: UIImageView!
    
    @IBOutlet weak var detailNameLabel: UILabel!
    @IBOutlet weak var detailNumberLabel: UILabel!
    @IBOutlet weak var detailSupertypeLabel: UILabel!
    @IBOutlet weak var detailSubtypeLabel: UILabel!
    
    var pokemon : Pokemon?
    
    //var pokemon : Pokemon!
    
    
    @IBAction func closeDetailVCButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        if let pokemon = pokemon{
            ImageController.getImage(for: pokemon.imageUrl) {(image) in
                self.detailImageView.image = image
            
                self.detailNameLabel.text = pokemon.name
                self.detailNumberLabel.text = pokemon.number
                self.detailSupertypeLabel.text = pokemon.supertype
                self.detailSubtypeLabel.text = pokemon.subtype
            }
        }else{
            print("Carramba! Pokemon image is missing!")
        }
        
        
        /*
        //if poke != nil{
            if let pokemon = pokemon{
            detailImageView.image = UIImage(named: pokemon.imageUrl)
            detailNameLabel.text = pokemon.name
            detailNumberLabel.text = pokemon.number
            detailSupertypeLabel.text = pokemon.supertype
            detailSubtypeLabel.text = pokemon.subtype
            
            //detailNameLabel.numberOfLines = 0
            
        }else{
         print("Carramba! Pokemon image is missing!")
         
         }
 */
    }
    
    
    
}
