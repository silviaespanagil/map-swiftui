//
//  SearchViewModel.swift
//  Map
//
//  Created by Silvia España on 10/1/22.
//

import Foundation
import SwiftUI

class SearchViewModel: ObservableObject {
    
    @Published var latitudeString: String = ""
    @Published var longitudeString: String = ""
    @Published var searchIsDone: Bool = false
    
    var formIsEmpty: Bool {
        
        latitudeString.isEmpty || longitudeString.isEmpty
    }
}
