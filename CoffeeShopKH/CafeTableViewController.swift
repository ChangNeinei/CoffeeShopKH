//
//  CafeTableViewController.swift
//  CoffeeShopKH
//
//  Created by Weiling Chang on 03/09/2017.
//  Copyright © 2017 Lynne. All rights reserved.
//

import UIKit
import CoreLocation

class CafeTableViewController: UITableViewController {
    
    //var cafesName: [String] = []
    //var cafesAddress: [String] = []
    var cafesArray = [Cafe]()
    let locationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let urlStr = "https://cafenomad.tw/api/v1.2/cafes/kaohsiung".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        let url = URL(string: urlStr!)
        let task = URLSession.shared.dataTask(with: url!) {(data, response, error) in
            if let data = data, let resultArray = (try? JSONSerialization.jsonObject(with: data, options: [])) as? [[String: Any]] {
                DispatchQueue.main.async {
                    for coffeeshop in resultArray{
                        //self.cafesName.append(coffeeshop["name"] as! String)
                        if let cafe = Cafe(json: coffeeshop){
                            self.cafesArray.append(cafe)
                        }
                    }
                    /*
                    for coffeeshop in resultArray{
                        self.cafesAddress.append(coffeeshop["address"] as! String)
                    }*/
                    
                    self.tableView.reloadData()
                }
                
            }
        }
        task.resume()
        locationManager.requestWhenInUseAuthorization()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        //return cafesName.count
        return cafesArray.count
    }
    
    func configure(cell: UITableViewCell, forItemAt indexPath: IndexPath){
        //let cafeName = cafesName[indexPath.row]
        //let cafeAddress = cafesAddress[indexPath.row]
        let cafe = cafesArray[indexPath.row]
        //cell.textLabel?.text = cafeName
        //cell.detailTextLabel?.text = cafeAddress
        cell.textLabel?.text = cafe.cafename
        cell.detailTextLabel?.text = cafe.cafeaddress
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cafeCell", for: indexPath)

        // Configure the cell...
        configure(cell: cell, forItemAt: indexPath)
        return cell
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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if let cafeDetailViewController = segue.destination as? CafeDetailViewController, let row = tableView.indexPathForSelectedRow?.row {
            cafeDetailViewController.cafedetail = cafesArray[row]
        }
    }
    

}
