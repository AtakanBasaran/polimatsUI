//
//  PopularCell.swift
//  PolimatsUI
//
//  Created by Atakan Başaran on 24.02.2024.
//

import SwiftUI
import Lottie

struct PopularCell: View {
    
    @EnvironmentObject var mainVM: MainPageViewModel
    let dataPolimats: WordPressData
    let manager = Manager()
    let action: () -> ()
    @Environment(\.colorScheme) var colorScheme
    
    
    
    
    var body: some View {
        
        GeometryReader { geo in
            
            ZStack(alignment: .bottom) {
                
                ImageHandle(placeHolder: "grayImage", urlString: dataPolimats.featuredImageSrc)
                    .aspectRatio(contentMode: .fill)
                    .frame(width: geo.size.width * 0.8, height: geo.size.height * 0.88, alignment: .center)
                    .clipped()
                    .clipShape(.rect(cornerRadius: 25))
                
                    .overlay {
                        RoundedRectangle(cornerRadius: 25)
                            .stroke(LinearGradient(colors: [Color(.darkGray)], startPoint: .top, endPoint: .bottom),style: StrokeStyle(lineWidth: 1))
                    }
                
                ZStack(alignment: .bottom) {
                    
                    Color.black.opacity(0.7)
                        .frame(width: geo.size.width * 0.8, height: geo.size.height * 0.45)
                        .clipShape(.rect(bottomLeadingRadius: 25))
                        .clipShape(.rect(bottomTrailingRadius: 25))
                    
                    
                    VStack(alignment: .leading, spacing: 0) {
                        
                        VStack(alignment: .leading, spacing: 10) {
                            
                            VStack(alignment: .leading, spacing: 2) {
                                
                                Text(manager.getCategory(dataPolimats: dataPolimats))
                                    .font(.custom("Roboto-Medium", size: 16))
                                    .foregroundStyle(.white)
                                    
                                RoundedRectangle(cornerRadius: 20)
                                    .frame(height: 3)
                                    .foregroundStyle(.realRed)
                            }
                            .fixedSize()
                            
                            Text(manager.convertHtmlToPlainText(dataPolimats.title.rendered))
                                .font(.custom("Roboto-Bold", size: 17))
                                .foregroundStyle(.white)
                            
                            
                            Text(manager.convertHtmlToPlainText(dataPolimats.excerpt.rendered))
                                .font(.custom("Roboto-Regular", size: 13.5))
                                .foregroundStyle(.white)
                                .lineSpacing(5)
                                .multilineTextAlignment(.leading)
                                .frame(alignment: .leading)
                        }
                        .padding(.horizontal, 15)
                        .padding(.top, 20)
                        
                        Spacer()
                        
                        HStack {
                            Spacer()
                            Button(action: {
                                action()
                            }, label: {
                                ZStack {
                                    Circle()
                                        .frame(width: 30, height: 30)
                                        .foregroundStyle(colorScheme == .dark ? .gray.opacity(0.6) : .duyuru)
                                    
                                    Image(systemName: "arrow.right")
                                        .foregroundStyle(.realRed)
                                        .font(.system(size: 18))
                                    
                                }
                                
                            })
                        }
                        .padding(.trailing, 15)
                        .padding(.bottom, 15)
                    }
                }
                .frame(width: geo.size.width * 0.8, height: geo.size.height * 0.45)
                
            }
            .padding(.bottom, 30)
            
            
            .frame(width: geo.size.width, height: geo.size.height, alignment: .center)
        }
    }
}

#Preview {
    PopularCell(dataPolimats: exData.exArticle) {
        print("tapped")
    }
}
