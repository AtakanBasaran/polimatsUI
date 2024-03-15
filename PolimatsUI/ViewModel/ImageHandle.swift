//
//  ImageHandle.swift
//  PolimatsUI
//
//  Created by Atakan Başaran on 4.02.2024.
//

import SwiftUI

final class ImageDownload: ObservableObject {
    
    @Published var image: Image? = nil
    
    func getImage(urlString: String) {
        
        NetworkManager.shared.downloadImage(urlString: urlString) { uiImage in
            
            guard let uiImage else {return}
            
            DispatchQueue.main.async { //UI change
                self.image = Image(uiImage: uiImage)
            }
        }
    }
}


struct ImagePlaceHolder: View {
    
    var image: Image?
    let placeHolder: String
    
    var body: some View {
        image?.resizable() ?? Image(placeHolder).resizable()
    }
    
}


struct ImageHandle: View {
    
    @StateObject var imageDownload = ImageDownload()
    let placeHolder: String
    
    let urlString: String
    
    var body: some View {
        
        ImagePlaceHolder(image: imageDownload.image, placeHolder: placeHolder)
            .task {
                imageDownload.getImage(urlString: urlString)

            }
    }
}

