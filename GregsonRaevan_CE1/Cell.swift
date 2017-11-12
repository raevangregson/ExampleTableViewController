//
//  Cell.swift
//  GregsonRaevan_CE1
//
//  Created by Raevan Gregson on 11/27/16.
//  Copyright © 2016 Raevan Gregson. All rights reserved.
//

import UIKit

class Cell: UITableViewCell {

    @IBOutlet weak var typeImage: UIImageView!
    
    @IBOutlet weak var pokeType: UILabel!
    
    @IBOutlet weak var pokeNumber: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
