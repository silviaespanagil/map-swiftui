//
//  MapApp.swift
//  Map
//
//  Created by Silvia España on 10/1/22.
//

import SwiftUI

@main
struct MapApp: App {
    var body: some Scene {
        WindowGroup {
            SearchView(viewModel: SearchViewModel())
        }
    }
}
