//
//  NavigationBar.swift
//  PolimatsUI
//
//  Created by Atakan Başaran on 4.02.2024.
//

import SwiftUI

struct NavigationBar: View {
    
    @EnvironmentObject var mainVM: MainPageViewModel
    @Environment(\.colorScheme) var colorScheme
    @State private var animation = true
    @State private var animationSearch = true
    let action: () -> ()
    
    
    
    var body: some View {
        
        HStack {
            Image(colorScheme == .light ? "polimats-black" : "polimats-white")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 55, height: 55, alignment: .center)
                .rotationEffect(.degrees(animation ? 0 : 360), anchor: .center)
            
                .onAppear {

                    if !mainVM.isLoadingLogo {
                        withAnimation(.easeInOut(duration: 2).delay(2)) {
                            self.animation = false
                            self.animationSearch = false
                        }
                    }
                }
            
                .onChange(of: mainVM.isLoadingLogo) { _ in
                    withAnimation(.easeInOut(duration: 2).delay(2)) {
                        self.animation = false
                        self.animationSearch = false
                    }
                }

    
            Text("polimats")
                .font(.custom("Comfortaa-Bold", size: 28))
            
            Spacer()
            
            Button {
                action()
            } label: {
                Image(systemName: "magnifyingglass")
                    .foregroundStyle(colorScheme == .dark ? .white : .black)
                    .padding(.trailing, 30)
                    .padding(.bottom, 1.5)
                    .font(.system(size: 22))
                    .opacity(animationSearch ? 0 : 1)
                    .scaleEffect(animationSearch ? 0.5 : 1)
            }
    
        }
        .frame(width: 380, height: 35, alignment: .leading)
        .padding(.leading, 25)
        .padding(.top, 5)
    }
}

#Preview {
    NavigationBar(action: {
        print("")
    })
}
