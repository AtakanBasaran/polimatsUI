//
//  ScrollArticle.swift
//  PolimatsUI
//
//  Created by Atakan Başaran on 22.02.2024.
//

import SwiftUI

struct ScrollArticle: View {
    
    let dataPolimats: WordPressData
    let manager = Manager()
    @Environment(\.colorScheme) var colorScheme
    
    
    var body: some View {
        
        ZStack(alignment: .bottomLeading) {
            
            ImageHandle(placeHolder: "grayImage", urlString: dataPolimats.featuredImageSrc)
                .aspectRatio(contentMode: .fill)
                .frame(width: 250, height: 290, alignment: .center)
                .clipped()
                .clipShape(.rect(cornerRadius: 20))
            
            Color(.black)
                .frame(width: 250, height: 290)
                .clipShape(.rect(cornerRadius: 20))
                .opacity(0.3)
            
            
            Text(manager.convertHtmlToPlainText(dataPolimats.title.rendered))
                .font(.custom("Roboto-Bold", size: 20))
                .foregroundStyle(.white)
                .multilineTextAlignment(.leading)
//                .frame(width: 235)
                .padding(.bottom, 10)
                .padding(.horizontal, 7)
            
        }
        .frame(width: 250, height: 290, alignment: .center)
    }
}

#Preview {
    ScrollArticle(dataPolimats: exData.exArticle)
}
