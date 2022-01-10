//
//  SearchView.swift
//  Map
//
//  Created by Silvia España on 10/1/22.
//

import SwiftUI

struct SearchView: View {
    
    @StateObject var viewModel: SearchViewModel
    
    var body: some View {
        
        if viewModel.searchIsDone { ContentView()}
        
        else {
            
            NavigationView {
                
                Form {
                    
                    TextField("Enter latitude", text: $viewModel.latitudeString)
                    TextField("Enter longitude", text: $viewModel.longitudeString)
                    
                    HStack {
                        
                        Button(action:{
                            viewModel.searchIsDone = true
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
        }
    }
}


struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(viewModel: SearchViewModel())
    }
}
