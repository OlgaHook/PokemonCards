//
//  ViewController.swift
//  PokemonCards
//
//  Created by olga.krjuckova on 08/08/2021.
//

import UIKit

class PokemonsViewController: UIViewController {
    
    
    @IBOutlet weak var tableViewOutlet: UITableView!
    
    var pokey: [Pokemon] = []
    
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
        let url = URL(string: "https://api.pokemontcg.io/v1/cards")!
        NetworkController.performRequest(for: url, httpMethod: .get) { (data, err) in
            if let error = err {
                print("Getting error from \(url.absoluteString), err \(error.localizedDescription)")
            }
            
            if let data = data {
                do {
                    let jsonData = try JSONDecoder().decode(Card.self, from: data)
                    self.pokey = jsonData.cards
                }catch{
                    print ("Failed to decode Pokemon data\(error), data \(String(describing: err))")
                }
                DispatchQueue.main.async {
                    self.tableViewOutlet.reloadData()
                }
            }else{
                print("Data is nil")
            }
            
        }
    }
    
}

//make extension PokemonsViewController with subClass UITableViewDataSource
//If we gonna use Table view -> mandatory are 2 func : NumberOfRowsInSection and cellForRowAt

extension PokemonsViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokey.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "pokemonCell", for: indexPath) as? PokeTableViewCell else {
            return UITableViewCell()
        }
        
        let onePoke = pokey[indexPath.row]
        cell.setupUI(withData: onePoke)
        
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       
        if let indexPath = tableViewOutlet.indexPathForSelectedRow {
            let pokeVC = segue.destination as! DetailViewController
            pokeVC.pokemon = pokey[indexPath.row]
            
        }
        // Pass the selected object to the new view controller.
    }
    
}


