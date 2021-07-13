//
//  ViewController.swift
//  Yelpy
//
//  Created by Memo on 5/21/20.
//  Copyright © 2020 memo. All rights reserved.
//

import UIKit
import AlamofireImage

class RestaurantsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurantsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RestaurantCell") as! RestaurantCell
        
        let restaurant = restaurantsArray[indexPath.row]
        cell.label.text = restaurant["name"] as? String ?? ""
        if let imageUrlString = restaurant["image_url"] as? String {
            let imageUrl = URL(string: imageUrlString)
            cell.restaurantImage.af.setImage(withURL: imageUrl!)
        }
        
        
        let rating = restaurant["rating"]!!
        
        
        let float_rating = rating as! Float
        
        if float_rating >= 5 {
            cell.ratingImage.image = UIImage(named: "regular_5.png")
        }
        else if float_rating >= 4.5 {
            cell.ratingImage.image = UIImage(named: "regular_4_half.png")
        }
        else if float_rating >= 4 {
            cell.ratingImage.image = UIImage(named: "regular_4.png")
        }
        else if float_rating >= 3.5 {
            cell.ratingImage.image = UIImage(named: "regular_3_half.png")
        }
        else if float_rating >= 3 {
            cell.ratingImage.image = UIImage(named: "regular_3.png")
        }
        else if float_rating >= 2.5 {
            cell.ratingImage.image = UIImage(named: "regular_2_half.png")
        }
        else if float_rating >= 2 {
            cell.ratingImage.image = UIImage(named: "regular_2.png")
        }
        else if float_rating >= 1.5 {
            cell.ratingImage.image = UIImage(named: "regular_1_half.png")
        }
        else if float_rating >= 1 {
            cell.ratingImage.image = UIImage(named: "regular_1.png")
        }
        else {
            cell.ratingImage.image = UIImage(named: "regular_0.png")
        }
        
        let phone_number = restaurant["display_phone"]!! as! String
        cell.phoneLabel.text = phone_number
        
        let typeString = (((restaurant["categories"]!! as! [Any])[0]) as! Dictionary<String, Any>)["title"]! as! String
        cell.typeLabel.text = typeString
        
        let reviewsString = restaurant["review_count"]!!
        cell.reviewsLabel.text = "\(reviewsString)"
        
        return cell
    }
    
    
    // ––––– TODO: Add storyboard Items (i.e. tableView + Cell + configurations for Cell + cell outlets)
    // ––––– TODO: Next, place TableView outlet here
    
    @IBOutlet weak var tableView: UITableView!
    
    // –––––– TODO: Initialize restaurantsArray
    var restaurantsArray : [[String:Any?]] = []
    
    
    // ––––– TODO: Add tableView datasource + delegate
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        getAPIData()
    
    }
    
    
    // ––––– TODO: Get data from API helper and retrieve restaurants
    func getAPIData() {
        API.getRestaurants() {
            (restaurants) in guard let restaurants = restaurants else {
                return
            }
            self.restaurantsArray = restaurants
            self.tableView.reloadData()
        }
    }
    

}

// ––––– TODO: Create tableView Extension and TableView Functionality


