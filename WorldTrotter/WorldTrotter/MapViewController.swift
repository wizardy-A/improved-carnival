//
//  MapViewController.swift
//  WorldTrotter
//
//  Created by Matvii Hodovaniuk on 7/30/19.
//  Copyright © 2019 Matvii Hodovaniuk. All rights reserved.
//

import MapKit
import UIKit

// TODO: add WKWebView
// TODO: add a button to zoom to user's current location
// TODO: add several pins and button to switch between them

class MapViewController: UIViewController {
    var mapView: MKMapView!

    override func loadView() {
        // Create a map view
        mapView = MKMapView()

        // Set it as *the* view of this view controller
        view = mapView

        let segmentedControl = UISegmentedControl(items: ["Standart", "Hybrid", "Satelite"])

        segmentedControl.backgroundColor = UIColor.white.withAlphaComponent(0.5)

        segmentedControl.selectedSegmentIndex = 0

        segmentedControl.translatesAutoresizingMaskIntoConstraints = false

        segmentedControl.addTarget(self, action: #selector(mapTypeChanged), for: .valueChanged)

        view.addSubview(segmentedControl)

        let guide = segmentedControl

        let topConstraint = guide.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        let leadingConstraint = guide.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        let trailingConstraint = guide.trailingAnchor.constraint(equalTo: view.trailingAnchor)

        topConstraint.isActive = true
        leadingConstraint.isActive = true
        trailingConstraint.isActive = true
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        print("MapViewController loaded its view.")
    }

    @objc func mapTypeChanged(_ segControl: UISegmentedControl){
        switch segControl.selectedSegmentIndex {
        case 0:
            mapView.mapType = .standard
        case 1:
            mapView.mapType = .hybrid
        case 2:
            mapView.mapType = .satellite
        default:
            break
        }
    }
}
