//
//  LocationEntity.swift
//  Map
//
//  Created by Silvia España on 10/1/22.
//

import Foundation
import MapKit

struct Location: Identifiable {
    let id = UUID()
    let coordinate: CLLocationCoordinate2D
}
