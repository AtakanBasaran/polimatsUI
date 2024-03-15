//
//  PopularView.swift
//  PolimatsUI
//
//  Created by Atakan Başaran on 24.02.2024.
//

import SwiftUI
import Lottie

struct PopularView: View {
    
    @EnvironmentObject var mainVM: MainPageViewModel
    @State var dataTap: WordPressData
    @State private var scroll = true
    @State private var selectedTab = 0
    @State var selectedData: WordPressData?
    @Environment(\.colorScheme) var colorScheme
    
    
    var body: some View {
        
        ZStack {
            
            GeometryReader { geo in
                
                NavigationStack {
                    
                    ZStack {
                        
                        if let selectedData {
                            
                            withAnimation(.spring) {
                                
                                AsyncImage(url: URL(string: selectedData.featuredImageSrc), content: { image in
                                    image
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .ignoresSafeArea()
                                }, placeholder: {
                                    Image("grayImage")
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .ignoresSafeArea()
                                })
                                
                            }
                            
                        } else {
                            
                            withAnimation(.spring) {
                                
                                AsyncImage(url: URL(string: mainVM.polimatsDataPopular[0].featuredImageSrc), content: { image in
                                    image
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .ignoresSafeArea()
                                }, placeholder: {
                                    Image("grayImage")
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .ignoresSafeArea()
                                })
                                
                            }
                        }
                        
                        Color.black.opacity(0.3)
                            .ignoresSafeArea()
                        
                        
                        TabView(selection: $selectedTab) {
                            
                            ForEach(mainVM.polimatsDataPopular.indices, id: \.self) { index in
                                PopularCell(dataPolimats: mainVM.polimatsDataPopular[index], action: {
                                    withAnimation(.spring) {
                                        dataTap = mainVM.polimatsDataPopular[index]
                                        mainVM.hapticFeedback()
                                        mainVM.showArticle = true
                                    }
                                })
                                
                            }
                            .navigationDestination(isPresented: $mainVM.showArticle) {
                                PopularArticleView(dataPolimats: dataTap)
                            }
                        }
                        .tabViewStyle(.page(indexDisplayMode: .always))
                        .indexViewStyle(.page(backgroundDisplayMode: .interactive))
                        .frame(width: geo.size.width, height: geo.size.height * 0.75, alignment: .center)
                        .padding(.bottom, 55)
                        
                    }
                }
            }
        }
        
        .ignoresSafeArea()
        
        .onChange(of: selectedTab) { value in
            print(selectedTab)
            selectedData = mainVM.polimatsDataPopular[selectedTab]
        }
    }
}

//#Preview {
//    PopularView()
//}
