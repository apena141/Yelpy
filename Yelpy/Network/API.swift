//
//  File.swift
//  Yelpy
//
//  Created by Memo on 5/21/20.
//  Copyright © 2020 memo. All rights reserved.
//

import Foundation


struct API {
    

    
    static func getRestaurants(completion: @escaping ([[String:Any]]?) -> Void) {
        
        // ––––– TODO: Add your own API key!
        let apikey = "p6daKD4la_chVwwAQi9jrSW6L6eW0F07cFfyvCBKj--S6RPF8NY17SRfi6fjOk3S-ZVscEvp-usBwxy0BJvfqQoBFk5ROYjZZXw031jlS6f66AJYMo8J7jpGcZXgYHYx"
        // Coordinates for San Francisco
        let lat = 37.773972
        let long = -122.431297
        
        print("ApiKey: \(apikey)")
        
        let url = URL(string: "https://api.yelp.com/v3/transactions/delivery/search?latitude=\(lat)&longitude=\(long)")!
        
        var request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        
        // Insert API Key to request
        request.setValue("Bearer \(apikey)", forHTTPHeaderField: "Authorization")
        
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
            // This will run when the network request returns
            if let error = error {
                print(error.localizedDescription)
            } else if let data = data {
    
                // Converts json to a dictionary
                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String:Any]
                
                // Grabs businesses data and covert it to an array of dictionaries
                let restaurants = dataDictionary["businesses"] as! [[String:Any]]
                
                // Completion is an escaping method that allos the data to be used outside of the closure
                return completion(restaurants)
                }
            }
        
            task.resume()
        
        }
    }

    
