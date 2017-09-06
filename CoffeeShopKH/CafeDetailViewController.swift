//
//  CafeDetailViewController.swift
//  CoffeeShopKH
//
//  Created by Weiling Chang on 04/09/2017.
//  Copyright © 2017 Lynne. All rights reserved.
//

import UIKit
import MapKit

class CafeDetailViewController: UIViewController,MKMapViewDelegate {
    
    var cafedetail: Cafe!
    
 
    @IBOutlet weak var cafeMapView: MKMapView!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var wifiLabel: UILabel!
    @IBOutlet weak var seatLabel: UILabel!
    @IBOutlet weak var quietLabel: UILabel!
    @IBOutlet weak var tastyLabel: UILabel!
    @IBOutlet weak var cheapLabel: UILabel!
    @IBOutlet weak var musicLabel: UILabel!
    @IBOutlet weak var urlLabel: UILabel!
    
    
    
    func updateUI(){
        navigationItem.title = cafedetail.cafename
        addressLabel.text = cafedetail.cafeaddress
        wifiLabel.text = String(cafedetail.cafewifi)
        seatLabel.text = String(cafedetail.cafeseat)
        quietLabel.text = String(cafedetail.cafequiet)
        tastyLabel.text = String(cafedetail.cafetasty)
        cheapLabel.text = String(cafedetail.cafecheap)
        musicLabel.text = String(cafedetail.cafemusic)
        urlLabel.text = cafedetail.cafeweburl
        
        let annotation = MKPointAnnotation()
        annotation.title = cafedetail.cafename
        annotation.subtitle = cafedetail.cafeaddress
        annotation.coordinate = CLLocationCoordinate2D(latitude: Double(cafedetail.cafeLatitude)!, longitude: Double(cafedetail.cafeLongitude)!)
        let region = MKCoordinateRegionMakeWithDistance(annotation.coordinate , 10000, 10000)
        cafeMapView.region = region
        cafeMapView.addAnnotation(annotation)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
