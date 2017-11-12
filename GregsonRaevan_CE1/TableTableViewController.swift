//
//  TableTableViewController.swift
//  GregsonRaevan_CE1
//
//  Created by Raevan Gregson on 11/27/16.
//  Copyright © 2016 Raevan Gregson. All rights reserved.
//

import UIKit

private let cellIdentifier = "Cell"
private let headerIdentifier = "Header"


//Arrays to hold Data for cells - in this case the data will be three different arrays for each section - Three different types of pokemon Fire, Water and Grass
var water: [Pokemon] = []
var fire: [Pokemon] = []
var grass: [Pokemon] = []

var pokemon:Pokemon?

class TableTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //this is where I load in the data to the arrays, I create 5 pokemon for each section and then insert it into the proper array type depending on which section the pokemon belong too
        
        //create 5 water type pokemon
        let squirtle = Pokemon(name:"Squirtle", type:"Water", species:"Tiny Turtle",image: #imageLiteral(resourceName: "squirtle"), pokedexNumber:7)
        let gyarados = Pokemon(name:"Gyarados", type:"Water", species:"Atrocious",image: #imageLiteral(resourceName: "Gyarados"), pokedexNumber:130)
        let goldeen = Pokemon(name:"Goldeen", type:"Water", species:"Goldfish",image: #imageLiteral(resourceName: "Goldeen"), pokedexNumber:118)
        let lapras = Pokemon(name:"Lapras", type:"Water", species:"Transport",image: #imageLiteral(resourceName: "Lapras"), pokedexNumber:131)
        let starmie = Pokemon(name:"Starmie", type:"Water", species:"Mysterious",image: #imageLiteral(resourceName: "Starmie"), pokedexNumber:121)
        //insert into watertype array
        water = [squirtle,gyarados,goldeen,lapras,starmie]
        
        //create 5 fire type pokemon
        let charmander = Pokemon(name:"Charmander", type:"Fire", species:"Lizard",image: #imageLiteral(resourceName: "Charmander"), pokedexNumber:4)
        let charizard = Pokemon(name:"Charizard", type:"Fire", species:"Flame",image: #imageLiteral(resourceName: "Charizard"), pokedexNumber:6)
        let flareon = Pokemon(name:"Flareon", type:"Fire", species:"Flame",image: #imageLiteral(resourceName: "Flareon"), pokedexNumber:136)
        let ponyta = Pokemon(name:"Ponyta", type:"Fire", species:"Fire Horse",image: #imageLiteral(resourceName: "Ponyta"), pokedexNumber:77)
        let vulpix = Pokemon(name:"Vulpix", type:"Fire", species:"Fox",image: #imageLiteral(resourceName: "Vulpix"), pokedexNumber:37)
        //insert into firetype array
        fire = [charmander, charizard,flareon,ponyta,vulpix]
        
        //create 5 grass type pokemon
        let bulbasuar = Pokemon(name:"Bulbasaur", type:"Grass", species:"Seed",image: #imageLiteral(resourceName: "bulbasaur"), pokedexNumber:1)
        let oddish = Pokemon(name:"Oddish", type:"Grass", species:"Weed",image: #imageLiteral(resourceName: "Oddish"), pokedexNumber:43)
        let bellsprout = Pokemon(name:"Bellsprout", type:"Grass", species:"Flower",image: #imageLiteral(resourceName: "Bellsprout"), pokedexNumber:69)
        let exeggutor = Pokemon(name:"Exeggutor", type:"Grass", species:"Coconut",image: #imageLiteral(resourceName: "Exeggutor"), pokedexNumber:103)
        let tangela = Pokemon(name:"Tangela", type:"Grass", species:"Vine",image: #imageLiteral(resourceName: "tangela"), pokedexNumber:114)
        //insert into grass type array
        grass = [bulbasuar, oddish,bellsprout,exeggutor,tangela]
        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        tableView.register(UINib(nibName: "CustomHeader", bundle: nil), forHeaderFooterViewReuseIdentifier: headerIdentifier)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 3
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 5
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! Cell
       
        // Since I have 3 sections I use three if statements to distinguish each one and properly load the correct values from my array using the indexpath.row as the index value for the array.
        if indexPath.section == 00{
            cell.pokeType.text = water[indexPath.row].name
            cell.typeImage.image = water[indexPath.row].image
            cell.pokeNumber.text = String(describing: water[indexPath.row].pokedexNumber!)
        }
        
        if indexPath.section == 01{
            cell.pokeType.text = fire[indexPath.row].name
            cell.typeImage.image = fire[indexPath.row].image
            cell.pokeNumber.text = String(describing: fire[indexPath.row].pokedexNumber!)
        }
        
        if indexPath.section == 02{
            cell.pokeType.text = grass[indexPath.row].name
            cell.typeImage.image = grass[indexPath.row].image
            cell.pokeNumber.text = String(describing: grass[indexPath.row].pokedexNumber!)
        }
        
        
        
        // Configure the cell...
        return cell
    }
    
    //size the custom headers
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 100
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: headerIdentifier ) as! CustomHeader
        
        //configure the header title dependent upon sections with if statements
        if section == 00{
        header.type.text = "Water"
        header.typeImage.image = #imageLiteral(resourceName: "water")
        }
        else if section == 01{
        header.type.text = "Fire"
        header.typeImage.image = #imageLiteral(resourceName: "flame")
        }
        else{
        header.type.text = "Plant"
        header.typeImage.image = #imageLiteral(resourceName: "plant")
        }
        
        return header
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //this is where I configure what information to load into the detail view dependent upon which row in which section is selected. First I load the information into an object holder.
        if indexPath.section == 00{
            pokemon = water[indexPath.row]
        }
        else if indexPath.section == 01{
           pokemon = fire[indexPath.row]
        }
        else{
            pokemon = grass[indexPath.row]
        }
        
        //after I load the correct pokemon into the holder, I then perform the segue - which will trigger the prepareforsegue method
        self.performSegue(withIdentifier: "detailView", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let pokemonDetail = segue.destination as! DetailViewController
        
        //at this point I make sure to transfer the pokemon object to a pokemon object holder inside of the detailview and THEN the segue is performed
        pokemonDetail.pokemon = pokemon
        
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
