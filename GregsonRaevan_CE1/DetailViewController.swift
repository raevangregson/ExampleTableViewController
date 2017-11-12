//
//  DetailViewController.swift
//  GregsonRaevan_CE1
//
//  Created by Raevan Gregson on 11/28/16.
//  Copyright © 2016 Raevan Gregson. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var pokemonImage: UIImageView!
    
    @IBOutlet weak var pokemonName: UILabel!
   
    @IBOutlet weak var pokemonType: UILabel!
    
    @IBOutlet weak var pokemonSpecies: UILabel!
    
    @IBOutlet weak var pokemonNumber: UILabel!
    
    //pokemon object holder
    var pokemon:Pokemon?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //once the segue is performed I use the pokemon properties and load them into their corressponding places
        pokemonImage.image = pokemon?.image
        
        pokemonName.text = pokemon?.name
        pokemonType.text = pokemon?.type
        pokemonSpecies.text = pokemon?.species
        pokemonNumber.text = "#\(pokemon!.pokedexNumber!)"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backButton(_ sender: UIButton) {
        //as no changes are being made nor information being added I dismiss back to the tableviewcontroller
        self.dismiss(animated:true)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
