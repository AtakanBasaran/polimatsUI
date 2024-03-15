//
//  NoConnection.swift
//  PolimatsUI
//
//  Created by Atakan Başaran on 26.02.2024.
//

import SwiftUI
import Lottie

struct NoConnection: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        
        ZStack {
            Color(.systemBackground)
            
            VStack(spacing: 10) {
                
                LottieView(animation: .named("wifi"))
                    .looping()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
                    .padding(.bottom, 5)
                
                
                Text("Bağlantı hatası")
                    .multilineTextAlignment(.center)
                    .font(.custom("Roboto-Bold", size: 22))
                    .foregroundStyle(colorScheme == .dark ? .white : .black)
                
                Text("Sunucuya bağlanılamıyor. İnternet bağlantını kontrol et ve tekrar dene.")
                    .multilineTextAlignment(.center)
                    .font(.custom("Roboto-Regular", size: 19))
                    .foregroundStyle(.secondary)
                    .padding(.horizontal, 15)
                    .padding(.top, 5)
                
                
            }
            .offset(y: -20)

            
        }
        .ignoresSafeArea()

    }
}

#Preview {
    NoConnection()
}
