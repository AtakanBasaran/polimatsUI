//
//  Categories.swift
//  PolimatsUI
//
//  Created by Atakan Başaran on 6.02.2024.
//

import SwiftUI

struct Categories: View {
    
    @State var categories: [[String]] = [["Ana Sayfa", ""], ["Eğlence", "&categories=9"], ["Teknoloji", "&categories=6"], ["Gezi", "&categories=8"], ["Spor", "&categories=5"], ["Sinema", "&categories=7"], ["Serpme", "&categories=70"]]
    
    @EnvironmentObject var mainVM: MainPageViewModel

    
    var body: some View {
        
        ScrollView(.horizontal, showsIndicators: false) {
            
            HStack(spacing: 12) {
                
                ForEach(categories.indices, id: \.self) { index in
                    
                    Button {
                        mainVM.polimatsData.removeAll()
                        mainVM.currentPage = 1
                        mainVM.getData(category: categories[index][1])
                        mainVM.lastSelectedCategory = categories[index][1]
                        
                        mainVM.hapticFeedback()
                        
                    } label: {
                        CategoryRectangle(category: categories[index][0], width: 100, height: 30)
                    }

                    
                }
            }
            .offset(x: 20)
            .padding(.trailing, 40)

        }
        
    }
}

#Preview {
    Categories()
}
