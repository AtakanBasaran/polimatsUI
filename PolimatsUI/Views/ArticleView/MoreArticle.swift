//
//  MoreArticle.swift
//  PolimatsUI
//
//  Created by Atakan Başaran on 22.02.2024.
//

import SwiftUI

struct MoreArticle: View {
    
    @EnvironmentObject var mainVM: MainPageViewModel
    

    var body: some View {
        
        VStack(alignment: .leading, spacing: 15) {
            
            VStack(alignment: .leading, spacing: 0) {
                
                Text("DAHA FAZLA İÇERİK")
                    .font(.custom("Roboto-Bold", size: 20))
                
                RoundedRectangle(cornerRadius: 20)
                    .frame(height: 5)
                    .foregroundStyle(.realRed)
            }
            .fixedSize()
            .padding(.leading, 20)
            
            ScrollView(.horizontal, showsIndicators: false) {
                
                HStack(spacing: 20) {
                    
                    ForEach(mainVM.polimatsDataMore) { dataFetch in
                        
                        NavigationLink(destination: ArticleView(dataPolimats: dataFetch)) {
                            GeometryReader { geo in
                                ScrollArticle(dataPolimats: dataFetch)
                                    .rotation3DEffect(Angle(degrees: (Double(geo.frame(in: .global).minX) - 20) / -20), axis: (x: 0, y: 10, z: 0))
                            }
                            .frame(width: 250, height: 320, alignment: .center)
                        }
                    }
                }
                .padding(.horizontal, 20)
            }
            .frame(maxWidth: .infinity)

        }

    }
}

//#Preview {
//    MoreArticle()
//}
