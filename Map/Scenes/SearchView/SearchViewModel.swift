//
//  SearchViewModel.swift
//  Map
//
//  Created by Silvia España on 10/1/22.
//

import Foundation
import MapKit

class SearchViewModel: ObservableObject {
    
    @Published var latitudeString: String = ""
    @Published var longitudeString: String = ""
    @Published var searchIsDone: Bool = false
    
    var latitude: Double = 0.0
    var longitude : Double = 0.0
    var mapRegion: MKCoordinateRegion
    
    init(mapRegion: MKCoordinateRegion) {
        
        self.mapRegion = mapRegion
    }
    
    var formIsEmpty: Bool {
        
        latitudeString.isEmpty || longitudeString.isEmpty
    }
   
    func saveSearch(){
        
        self.latitude = CLLocationDegrees(latitudeString) ?? 0.0
        self.longitude = CLLocationDegrees(longitudeString) ?? 0.0
        mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: self.latitude, longitude: longitude), span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
    }
}

