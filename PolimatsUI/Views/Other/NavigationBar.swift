//
//  NavigationBar.swift
//  PolimatsUI
//
//  Created by Atakan Başaran on 4.02.2024.
//

import SwiftUI

struct NavigationBar: View {
    
    @Environment(\.colorScheme) var colorScheme
    @State var animation = true
    @EnvironmentObject var mainVM: MainPageViewModel
    
    var body: some View {
        
        HStack {
            Image(colorScheme == .light ? "polimats-black" : "polimats-white")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 55, height: 55, alignment: .center)
                .rotationEffect(.degrees(animation ? 0 : 360), anchor: .center)
//                .shadow(radius: 5)
            
                .onAppear {
                    if !mainVM.isLoadingLogo {
                        withAnimation(.easeInOut(duration: 2).delay(1.5)) {
                            self.animation = false
                        }
                    }
                }
            
                .onChange(of: mainVM.isLoadingLogo) { _ in
                    withAnimation(.easeInOut(duration: 2).delay(1.5)) {
                        self.animation = false
                    }
                }

            
            
            Text("polimats")
//                .font(.custom("Roboto-Medium", size: 22))
                .font(.custom("Comfortaa-Bold", size: 28))
//                .shadow(radius: 5)
                
        }
        .frame(width: 380, height: 35, alignment: .leading)
        .padding(.leading, 25)
        .padding(.top, 5)
    }
}

#Preview {
    NavigationBar()
}
