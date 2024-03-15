//
//  EndArticleCategory.swift
//  PolimatsUI
//
//  Created by Atakan Başaran on 28.02.2024.
//

import SwiftUI

struct EndArticleCategory: View {
    
    @State private var showMadeInView = false
    
    var body: some View {
        
        VStack(spacing: 25) {
            
            VStack(spacing: 7) {
                
                Text("\"Bildiğimiz şeyler arttıkça, bilmediğimiz şeylerin ne kadar çok olduğunu daha iyi anlarız, çünkü onların çerçevesi büyüdükçe, bilinmeyenlerle olan temasları da artar.”")
                    .multilineTextAlignment(.center)
                    .font(.custom("Roboto-Regular", size: 16))
                    .lineSpacing(4)
                    .padding(.horizontal, 18)
                
                Text("Blaise Pascal")
                    .font(.custom("Roboto-Medium", size: 16))
                    .padding(.bottom, 18)
            }
            
            MadeIn()
                .opacity(showMadeInView ? 1 : 0)
        }
        .padding(.top, 20)
        .padding(.bottom, 100)
        .ignoresSafeArea()
        
        .background(
            Color(.sitedark)
                .frame(maxWidth: .infinity)
                .frame(height: 420)
                .ignoresSafeArea()
                .padding(.top, 20)
        )
        
        .onLongPressGesture {
            
            withAnimation(.easeInOut) {
                showMadeInView = true
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                
                withAnimation(.easeInOut) {
                    showMadeInView = false
                }
            }
        }
        
        .onDisappear {
            showMadeInView = false
        }
    }
}

#Preview {
    EndArticleCategory()
}
