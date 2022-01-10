//
//  SearchView.swift
//  Map
//
//  Created by Silvia España on 10/1/22.
//

import SwiftUI
import MapKit

struct SearchView: View {
    
    @StateObject var viewModel: SearchViewModel
    @Environment(\.isEnabled)  var isEnabled: Bool
   
    var body: some View {
        
        if viewModel.searchIsDone {
            
            VStack {
                
                NavigationView {
                    
                    Form {
                        
                        TextField("Enter latitude", text: $viewModel.latitudeString)
                        TextField("Enter longitude", text: $viewModel.longitudeString)
                        
                        HStack {
                            
                            Button(action:{
                                viewModel.searchIsDone = true
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
                Map(coordinateRegion: $viewModel.mapRegion)
            }
        } else {
            
            NavigationView {
                Form {
                    
                    TextField("Enter latitude", text: $viewModel.latitudeString)
                    TextField("Enter longitude", text: $viewModel.longitudeString)
                    
                    HStack {
                        
                        Button(action:{
                            viewModel.searchIsDone = true
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
                .navigationTitle("Search any place")
            }
        }
    }
}
