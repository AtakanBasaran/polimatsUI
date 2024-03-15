//
//  AboutUs.swift
//  PolimatsUI
//
//  Created by Atakan Başaran on 21.02.2024.
//

import SwiftUI

struct AboutUs: View {
    
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var mainVM: MainPageViewModel
    
    
    var body: some View {
        
        ScrollView {
            
            VStack(spacing: 25) {
                
                Stack(title: "Merhaba!", text: "Öncelikle bu kısma baktığınız için çok teşekkürler. Uygulamamızı kullandığınızı ve ilginizi çektiğini düşünüyoruz. Eğer çekmemiş olsa neden bizim hakkımızda bilgi almak isteyesiniz ki? Muhabbetimizi çok uzatmadan direkt hakkımızdaki konuya girelim isterseniz. ")
                    .id("top5")
                
                
                Image(colorScheme == .dark ? "polimats-white" : "polimats-black")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100)
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .frame(width: 380, height: 120)
                            .foregroundStyle(Color(.duyuru))
                    )
                    .padding(.top, 10)
                
                Stack(title: "Biz Kimiz?", text: "Biz, boş vakitlerinde kendi düşüncelerini ve birikimlerini başkalarına aktarmayı seven birkaç üniversiteli genciz. polimats.com ailesi olarak hem bilgi tüketmeyi hem de bilgiyi üretmeyi ve paylaşmayı seviyoruz. Çünkü inanıyoruz ki bilgi paylaştıkça çoğalır ve gelişir. Kendi bildiklerimizden birkaçını bile siz değerli okuyucularımıza aktarabiliyorsak ve günün birinde bu bilgileri gerçek anlamda kullanmanıza yardımcı oluyorsak demek ki başarılı olmuşuzdur.")
                
                
                Stack(title: "polimats?", text: "Polimat kelimesinin ilk duyulduğunda alışılmadık bir sözcük olduğunu söyleyebiliriz. Ama kelimemiz tam olarak bizim yaptığımız içerik üretimini anlatıyor. Kökü Yunanca’ya dayanan Polimat sözcüğü, engin bilgiye sahip olan kişi anlamına gelmektedir. Türkçe karşılığı ise Hazârfen’dir. Sitemiz aracılığı ile sizlere her türlü konuda, bilinenin aksine daha ilginç ve bilinmeyen bilgileri ulaştırmaya çalışıyoruz. Bu yüzden de kelime olarak bizi tanımlayan bir kelime seçtiğimizi düşünüyoruz.")
                
                Stack(title: "Misyonumuz", text: "polimats.com ailesi olarak misyonumuz herkesin kaliteli bir şekilde bilgi almasına yardımcı olmaktır. Dünya üzerinde yaşayan her bireyin yasalar tarafınca korunan doğru bir şekilde özgürce bilgi alma hakkı bulunmaktadır. polimats.com bu sürece yardımcı olmak için kurulan bir web sayfasıdır. polimats.com’daki tüm içerikler kendi bünyesinde bulundurduğu kişiler tarafından oluşturulup, yayımlanmaktadır. Sayfa bünyesindeki yazarlar, başka bir kaynak kullanımında okuyucuların daha detaylı bilgilenmesi ve bilgilerin doğruluğundan emin olmaları adına alıntı yapılan içeriğin dijital adresini yazıda paylaşmak zorundadır.")
                
                Stack(title: "Web Sayfası Yapımız", text: "polimats.com olarak paylaştığımız içerikleri şu anlık 5 bölüme ayırdık (Eğlence, Teknoloji, Spor, Sinema, Gezi). Ek olarak belirlediğimiz türlere dahil olmayan yazılarımızı Serpme kategorimizde bulunduruyoruz. İlerleyen süreçte bu bölümlere yenileri de eklenebilir. Polimats kelimesinin sonundaki -s takısı, İngilizce’deki çoğul ekidir ve sitemizdeki alt başlıkları temsil eder. Sitemizdeki yazarlarımız kendilerini polimat hissettikleri ve hakim oldukları konu başlıklarına yazı yazarlar. Bunun sayesinde alt başlıklarımız düzenli ve doğru bilgi ile dolu kalıyor.")
                
                Stack(title: "Bağış?", text: "Evet, sizlere içerik ulaştırmak için çok uğraşıyoruz ve kar amacı gütmüyoruz. Lakin sizin de bildiğiniz üzere verilerimizi tuttuğumuz sunuculara belli bir ücret ödüyoruz. Üniversite öğrencisi olduğumuz ve ek gelir kaynaklarımız kısıtlı olduğundan dolayı böyle bir sistem yürürlüğe koyduk. Eğer sunduğumuz içerikten bir nebze bile olsa faydalanabildiyseniz ve devam etmemizi canı gönülden istiyorsanız bize yardımcı olabilirsiniz. Şu anlık bağışınızın karşılığında size büyük bir minnet haricinde bir şey sunamıyor olsak bile ilerideki projelerimizde bu durumu değiştirebiliriz. Bu yüzden sosyal mecralar üzerinden bizimle iletişim halinde kalabilirsiniz. Ama diyorsanız ki “ben kendi geçimimi zor sağlıyorum.” sizi tabii ki de anlayışla karşılarız. Sonuçta sitemize girmeniz ve bizden haberdar olmanız bile bizim için büyük bir şey.")
                
                Stack(title: "Son Sözler", text: "Öncelikle hakkımızdaki bilgileri buralara kadar okuduğunuz için teşekkürler. Bizi daha iyi anladığınızı yani kendimizi daha iyi ifade ettiğimizi düşünüyoruz. Aklınızda daha fazla soru kaldıysa kişisel e-posta adreslerimizden veya iletişim bölümündeki formdan bize her zaman ulaşabilirsiniz. Merak etmeyin, hiçbir sorunuzu cevapsız bırakmayacağız. Umuyoruz ki bizi takip etmeye devam edersiniz. Unutmayın; az bilgi ile asla yetinmeyin, daha fazlası için çabalayın.")
                
                HStack() {
                    Spacer()
                    
                    Text("Oğuz Erdem |")
                        .font(.custom("Roboto-Regular", size: 17))
                    
                    Text("polimats.com")
                        .font(.custom("Roboto-Medium", size: 17))
                }
                .padding(.trailing, 10)
                
                
                
            }
            .padding(.top, 20)
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
        .navigationTitle("Hakkımızda")
        .navigationBarTitleDisplayMode(.large)
        .navigationBarBackButtonHidden()
        
        .onAppear(perform: {
            mainVM.showButton = false
        })
        
    }
}

#Preview {
    AboutUs()
}

struct Stack: View {
    
    let title: String
    let text: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(title)
                .font(.custom("Roboto-Bold", size: 22))
            
            Madde(text: text)
        }
    }
}
