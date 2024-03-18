//
//  LoadingView.swift
//  PolimatsUI
//
//  Created by Atakan Başaran on 5.02.2024.
//

import SwiftUI

struct LoadingViewLogo: View {
    
    @Environment(\.colorScheme) var colorScheme
    @State var animation = false
    
    var body: some View {
        
        ZStack {
            Color(.systemBackground)
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                Image(colorScheme == .light ? "polimats-black" : "polimats-white")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150, height: 150, alignment: .center)
                    .rotationEffect(.degrees(animation ? 360 : 0), anchor: .center)
                    .offset(y: animation ? 0 : -550)
                    .shadow(radius: 10)
                    .onAppear(perform: {
                        withAnimation(.easeInOut(duration: 3).repeatForever()) {
                            self.animation = true
                        }
                    })
                
                Spacer()
                
                VStack(alignment: .center,spacing: 5) {
                    Text("Bildiğinizden daha fazlası")
                        .font(.custom("Roboto-Regular", size: 18))
                    
                    Text("polimats.com")
                        .font(.custom("Roboto-Bold", size: 18))
                }
                .padding(.bottom, 55)
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    LoadingViewLogo()
}
