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
}
