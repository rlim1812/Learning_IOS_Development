//
//  MapViewController.swift
//  WorldTrotter
//
//  Created by Ryan Lim on 6/29/16.
//  Copyright © 2016 Big Nerd Ranch. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    
    var mapView: MKMapView!
    
    func mapTypeChanged(segControl: UISegmentedControl){
        
        switch segControl.selectedSegmentIndex {
            
        case 0:
            mapView.mapType = .Standard
        case 1:
            mapView.mapType = .Hybrid
        case 2:
            mapView.mapType = .Satellite
        default:
            break
            
        }
    }
    
    override func loadView(){
        
        //create a map view
        mapView = MKMapView()
        
        //make the map view the view controller's view
        view = mapView
        
        //segmented control
        let standardString = NSLocalizedString("Standard", comment: "Standard map view")
        let satelliteString = NSLocalizedString("Satellite", comment: "Satellite map view")
        let hybridString = NSLocalizedString("Hybrid", comment: "Hybrid map view")
        let segmentedControl = UISegmentedControl(items: [standardString, satelliteString, hybridString])
        
        segmentedControl.backgroundColor
            = UIColor.whiteColor().colorWithAlphaComponent(0.5)
        segmentedControl.selectedSegmentIndex = 0
        
        
        segmentedControl.addTarget(self, action: #selector(mapTypeChanged(_:)), forControlEvents: .ValueChanged)
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(segmentedControl)
 
        
        //constraints 
        let topConstraint =
            segmentedControl.topAnchor.constraintEqualToAnchor(topLayoutGuide.bottomAnchor,
                                                               constant: 8)
        let margins = view.layoutMarginsGuide
        let leadingConstraint =
            segmentedControl.leadingAnchor.constraintEqualToAnchor(margins.leadingAnchor)
        let trailingConstraint =
            segmentedControl.trailingAnchor.constraintEqualToAnchor(margins.trailingAnchor)
        
        
        topConstraint.active = true
        leadingConstraint.active = true
        trailingConstraint.active = true
    }
    
    override func viewDidLoad(){
        //always call the super implementation of viewDidLoad
        super.viewDidLoad()
        print("MapViewController loaded its view")
    }
}
