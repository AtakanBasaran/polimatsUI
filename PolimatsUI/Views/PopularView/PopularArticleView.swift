//
//  PopularArticleView.swift
//  PolimatsUI
//
//  Created by Atakan Başaran on 25.02.2024.
//

import SwiftUI

struct PopularArticleView: View {
    
    let dataPolimats: WordPressData
    
    @EnvironmentObject var mainVM: MainPageViewModel
    @EnvironmentObject var adVM: ViewModelAd
    @Environment(\.colorScheme) var colorScheme
    @State private var showButton = false
    @State private var scrollUp: Bool = false
    
    

    var body: some View {
        
        ZStack {
            
            NavigationStack {
                
                ScrollViewReader { scroll in
                    
                    ScrollView {
                        
                        VStack(spacing: 20) {
                            
                            ArticleViewBeginning(dataPolimats: dataPolimats)
                                .padding(.bottom, 5)
                                .id("topArticle")
                                
                            
                            ArticleBody(dataPolimats: dataPolimats)
                                .padding(.top, 15)
                            
                                .background(GeometryReader { geo in
                                    Color.clear
                                        .preference(key: ScrollOffsetPreferenceKey.self, value: geo.frame(in: .named("scroll")).origin)
                                })
                                .onPreferenceChange(ScrollOffsetPreferenceKey.self) { value in
                                    let threshold: CGFloat = 30
                                    showButton = value.y < threshold
                                }
                            
                            Writer(dataPolimats: dataPolimats)
                                .padding(.top, 85)
            
                            
                            NativeAdView(nativeAdViewModel: adVM)
                                .padding(.top, 100)
                                .frame(height: 400, alignment: .center)
                                .frame(maxWidth: .infinity)
                                .padding(.horizontal, 10)
                            
                            EndArticleCategory()
                                .padding(.top, 100)
                                .padding(.bottom, 15)
                        }
                    }
                    .gesture(
                        DragGesture()
                            .onChanged({ gesture in
                                if gesture.translation.width > 40 {
                                    withAnimation(.spring) {
                                        mainVM.showArticle = false
                                    }
                                }
                            })
                    )
                    .coordinateSpace(name: "scroll")
                    .onChange(of: scrollUp) { _ in
                        withAnimation(.smooth) {
                            scroll.scrollTo("topArticle", anchor: .top)
                        }
                    }
                }
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
        .navigationBarBackButtonHidden()
        .navigationTitle("Popüler")
        .navigationBarTitleDisplayMode(.large)
    

    
        .toolbar {
            
            ToolbarItem(placement: .topBarLeading) {
                Button {
                    mainVM.showArticle = false
                } label: {
                    Image(systemName: "chevron.left")
                        .foregroundStyle(colorScheme == .dark ? .white : .black)
                        .fontWeight(.medium)
                        .font(.system(size: 18))
                }
            }
        }
        
        
        .onAppear {
            mainVM.showButton = false
        }
        
        .refreshable {
            mainVM.polimatsDataPopular.removeAll()
            mainVM.getPopularData()
        }
        
    }
}


//#Preview {
//    PopularArticleView()
//}
