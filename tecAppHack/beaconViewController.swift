//
//  beaconViewController.swift
//  tecAppHack
//
//  Created by Mm on 27/08/17.
//  Copyright © 2017 Mm. All rights reserved.
//

import UIKit
import CoreLocation

class beaconView: UIView , CLLocationManagerDelegate{
    
    var locationManager = CLLocationManager()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        locationManager.delegate = self
        locationManager.requestAlwaysAuthorization()
        
    }
    
    func rangeBeacons(){
        
        let uuid = UUID(uuidString: "B9407F30-F5F8-466E-AFF9-25556B57FE6D")
        let major: CLBeaconMajorValue = 36945
        let minor: CLBeaconMinorValue = 51418
        let identifier = "d38ec8da9051"
        
        
        let region = CLBeaconRegion(proximityUUID: uuid!, major: major, minor: minor, identifier: identifier)
        
         locationManager.startRangingBeacons(in: region)
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedAlways {
            rangeBeacons()
        }
    }
    
    func newLocation(){
        let backgroundImg: UIImageView = {
            let img = UIImageView()
            img.image = UIImage(named: "bibliotecaBg")
            return img
        }()
        
        addSubview(backgroundImg)
        constraintsFormat(format: "H:|[v0]|", views: backgroundImg)
        constraintsFormat(format: "V:|[v0]|", views: backgroundImg)
        
        
    }
    
    func locationManager(_ manager: CLLocationManager, didRangeBeacons beacons: [CLBeacon], in region: CLBeaconRegion) {
        guard let discoveredBeacon = beacons.first?.proximity else {
            print("Beacon not found"); return }
        
        newLocation()
    }

}


class beaconViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet var exploreButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    func menuBar(){
        let menu: UIView = {
        
            let view = UIView()
            view.backgroundColor = UIColor(displayP3Red: 51/255, green: 153/255, blue: 255/255, alpha: 1)
            
            return view
        }()
        
        view.addSubview(menu)
        view.constraintsFormat(format: "H:|[v0]|", views: menu)
        view.constraintsFormat(format: "V:|[v0(20)]|", views: menu)
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

extension UIView {
    func constraintsFormat(format: String, views: UIView...){
        var viewsList = [String: UIView]()
        for(index, view) in views.enumerated() {
            let key = "v\(index)"
            view.translatesAutoresizingMaskIntoConstraints = false
            viewsList[key] = view
        }
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutFormatOptions(), metrics: nil, views: viewsList))
    }
}
