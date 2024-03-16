//
//  ArticleView.swift
//  PolimatsUI
//
//  Created by Atakan Başaran on 5.02.2024.
//

import SwiftUI

struct ArticleView: View {
    
    let dataPolimats: WordPressData
    
    @EnvironmentObject var mainVM: MainPageViewModel
    @EnvironmentObject var adVM: ViewModelAd
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.dismiss) var dismiss
    @State private var showButton = false
    @State private var scrollUp: Bool = false
    @State private var isPresentedSearch = false
    let manager = Manager()

    
    
    
    var body: some View {
        
        ZStack {
            
            NavigationStack {
                
                ScrollViewReader { scroll in
                    ScrollView {
                        
                        VStack(spacing: 20) {
                            ArticleViewBeginning(dataPolimats: dataPolimats)
                                .id("topArticle")
                            
                            
                            ArticleBody(dataPolimats: dataPolimats)
                                .padding(.top, 25)
                            
                                .background(GeometryReader { geo in
                                    Color.clear
                                        .preference(key: ScrollOffsetPreferenceKey.self, value: geo.frame(in: .named("scroll")).origin)
                                })
                                .onPreferenceChange(ScrollOffsetPreferenceKey.self) { value in
                                    let threshold: CGFloat = 30
                                    showButton = value.y < threshold
                                }
                            
                            
                            Writer(dataPolimats: dataPolimats)
                                .padding(.top, 55)
                            
                            if manager.getCategory(dataPolimats: dataPolimats) != "English" {
                                MoreArticle()
                                    .padding(.top, 55)
                            }
                            
                            
                            NativeAdView(nativeAdViewModel: adVM)
                                .padding(.top, 100)
                                .frame(height: 400, alignment: .center)
                                .frame(maxWidth: .infinity)
                                .padding(.horizontal, 10)
                            
                            
                            EndArticle()
                                .padding(.top, 100)
                                .padding(.bottom, 25)
                                .ignoresSafeArea()
                                
                        }
                    }
                    .gesture(
                        DragGesture()
                            .onChanged({ gesture in
                                if gesture.translation.width > 40 {
                                    withAnimation(.smooth) {
                                        dismiss()
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
                Spacer() //to push bottom
                HStack {
                    Spacer() //to push right
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
        
        
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                        .foregroundStyle(colorScheme == .dark ? .white : .black)
                        .fontWeight(.medium)
                        .font(.system(size: 18))
                    
                }
            }
            
            ToolbarItem(placement: .topBarTrailing) {
                
                Menu {
                    
                    VStack {
                        Button {
                            mainVM.isActive = false
                            mainVM.isActiveSearch = false
                        } label: {
                            Label("Ana Sayfa", systemImage: "house")
                        }
                        
                        Button {
                            isPresentedSearch = true
                        } label: {
                            Label("Ara", systemImage: "magnifyingglass")
                        }
                        
                        ShareLink(item: URL(string: dataPolimats.link)!) {
                            Label("Paylaş", systemImage: "square.and.arrow.up")
                        }
                    }
                    .frame(width: 10)
                    
                } label: {
                    
                        Image(systemName: "ellipsis.circle")
                        .foregroundStyle(colorScheme == .dark ? .white : .black)
                }
            }
            
            
        }
        
        .navigationTitle("polimats")
        .navigationBarTitleDisplayMode(.large)
        .navigationBarBackButtonHidden()
        
        .popover(isPresented: $isPresentedSearch , content: {
            SearchView()
        })
        
        .onAppear {
            mainVM.showButton = false
        }
        .task {
            
            if let category = dataPolimats.categories.first {
                
                if category != mainVM.lastSelectedCategoryMore {
                    mainVM.getMoreArticleData(category: category)
                    mainVM.lastSelectedCategoryMore = category
                }
            }
            
            
            
        }
        .onDisappear(perform: {
            showButton = false
        })
        
    }
}




//#Preview {
//    ArticleView(dataPolimats: exData.exArticle)
//}
