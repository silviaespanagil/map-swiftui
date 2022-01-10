//
//  SearchButton.swift
//  Map
//
//  Created by Silvia España on 10/1/22.
//

import SwiftUI

struct SearchButton: ButtonStyle {
    
    typealias Body = Button

    func makeBody(configuration: Self.Configuration) -> some View {
        
        if configuration.isPressed {
            return configuration
                .label
                .padding()
                .background(Color("Silver"))
                .foregroundColor(Color("LightRose"))
                .clipShape(RoundedRectangle(cornerRadius: 10))
        } else {
            return configuration
                .label
                .padding()
                .background(Color("Green"))
                .foregroundColor(Color("LightRose"))
                .clipShape(RoundedRectangle(cornerRadius: 10))
        }
    }
}
