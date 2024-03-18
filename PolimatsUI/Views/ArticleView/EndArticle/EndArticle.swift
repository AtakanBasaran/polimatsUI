//
//  EndArticle.swift
//  PolimatsUI
//
//  Created by Atakan Başaran on 5.02.2024.
//

import SwiftUI

struct EndArticle: View {
    
    @Environment(\.colorScheme) var colorScheme
    @State private var scroll = false
    @State private var showMadeInView = false
    
    
    var body: some View {
        
        NavigationStack {
            
            VStack(spacing: 15) {
                
                HStack(spacing: 22) {
                    
                    NavigationLink(destination: Announcement()) {
                        Text("DUYURU")
                            .font(.custom("Roboto-Medium", size: 13))
                            .foregroundStyle(colorScheme == .dark ? .white : .black)
                    }
                    
                    
                    NavigationLink(destination: KKVK()) {
                        Text("KULLANIM KOŞULLARI SÖZLEŞMESİ")
                            .font(.custom("Roboto-Medium", size: 13))
                            .foregroundStyle(colorScheme == .dark ? .white : .black)
                    }

                }
                .padding(.horizontal, 18)
                .padding(.bottom, 10)
                
                HStack(spacing: 28) {
                    
                    NavigationLink(destination: ContentUsage() ) {
                        Text("İÇERİK KULLANIM BİLDİRGESİ")
                            .font(.custom("Roboto-Medium", size: 13))
                            .foregroundStyle(colorScheme == .dark ? .white : .black)
                    }
                    
                    
                    NavigationLink(destination: AboutUs()) {
                        Text("HAKKIMIZDA")
                            .font(.custom("Roboto-Medium", size: 13))
                            .foregroundStyle(colorScheme == .dark ? .white : .black)
                    }
                    
                    NavigationLink(destination: Team()) {
                        Text("EKİP")
                            .font(.custom("Roboto-Medium", size: 13))
                            .foregroundStyle(colorScheme == .dark ? .white : .black)
                    }
                }
                .padding(.horizontal, 18)
                .padding(.bottom, 10)

                
                VStack(spacing: 15) {
                    
                    VStack(spacing: 7) {
                        
                        Text("\"Bildiğimiz şeyler arttıkça, bilmediğimiz şeylerin ne kadar çok olduğunu daha iyi anlarız, çünkü onların çerçevesi büyüdükçe, bilinmeyenlerle olan temasları da artar.”")
                            .multilineTextAlignment(.center)
                            .font(.custom("Roboto-Regular", size: 16))
                            .lineSpacing(4)
                        
                        Text("Blaise Pascal")
                            .font(.custom("Roboto-Medium", size: 16))
                        
                    }
                    
                    MadeIn()
                        .opacity(showMadeInView ? 1 : 0)
                        .padding(.top, 5)
                    
                }
                .padding(EdgeInsets(top: 15, leading: 18, bottom: 20, trailing: 18))
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
                
        
            }
            .padding(.bottom, 75)
            .ignoresSafeArea()
            .background(
                
                Color(.sitedark)
                    .frame(maxWidth: .infinity)
                    .frame(height: 500)
                    .ignoresSafeArea()
                    .padding(.top, 55)
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
            
//            .onDisappear {
//                showMadeInView = false
//            }
            
        }
        .ignoresSafeArea()
        
    }
}

#Preview {
    EndArticle()
}
