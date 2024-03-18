//
//  Maden.swift
//  PolimatsUI
//
//  Created by Atakan Başaran on 11.03.2024.
//

import SwiftUI

struct MadeIn: View {
    
    var body: some View {
        
        Text("App version 3.0 Build infinite \nMade with love in Turkey \nby Atakan Başaran")
            .font(.custom("Roboto-Regular", size: 14))
            .multilineTextAlignment(.center)

    }
}

#Preview {
    MadeIn()
}
