//
//  MenuItem.swift
//  PolimatsUI
//
//  Created by Atakan Başaran on 26.02.2024.
//

import SwiftUI

struct MenuItem: View {
    
    @Environment(\.colorScheme) var colorScheme

    let image: String
    let text: String
    let color: Color
    
    var body: some View {
        
        ZStack(alignment: .center) {
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 125, height: 45)
                .foregroundStyle(colorScheme == .dark ? .black : .white)
            
            
            HStack(spacing: 12) {
                
                Image(systemName: image)
                    .foregroundStyle(color)
                    .font(.system(size: 20))
                
                Text(text)
                    .font(.custom("Roboto-Medium", size: 18))
                    .foregroundStyle(colorScheme == .dark ? .white : .black)
            }
            .padding(.horizontal, 8)
            
        }
    }
}

//#Preview {
//    MenuItem(image: "house", text: "Anasayfa")
//}
