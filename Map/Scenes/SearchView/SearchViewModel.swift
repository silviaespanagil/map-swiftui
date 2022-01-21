//
//  SearchViewModel.swift
//  Map
//
//  Created by Silvia España on 10/1/22.
//

import Foundation
import MapKit
import SwiftUI

class SearchViewModel: ObservableObject {
    
    @Published var latitudeString: String = ""
    @Published var longitudeString: String = ""
    @Published var latitudeExampleString: String = "42.34"
    @Published var longitudeExampleString: String = "-7.86"
    @Published var searchIsDone: Bool = false
    
    var latitude: Double = 0.0
    var longitude : Double = 0.0
    var mapRegion: MKCoordinateRegion
    var isSearchValid: Bool = true
    
    let regex = try! NSRegularExpression(pattern: "[0-9]-")
    
    init(mapRegion: MKCoordinateRegion) {
        
        self.mapRegion = mapRegion
    }
    
    var formIsEmpty: Bool {
        
        latitudeString.isEmpty || longitudeString.isEmpty
    }
    
    func validateCoordinates(text: String) -> Bool {
        
        var valid: Bool = true
        let numberRegex = "^[0-9.-]{1,10}$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", numberRegex)
        
        if !predicate.evaluate(with: text) {
            valid = false
        }
        
        return valid
    }
    
    //unc CLLocationCoordinate2DIsValid(_ coord: CLLocationCoordinate2D) -> Bool
    
    func areCoordinatesValid() {
        
        self.latitude = CLLocationDegrees(latitudeString) ?? 0.0
        self.longitude = CLLocationDegrees(longitudeString) ?? 0.0
        
        if validateCoordinates(text: latitudeString) && validateCoordinates(text: longitudeString) {
            //validate location exist
            return isSearchValid = true
        }
        
        else {
            
            return isSearchValid = false
        }
    }
    
    func saveSearch() {

        mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: self.latitude, longitude: longitude), span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))

    }
    
}
