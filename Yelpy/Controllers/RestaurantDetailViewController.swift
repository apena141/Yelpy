//
//  RestaurantDetailViewController.swift
//  Yelpy
//
//  Created by Anthony Pena on 7/10/21.
//  Copyright © 2021 memo. All rights reserved.
//

import UIKit

class RestaurantDetailViewController: UIViewController {
    
    var r: Restaurant!
    @IBOutlet weak var restaurantImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        restaurantImage.af.setImage(withURL: r!.imageURL!)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
