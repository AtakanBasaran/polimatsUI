//
//  MainView.swift
//  PolimatsUI
//
//  Created by Atakan Başaran on 4.02.2024.
//

import SwiftUI


struct CategoryView: View {
    
    @EnvironmentObject var mainVM: MainPageViewModel
    @State private var scrollUp: Bool = false
    @State private var animate = false
    @State var dataFetch: WordPressData = exData.exArticle
    @State private var showSearchView = false
    
    
    
    var body: some View {
        
        ZStack {
            
            NavigationStack {
                
                ScrollViewReader { scroll in
                    ScrollView {
                        
                        NavigationBar(action: {
                            showSearchView = true
                        })
                        .padding(.top, 10)
                        .id("navigation")
                        .offset(x: animate ? 0 : -175)
 
                        Categories()
                            .padding(.top, 15)
                            .padding(.horizontal, 5)
                        
                        LazyVStack(spacing: 15) {
                            
                            ForEach(mainVM.polimatsData) { dataFetch in
                                
                                CategoryViewCell(dataPolimats: dataFetch)
                                    .onAppear(perform: {
                                        if dataFetch == mainVM.polimatsData.last {
                                            mainVM.getData()
                                            mainVM.isLoading = false
                                        }
                                    })
                                    .onTapGesture {
                                        withAnimation(.spring) {
                                            self.dataFetch = dataFetch
                                            mainVM.isActive = true
                                        }
                                    }
                            }
                            .navigationDestination(isPresented: $mainVM.isActive, destination: {
                                ArticleView(dataPolimats: dataFetch)
                            })
                            .padding(.top, 10)
                            
                            EndArticleCategory()
                                .padding(.top, 135)
                                .padding(.horizontal, 5)
                                
                        }
                        .padding(.top, 5)
                        .background(GeometryReader { geo in
                            Color.clear
                                .preference(key: ScrollOffsetPreferenceKey.self, value: geo.frame(in: .named("scroll")).origin)
                        })
                        .onPreferenceChange(ScrollOffsetPreferenceKey.self) { value in
                            let threshold: CGFloat = 10
                            mainVM.showButton = value.y < threshold
                        }
                        
                    }
                    
                    .coordinateSpace(name: "scroll")
                    .onChange(of: scrollUp) { _ in
                        withAnimation(.smooth) {
                            scroll.scrollTo("navigation", anchor: .top)
                        }
                    }
                }
                .padding(.top, 5)
            }
            
            
            VStack {
                Spacer() //to push bottom
                HStack {
                    Spacer() //to push right
                    UpButton(showButton: $mainVM.showButton) {
                        scrollUp.toggle()
                        mainVM.showButton = false
                    }
                }
            }
            .padding(.bottom, 100)
            .padding(.trailing, 20)
        }
        .ignoresSafeArea(edges: .horizontal)
        
    
        .task {
            if mainVM.polimatsData.isEmpty {
                mainVM.getData()
            }
            
            if mainVM.polimatsDataPopular.isEmpty {
                mainVM.getPopularData()
            }
            
        }
        .onAppear {
            if !mainVM.isLoadingLogo {
                withAnimation(.easeInOut(duration: 2)) {
                    self.animate = true
                }
            }
            mainVM.showButton = false
        }
        .onChange(of: mainVM.isLoadingLogo) { _ in
            withAnimation(.easeInOut(duration: 2)) {
                self.animate = true
            }
        }
        
        .refreshable {
            mainVM.polimatsData.removeAll()
            mainVM.currentPage = 1
            mainVM.getData()
        }
        .popover(isPresented: $showSearchView) {
            SearchView()
        }
    
    }
}


struct ScrollOffsetPreferenceKey: PreferenceKey {
    static var defaultValue: CGPoint = .zero
    
    static func reduce(value: inout CGPoint, nextValue: () -> CGPoint) {
    }
}

//#Preview {
//    CategoryView()
//
//
//    
//}
