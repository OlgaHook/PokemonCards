//
//  ViewController.swift
//  PokemonCards
//
//  Created by olga.krjuckova on 08/08/2021.
//

import UIKit

class PokemonsViewController: UIViewController {
    
    
    @IBOutlet weak var tableViewController: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        //navigation title
        self.title = "Pokemon List"
        getPokemonData()
        
    }
    func getPokemonData(){
        //for this func we created our own network controller -> new Group in map Pokemon Cards-> named Helper
        //inside Helper wii create 2 files -new swift "Network controller"
        // and new swift file-> Image controller
        
        
    }

}

//make extension PokemonsViewController with subClass UITableViewDataSource
//If we gonna use Table view -> mandatory are 2 func : NumberOfRowsInSection and cellForRowAt

extension PokemonsViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "pokemonCell", for: indexPath) as? PokeTableViewCell else {
            return UITableViewCell()
        }
    return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
     return 250
    }
       
    }
    

