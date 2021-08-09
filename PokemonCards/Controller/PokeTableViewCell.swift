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
    
    
    func setupUI(with: Pokemon){
        nameLabel.text = "Name: " + with.name
        hpLabel.text = "Card value: " + with.number
        
        ImageController.getImage(for: with.imageUrl) { image in
            self.pokeImageView.image = image
        }
        
        if let subtype = with.subtype {
            subtypeLabel.text = "Card " + subtype
        }
        if let supertype = with.supertype {
            
            supertypeLabel.text = "Type " + supertype
            
            if with.supertype == "Trainer" {
                contentView.backgroundColor = .blue
            }else{
                contentView.backgroundColor = .systemYellow           }
        }
    }
}



