//
//  PokeTableViewCell.swift
//  PokemonCards
//
//  Created by olga.krjuckova on 08/08/2021.
//

import UIKit

class PokeTableViewCell: UITableViewCell {
    
    //connect with cell in Identity inspector (!) -> set a class
    
    @IBOutlet weak var pokeImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var supertypeLabel: UILabel!
    @IBOutlet weak var hpLabel: UILabel!
    @IBOutlet weak var subtypeLabel: UILabel!
    
    
    func setupUI(withData: Pokemon){
        nameLabel.text = "Name: " + withData.name
        hpLabel.text = "Card value: " + withData.number
        
        ImageController.getImage(for: withData.imageUrl) { image in
            self.pokeImageView.image = image
        }
        
        if let subtype = withData.subtype {
            subtypeLabel.text = "Card " + subtype
        }
        if let supertype = withData.supertype {
            
            supertypeLabel.text = "Type " + supertype
            
            if withData.supertype == "Trainer" {
                contentView.backgroundColor = .lightGray
            }else{
                contentView.backgroundColor = .systemTeal
                
            }
        }
    }
}



