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
    @Environment(\.dismiss) var dismiss
    @Environment(\.colorScheme) var colorScheme
    @State private var showButton = false
    @State private var scrollUp: Bool = false
    
    
    var body: some View {
        
        NavigationStack {
            
            ScrollView {
                
                VStack(spacing: 20) {
                    
                    ArticleViewBeginning(dataPolimats: dataPolimats)
                        .padding(.bottom, 5)
                        .padding(.horizontal, 5)
                    
                    
                    ArticleBody(dataPolimats: dataPolimats)
                        .padding(.top, 20)
                        .padding(.horizontal, 5)
                    
                    Writer(dataPolimats: dataPolimats)
                        .padding(.top, 85)
                    
                    
                    NativeAdView(nativeAdViewModel: adVM)
                        .padding(.top, 100)
                        .frame(height: 400, alignment: .center)
                        .frame(maxWidth: .infinity)
                        .padding(.horizontal, 10)
                    
                    EndArticleCategory()
                        .padding(.top, 100)
                }
            }
            .gesture(
                DragGesture()
                    .onChanged({ gesture in
                        if gesture.translation.width > 40 {
                            withAnimation(.spring) {
                                dismiss()
                            }
                        }
                    })
            )
            
            
        }
        .navigationBarBackButtonHidden()
        .navigationTitle("Popüler")
        .navigationBarTitleDisplayMode(.large)
        
        
        
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
        }
        
        .onChange(of: mainVM.dismissPopularArticle) { value in
            dismiss()
        }
        
        .onAppear(perform: {
            mainVM.popularArticleOnline = true
        })
        
        .refreshable {
            mainVM.polimatsDataPopular.removeAll()
            mainVM.getPopularData()
        }
        
    }
}


//#Preview {
//    PopularArticleView()
//}
