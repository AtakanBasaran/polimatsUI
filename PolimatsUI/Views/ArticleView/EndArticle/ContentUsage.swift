//
//  İçerikKullanım.swift
//  PolimatsUI
//
//  Created by Atakan Başaran on 20.02.2024.
//

import SwiftUI

struct ContentUsage: View {
    
    @Environment(\.dismiss) var dismiss
    @Environment(\.colorScheme) var colorScheme
    @EnvironmentObject var mainVM: MainPageViewModel
    
    var body: some View {
        
        ScrollView {
            
            Text("İÇERİK KULLANIM BİLDİRGESİ")
                .font(.custom("Roboto-Bold", size: 28))
                .multilineTextAlignment(.center)
                .padding(.horizontal, 10)
                .padding(.bottom, 5)
                .id("top2")
            
            VStack(alignment: .leading, spacing: 20) {
                Madde(text: "İnternet sitemizde barındırdığımız her içerik yazarlarımızın kendi cümleleri ile kurduğu özgün metinlerdir. Kullanılan görseller ve yan içerikler kaynakça gösterilerek paylaşılmaktadır. polimats.com olarak bilginin paylaşılması tarafındayız. Yazarlarımızın yazılarını kaynakça gösterilerek ve aşağıdaki kurallara uyularak paylaşabilir, kopyalayabilir, yapıştırılabilir, çoğaltalabilir, basabilir, dağıtabilir, yayınlayabilirsiniz. Ancak bu içeriklerin hiçbiri izin alınmaksızın değiştirilemez ve değiştirilmiş halleri polimats.com sitesine aitmiş gibi sunulamaz. Benzer şekilde, yazılarımızın hiçbiri, söz konusu içeriklerimizin yazarlarından başkasına aitmiş gibi sunulamaz.")
                
                Text("Başka Ortamda Paylaşma Kuralları")
                    .font(.custom("Roboto-Bold", size: 21))
                    .multilineTextAlignment(.leading)
                
                Madde(text: "İçeriğin bir kısmı yada tamamı internet sitemiz dışındaki başka bir platformda paylaşılırken aşağıdaki kurallara uyulması zorunludur.")
                
                VStack(alignment: .leading, spacing: 12) {
                    Madde(text: "1. İçeriğin hangi siteden alındığının belirtilmesi")
                    Madde(text: "2. İçeriğin orijinal yazarının kim olduğunun açıkça belirtilmesi")
                    Madde(text: "3. İçeriğin uzun başlığının belirtilmesi")
                    Madde(text: "4. İçeriğe direk ulaşılması için yazının bulunduğu internet sayfasının adresinin belirtilmesi")
                }
                
                Madde(text: "* Erdem, Oğuz. “Paylaşılacak metnin uzun başlığı“. polimats.com/metin")
                
                Text("Resmi Ortamda Paylaşma Kuralı")
                    .font(.custom("Roboto-Bold", size: 21))
                    .multilineTextAlignment(.leading)
                
                Madde(text: "İçeriklerimizi resmi ortamlarda paylaşırken alıntı yapma biçimi olan MLA kurallarına uygun olmasına dikkat edilmelidir.")
                
                Madde(text: "* Erdem, Oğuz. “Paylaşılacak metnin uzun başlığı”. polimats.com. 09 Şubat 2019. <https://polimats.com/metin>.")
                
                Madde(text: "Bu konu hakkında daha fazla sorunuz varsa lütfen iletişim bölümündeki sosyal medya hesaplarımızdan yada iletisim@polimats.com e-posta adresinden bizimle iletişime geçebilirsiniz.")
                
            }
            .padding(.top, 10)
            .padding(.horizontal, 10)
     
            EndArticle()
                .padding(.top, 75)
                .padding(.bottom, 10)
            
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
        
        .onAppear(perform: {
            mainVM.showButton = false
        })
    }
}

//#Preview {
//    ContentUsage()
//}
