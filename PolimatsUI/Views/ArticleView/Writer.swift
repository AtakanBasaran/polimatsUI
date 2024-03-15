//
//  Writer.swift
//  PolimatsUI
//
//  Created by Atakan Başaran on 22.02.2024.
//

import SwiftUI

struct Writer: View {
    
    let dataPolimats: WordPressData
    let manager = Manager()
    
    var body: some View {
        
        VStack(alignment: .center, spacing: 10) {
            
            ImageHandle(placeHolder: "polimats-black", urlString: manager.getPhoto(dataPolimats: dataPolimats))
                .aspectRatio(contentMode: .fit)
                .frame(width: 135, height: 135)
                .clipShape(Circle())
                .padding(.top, 5)
            
            
            Text("Yazar")
                .font(.custom("Roboto-Medium", size: 17))
            
            Text(dataPolimats.authorInfo.displayName)
                .font(.custom("Roboto-Bold", size: 22))
            
            Text(manager.getAbout(dataPolimats: dataPolimats))
                .font(.custom("Roboto-Regular", size: 16))
                .multilineTextAlignment(.center)
                .lineSpacing(7)
                .padding(.top, 5)
                .padding(.horizontal, 15)
                .padding(.bottom, 5)
        }
        .frame(width: 360 ,height: 500, alignment: .center)
        .padding(.horizontal, 10)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .foregroundStyle(Color(.duyuru))
                .frame(width: 360 ,height: 500, alignment: .center)
        )

    }
}

#Preview {
    Writer(dataPolimats: exData.exArticle)
}
