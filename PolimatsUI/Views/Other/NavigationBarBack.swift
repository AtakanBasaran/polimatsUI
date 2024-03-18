//
//  NavigationBarBack.swift
//  PolimatsUI
//
//  Created by Atakan Başaran on 15.02.2024.
//

import SwiftUI

struct NavigationBarBack: View {
    
    @Environment(\.dismiss) var dismiss
    @Environment(\.colorScheme) var colorScheme
    let action: () -> ()
    
    var body: some View {
        
        GeometryReader { geo in
            let width = geo.size.width 
            
            HStack {
                
                Button {
                    withAnimation(.easeInOut(duration: 1)) {
                        action()
                    }
                    
                } label: {
                    Image(systemName: "chevron.left")
                        .foregroundStyle(colorScheme == .dark ? .white : .black)
                        .fontWeight(.medium)
                        .font(.system(size: 20))

                }
                .padding(.leading, 20)
                
                Spacer()
                
                HStack(alignment: .center) {
                    Image(colorScheme == .light ? "polimats-black" : "polimats-white")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 45, height: 45, alignment: .center)
//                        .shadow(radius: 5)
                    
                    
                    Text("polimats")
                        .font(.custom("Comfortaa-Bold", size: 28))
//                        .shadow(radius: 5)
                }
                .padding(.trailing, 20)
                
                Spacer()
            }
            .frame(width: width, height: 40, alignment: .center)
//            .padding(.top, 5)
        }
        .frame(height: 40)
    }
}

//#Preview {
//    NavigationBarBack()
//}
