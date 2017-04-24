//
//  ViewController.swift
//  JsonDemo1
//
//  Created by Asif Ikbal on 4/24/17.
//  Copyright © 2017 Asif Ikbal. All rights reserved.
//
// Visual json software 


import UIKit

class ViewController: UITableViewController {

    
    var foodArray = [[String : String]]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let pathToFile = Bundle.main.url(forResource: "simple", withExtension: "json")
        
        do {
            let data =  try Data(contentsOf: pathToFile!)
            let jsonRoot = try JSONSerialization.jsonObject(with: data, options: [] ) as? [String: Any]
            print(jsonRoot!)
            
            let valueForMenu = jsonRoot?["menu"] as? [String: Any]
            //print(valueForMenu!)

            foodArray = (valueForMenu?["food"] as? [[String: String]])!
            //print(foodArray)
            
            
            
        }
        catch {
            print(error)
        }

    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foodArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        
        let foodObj = foodArray[indexPath.row]
        
        let foodModelObj = FoodModel(food: foodObj)
//        guard let name = foodObj["name"],
//              let descr = foodObj["description"] else {
//            return cell!
//        }
//        
        cell?.textLabel?.text = foodModelObj?.name
        cell?.detailTextLabel?.text = foodModelObj?.description
        return cell!
    }


}

