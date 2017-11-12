//
//  Pokemon.swift
//  GregsonRaevan_CE1
//
//  Created by Raevan Gregson on 11/28/16.
//  Copyright © 2016 Raevan Gregson. All rights reserved.
//

import Foundation
import UIKit

class Pokemon{

    var name: String?
    var type: String?
    var species: String?
    var image:UIImage?
    var pokedexNumber:Int?
    
    init(name: String, type: String, species: String, image:UIImage, pokedexNumber: Int) {
        
        self.name = name
        self.type = type
        self.species = species
        self.image = image
        self.pokedexNumber = pokedexNumber
        
    }

}
