//
//  ArticleViewBeginning.swift
//  PolimatsUI
//
//  Created by Atakan Başaran on 14.02.2024.
//

import SwiftUI

struct ArticleViewBeginning: View {
    
    let dataPolimats: WordPressData
    let manager = Manager()
    @State private var image: UIImage?
    
    @Environment(\.colorScheme) var colorScheme
    
    
    var body: some View {
        
        VStack(spacing: 20) {
            
            ZStack(alignment: .center) {
                
                HStack {
                    Spacer()
                    
                    GeometryReader { geo in
                        
                        ZStack(alignment: .center) {
                            
                            ImageHandle(placeHolder: "grayImage", urlString: dataPolimats.featuredImageSrc)
                                .aspectRatio(contentMode: .fill)
                                .frame(width: geo.size.width * 0.95, height: 290, alignment: .center)
                                .clipped()
                                .clipShape(.rect(cornerRadius: 20))
                                .onLongPressGesture {
                                    
                                    if let imageToSave = self.image {
                                        UIImageWriteToSavedPhotosAlbum(imageToSave, nil, nil, nil)
                                    } else {
                                        print("error saving")
                                    }
                                }
                            
                            Color.black.opacity(0.6)
                                .clipShape(.rect(cornerRadius: 20))
                                .frame(width: geo.size.width * 0.95, height: 290, alignment: .center)
                                
                        }
                        .frame(width: geo.size.width, height: geo.size.height, alignment: .center)
                    }
                    Spacer()
                }
                
                VStack(alignment: .leading) {
                    
                    Text(manager.convertHtmlToPlainText(dataPolimats.title.rendered))
                        .font(.custom("Roboto-Bold", size: 21))
                        .multilineTextAlignment(.leading)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundStyle(.white)
                        .padding(.horizontal, 30)
                        .padding(.top, 140)
                    
                    
                    HStack {
                        
                        ImageHandle(placeHolder: "polimats-black", urlString: manager.getPhoto(dataPolimats: dataPolimats))
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 50, height: 50)
                            .clipped()
                            .clipShape(Circle())
                            
                        Text(dataPolimats.authorInfo.displayName)
                            .font(.custom("Roboto-Medium", size: 18))
                            .foregroundStyle(.white)
                        
                        Spacer()
                        
                        Text(manager.getDate(dataPolimats: dataPolimats))
                            .font(.custom("Roboto-Regular", size: 17))
                            .foregroundStyle(.white)
                            .padding(.top, 2)
                            .padding(.trailing, 30)
                    }
                    .padding(.leading, 30)
                }
                .padding(.bottom, 18)
                .padding(.horizontal, 3)
            }
            
            .padding(.top, 15)
            
            VStack(alignment: .leading, spacing: 10) {
                HStack {
                    Rectangle()
                        .frame(width: 5, height: 30)
                    
                    Text("Giriş")
                        .font(.custom("Roboto-Bold", size: 20))
                    
                    Spacer()
                }
                .padding(.leading, 15)
                
                
                Text(manager.convertHtmlToPlainText(dataPolimats.excerpt.rendered))
                    .font(.custom("Roboto-Medium", size: 17))
                    .lineSpacing(10)
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal, 15)
                    .frame(alignment: .leading)
            }
            .padding(.top, 15)
        }
        .ignoresSafeArea(edges: .horizontal)
        .padding(.top, 20)
        
        
    }
    
    
}

#Preview {
    ArticleViewBeginning(dataPolimats: exData.exArticle)
}
