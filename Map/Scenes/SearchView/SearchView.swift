//
//  SearchView.swift
//  Map
//
//  Created by Silvia España on 10/1/22.
//

import SwiftUI
import Combine
import MapKit

struct SearchView: View {
    
    @StateObject var viewModel: SearchViewModel
    
    var body: some View {
        
        VStack {
            
            NavigationView {
                
                Form {
                    
                    TextField("Enter latitude", text: $viewModel.latitudeString)
                        .keyboardType(.numbersAndPunctuation)
                        
                    TextField("Enter longitude", text: $viewModel.longitudeString)
                        .keyboardType(.numbersAndPunctuation)
                    
                    if !viewModel.formIsEmpty {
                        
                        HStack {
                            
                            Button(action:{
                                
                                viewModel.searchIsDone = true
                                viewModel.areCoordinatesValid()
                                viewModel.saveSearch()
                            }) {
                                
                                HStack(alignment:.center) {
                                    
                                    Spacer()
                                    Image(systemName: "airplane")
                                    Text("Search place")
                                    Spacer()
                                }
                            }.disabled(viewModel.formIsEmpty)
                                .buttonStyle(SearchButton())
                        }
                    }
                }
                .navigationTitle("Search any place")
            }
            
            if viewModel.searchIsDone {
                
                if viewModel.isSearchValid {
                    
                    Map(coordinateRegion: $viewModel.mapRegion)
                } else {
                    
                    VStack {
                        
                        Text("You must only enter numbers. For example").padding()
                        Form {
                            TextField("Enter latitude", text: $viewModel.latitudeExampleString)
                            TextField("Enter longitude", text: $viewModel.longitudeExampleString)
                        }.disabled(true)
                        Spacer()
                    }
                }
            }
        }
    }
}
