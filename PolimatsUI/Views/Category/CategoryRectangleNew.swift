//
//  CategoryRectangleNew.swift
//  PolimatsUI
//
//  Created by Atakan Başaran on 3.03.2024.
//

import SwiftUI

struct CategoryRectangleNew: View {
    
    let category: String
    let width: CGFloat
    let height: CGFloat
    
    var body: some View {
        
        ZStack {
            Rectangle()
                .frame(width: width, height: height)
                .foregroundStyle(Color(.realRed))
                .clipShape(.rect(topTrailingRadius: 20))
                .clipShape(.rect(bottomLeadingRadius: 20))
            
            Text(category)
                .fontWeight(.semibold)
                .foregroundStyle(.white)
        }

    }
}

#Preview {
    CategoryRectangleNew(category: "Sinema", width: 80, height: 35)
}
