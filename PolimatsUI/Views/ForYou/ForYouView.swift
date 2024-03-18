//
//  ForYou.swift
//  PolimatsUI
//
//  Created by Atakan Başaran on 5.03.2024.
//

import SwiftUI

struct ForYou: View {
    
    @EnvironmentObject var mainVM: MainPageViewModel
    @EnvironmentObject var adVM: ViewModelAd
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.dismiss) var dismiss
    @State private var hapticActive = true
    
    let dataPolimats: WordPressData

    var body: some View {
        

        NavigationStack {
            
            ScrollView {
                
                VStack(spacing: 20) {
                    
                    ArticleViewBeginning(dataPolimats: dataPolimats)
                        .padding(.horizontal, 5)
                    
                    ArticleBody(dataPolimats: dataPolimats)
                        .padding(.horizontal, 5)
                        .padding(.top, 20)
                    
                    Writer(dataPolimats: dataPolimats)
                        .padding(.top, 95)
                        .padding(.horizontal, 5)
                    
                    NativeAdView(nativeAdViewModel: adVM)
                        .padding(.top, 100)
                        .frame(height: 400, alignment: .center)
                        .frame(maxWidth: .infinity)
                        .padding(.horizontal, 10)
                    
                    
                    EndArticleCategory()
                        .padding(.top, 100)
                    
                }
                .gesture(
                    DragGesture()
                        .onChanged({ gesture in
                            if gesture.translation.width > 20 {
                                withAnimation(.smooth(duration: 1)) {
                                    dismiss()
                                }
                            }
                        })
                )
            }
            
            .navigationTitle("Sizin için")
            .navigationBarTitleDisplayMode(.large)
        }
        
        .ignoresSafeArea(edges: .horizontal)
        .navigationBarBackButtonHidden()
        
        .onDisappear(perform: {
            hapticActive = false
        })
        
        .onAppear(perform: {
            mainVM.randomArticleOnline = true
        })
        
        .onChange(of: mainVM.dismissForYouArticle) { _ in
            dismiss()
        }
        
        
        
    }
}

//#Preview {
//    ForYou()
//}
