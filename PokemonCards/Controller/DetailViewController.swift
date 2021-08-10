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
    
    var poke : Pokemon!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if poke != nil {
            
            detailImageView.image = UIImage(named: poke.imageUrl)
            detailNameLabel.text = poke.name
            detailNumberLabel.text = poke.number
            detailSupertypeLabel.text = poke.supertype
            detailSubtypeLabel.text = poke.subtype
            
            detailNameLabel.numberOfLines = 0
            
        }
    }
    
    
    
}
