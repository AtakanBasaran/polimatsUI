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
    @State private var isPresentedSearch = false
    let manager = Manager()
    
    
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
                        .padding(.top, 55)
                    
                    if manager.getCategory(dataPolimats: dataPolimats) != "English" {
                        MoreArticle()
                            .padding(.top, 55)
                    }
                    
                    
                    NativeAdView(nativeAdViewModel: adVM)
                        .padding(.top, 100)
                        .frame(width: 350, height: 400, alignment: .center)
                        .padding(.horizontal, 10)
                    
                    
                    EndArticle()
                        .padding(.top, 100)
//                        .padding(.bottom, 25)
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
            mainVM.articleOnline = true
        }
        
        .task {
            
            if let category = dataPolimats.categories.first {
                
                if category != mainVM.lastSelectedCategoryMore {
                    mainVM.getMoreArticleData(category: category)
                    mainVM.lastSelectedCategoryMore = category
                }
            }
            
        }
    }
}




//#Preview {
//    ArticleView(dataPolimats: exData.exArticle)
//}
