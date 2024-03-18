//
//  loadingScreen.swift
//  PolimatsUI
//
//  Created by Atakan Başaran on 9.02.2024.
//

import SwiftUI

struct loadingScreen: View {
    
    @Environment(\.colorScheme) var colorScheme
    @State var animation = false
    
    var body: some View {
        
        ZStack {
            Color(.systemBackground)
                .ignoresSafeArea()
            
            Image(colorScheme == .light ? "polimats-black" : "polimats-white")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100, alignment: .center)
                .rotationEffect(.degrees(animation ? 360 : 0), anchor: .center)
                .onAppear(perform: {
                    withAnimation(.easeInOut(duration: 1).repeatForever()) {
                        self.animation = true
                    }
                })
        }
    }
}

#Preview {
    loadingScreen()
}
