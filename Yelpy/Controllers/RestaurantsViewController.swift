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
    var restaurantArray: [[String:Any?]] = []
    
    
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
        print(restaurant)
        let reviewCount = restaurant["review_count"] as! Int
        cell.reviewCount.text = "\(reviewCount)"
        cell.restaurantLabel.text = restaurant["name"] as? String ?? ""
        cell.phoneLabel.text = restaurant["display_phone"] as?
            String ?? ""
        
        let categories = restaurant["categories"] as? [Any]
        //print("Category for \(cell.restaurantLabel.text) categories: \(categories)")
        let firstCategory = categories![0] as? [String:Any]
        //print("First: \(firstCategory)")
        cell.categoryLabel.text = firstCategory!["title"] as? String
        
        // Gets image from restaurant dictionary as a string
        if let imageUrlString = restaurant["image_url"] as? String{
            // casts imageUrl as a URL from the string we got above
            let imageUrl = URL(string: imageUrlString)
            cell.restaurantImage.af.setImage(withURL: imageUrl!)
        }
        
        let rating = restaurant["rating"] as? Double
        print("Rating \(rating)")
        switch rating {
            case 0.5:
                var ratingImage = UIImage(named: "regular_0")
                cell.ratingImage.image = ratingImage
                break;
            case 1.0:
                var ratingImage = UIImage(named: "regular_1")
                cell.ratingImage.image = ratingImage
                break;
            case 1.5:
                var ratingImage = UIImage(named: "regular_1_half")
                cell.ratingImage.image = ratingImage
                break;
            case 2.0:
                var ratingImage = UIImage(named: "regular_2")
                cell.ratingImage.image = ratingImage
                break;
            case 2.5:
                var ratingImage = UIImage(named: "regular_2_half")
                cell.ratingImage.image = ratingImage
                break;
            case 3.0:
                var ratingImage = UIImage(named: "regular_3")
                cell.ratingImage.image = ratingImage
                break;
            case 3.5:
                var ratingImage = UIImage(named: "regular_3_half")
                cell.ratingImage.image = ratingImage
                break;
            case 4.0:
                var ratingImage = UIImage(named: "regular_4")
                cell.ratingImage.image = ratingImage
                break;
            case 4.5:
                var ratingImage = UIImage(named: "regular_4_half")
                cell.ratingImage.image = ratingImage
                break;
            case 5.0:
                var ratingImage = UIImage(named: "regular_5")
                cell.ratingImage.image = ratingImage
                break;
            default:
                var ratingImage = UIImage(named: "regular_0")
                cell.ratingImage.image = ratingImage
                break;
        }
        
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
}

// ––––– TODO: Create tableView Extension and TableView Functionality


