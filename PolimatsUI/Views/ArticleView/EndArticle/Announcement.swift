//
//  Announcement.swift
//  PolimatsUI
//
//  Created by Atakan Başaran on 20.02.2024.
//

import SwiftUI

struct Announcement: View {
    
    @EnvironmentObject var mainVM: MainPageViewModel
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.dismiss) var dismiss
    @State private var scrollUp: Bool = false
    @State private var showButton: Bool = false
    @State private var isMenuOpen = false
    
    
    
    var body: some View {
        
    
        NavigationStack {
            
            ScrollView {
                
                LazyVStack(spacing: 15) {
                    
                    ForEach(mainVM.polimatsData) { dataFetch in
                        
                        NavigationLink(destination: ArticleView(dataPolimats: dataFetch)) {
                            CategoryViewCell(dataPolimats: dataFetch)
                        }
                    }
                    
                    EndArticle()
                        .padding(.top, 145)
                        .padding(.bottom, 5)
                        .padding(.horizontal, 5)
                }
                .padding(.top, 25)
            }
            .gesture(
                DragGesture()
                    .onChanged({ gesture in
                        if gesture.translation.width > 20 {
                            withAnimation(.smooth) {
                                dismiss()
                            }
                        }
                    })
            )
            
        }
        
        
        
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
                
                Button {
                    mainVM.isActive = false
                    mainVM.isActiveSearch = false
                } label: {
                    Image(systemName: "house")
                        .foregroundStyle(colorScheme == .dark ? .white : .black)
                }
                
            }
        }
        .navigationBarBackButtonHidden()
        .navigationTitle("Duyuru")
        .navigationBarTitleDisplayMode(.large)
        
        .task {
            mainVM.polimatsData.removeAll()
            mainVM.currentPage = 1
            mainVM.getData(category: "&categories=33")
        }
        
        .onDisappear {
            mainVM.polimatsData.removeAll()
            mainVM.currentPage = 1
            mainVM.getData()
        }
        
        
    }
}

//#Preview {
//    Announcement()
//}
