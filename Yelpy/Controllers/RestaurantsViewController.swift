//
//  ViewController.swift
//  Yelpy/Users/anthony/Downloads/yelpy_starter_1/Yelpy/Cells/RestaurantCell.swift
//
//  Created by Memo on 5/21/20.
//  Copyright © 2020 memo. All rights reserved.
//

import UIKit
import AlamofireImage

class RestaurantsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    // ––––– TODO: Add storyboard Items (i.e. tableView + Cell + configurations for Cell + cell outlets)
    // ––––– TODO: Next, place TableView outlet here

    // –––––– TODO: Initialize restaurantsArray
    var restaurantArray: [Restaurant?] = []
    
    // ––––– TODO: Add tableView datasource + delegate
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        getApiData()
    }
    
    // ––––– TODO: Get data from API helper and retrieve restaurants
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurantArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RestaurantCell") as! RestaurantCell
        
        let restaurant = restaurantArray[indexPath.row]
        
        cell.r = restaurant
        
        return cell
    }
    
    func getApiData(){
        API.getRestaurants(){ (restaurants) in
            guard let restaurants = restaurants else{
                return
            }
            self.restaurantArray = restaurants
            self.tableView.reloadData()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let cell = sender as! UITableViewCell
        if let indexPath = tableView.indexPath(for: cell){
            let r = restaurantArray[indexPath.row]
            let detailViewController = segue.destination as! RestaurantDetailViewController
            detailViewController.r = r
        }
    }
}

// ––––– TODO: Create tableView Extension and TableView Functionality


