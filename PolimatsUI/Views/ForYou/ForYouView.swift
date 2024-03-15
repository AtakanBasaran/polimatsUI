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
    
    @State private var showButton = false
    @State private var scrollUp: Bool = false
    @State private var subTitle = ""
    @State private var hapticActive = true
    
    let dataPolimats: WordPressData
    let text = "Zevkinize göre seçildi"

    
    
    var body: some View {
        
        ZStack {
            
            NavigationStack {
                
                ScrollViewReader { scroll in
                    
                    ScrollView {
                                  
                            VStack(spacing: 20) {
                                
                                               
                                ArticleViewBeginning(dataPolimats: dataPolimats)
                                    .id("topArticle")
                                    .padding(.horizontal, 5)
                                    .padding(.bottom, 5)
                                
                                ArticleBody(dataPolimats: dataPolimats)
    //                                .padding(.top, 25)
                                    .padding(.horizontal, 5)

                                
                                    .background(GeometryReader { geo in
                                        Color.clear
                                            .preference(key: ScrollOffsetPreferenceKey.self, value: geo.frame(in: .named("scroll")).origin)
                                    })
                                    .onPreferenceChange(ScrollOffsetPreferenceKey.self) { value in
                                        let threshold: CGFloat = 30
                                        showButton = value.y < threshold
                                    }
                                
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
                                    .padding(.bottom, 15)
                            

                            }
                            .gesture(
                                DragGesture()
                                    .onChanged({ gesture in
                                        if gesture.translation.width > 20 {
                                            withAnimation(.smooth(duration: 1)) {
    //                                            showBeginning = true
                                                dismiss()
                                            }
                                        }
                                    })
                            )
//                        }
                    }

                    .coordinateSpace(name: "scroll")
                    .onChange(of: scrollUp) { _ in
                        withAnimation(.smooth) {
                            scroll.scrollTo("topArticle", anchor: .top)
                        }
                    }
                }
                
                .navigationTitle("Sizin için")
                .navigationBarTitleDisplayMode(.large)
            }
            
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    UpButton(showButton: $showButton) {
                        scrollUp.toggle()
                        showButton = false
                    }
                }
            }
            .padding(.bottom, 110)
            .padding(.trailing, 20)
            
        }
        .ignoresSafeArea(edges: .horizontal)
        .navigationBarBackButtonHidden()
        
        .onDisappear(perform: {
            mainVM.isActiveRandom = false
            hapticActive = false
        })
        
 
        
        
        
        

        
    }
}

//#Preview {
//    ForYou()
//}
