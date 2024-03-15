//
//  SearchView.swift
//  PolimatsUI
//
//  Created by Atakan Başaran on 3.03.2024.
//

import SwiftUI
import Lottie

struct SearchView: View {
    
    @EnvironmentObject var mainVM: MainPageViewModel
    @State var searchedText = ""
    @State var dataFetch: WordPressData = exData.exArticle
    
    
    var body: some View {
        
        NavigationStack {
            
            ZStack {
                
                if searchedText.isEmpty && mainVM.polimatsDataSearch.isEmpty {
                    
                    LottieView(animation: .named("search"))
                        .looping()
                        .frame(width: 250, height: 250, alignment: .top)
                        .clipped()
                        .padding(.bottom, 100)
                }
                
                ScrollView {
                    
                    VStack(spacing: 15) {
                        
                        ForEach(mainVM.polimatsDataSearch) { dataFetch in
                            
                            CategoryViewCell(dataPolimats: dataFetch)
                                .onTapGesture(perform: {
                                    self.dataFetch = dataFetch
                                    mainVM.isActiveSearch = true
                                })
                        }
                        .navigationDestination(isPresented: $mainVM.isActiveSearch) {
                            ArticleView(dataPolimats: dataFetch)
                        }

                    }
                    
                }
                .padding(.top, 10)
                .navigationTitle("İçerikler")
            }
            
            
        }
        .searchable(text: $searchedText, prompt: "İçerik ara")
        .autocorrectionDisabled()
        .ignoresSafeArea(.keyboard)
        .keyboardType(.asciiCapable)
        .onChange(of: searchedText) { text in
            
            mainVM.searchData(search: text)
            
            if searchedText.isEmpty {
                mainVM.polimatsDataSearch = []
            }
            
        }
        
        .onDisappear(perform: {
            mainVM.polimatsDataSearch = []
        })
        
        
        
        
    }
    
}

#Preview {
    SearchView()
}
