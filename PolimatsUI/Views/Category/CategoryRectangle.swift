//
//  CategoryRectangle.swift
//  PolimatsUI
//
//  Created by Atakan Başaran on 5.02.2024.
//

import SwiftUI

struct CategoryRectangle: View {
    
    let category: String
    let width: CGFloat
    let height: CGFloat
    
    var body: some View {
        
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .frame(width: width, height: height)
                .foregroundStyle(Color(.realRed))

            
            Text(category)
                .fontWeight(.semibold)
                .foregroundStyle(.white)
        }
    }
}

#Preview {
    CategoryRectangle(category: "Sinema", width: 80, height: 35)
}
