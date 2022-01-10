//
//  SearchButton.swift
//  Map
//
//  Created by Silvia España on 10/1/22.
//

import SwiftUI

struct SearchButton: ButtonStyle {
    
    typealias Body = Button
    
    @Environment(\.isEnabled)  var isEnabled: Bool
    
    func makeBody(configuration: Self.Configuration) -> some View {
        
        if configuration.isPressed {
            return configuration
                .label
                .padding()
                .background(isEnabled ? Color("LightRose") : Color.clear)
                .foregroundColor(isEnabled ? Color("Green") : Color.clear)
                .clipShape(RoundedRectangle(cornerRadius: 10))
        } else {
            return configuration
                .label
                .padding()
                .background(isEnabled ? Color("Green") : Color.clear)
                .foregroundColor(isEnabled ? Color("LightRose") : Color.clear)
                .clipShape(RoundedRectangle(cornerRadius: 10))
        }
    }
}
