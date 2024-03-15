//
//  KKVK.swift
//  PolimatsUI
//
//  Created by Atakan Başaran on 16.02.2024.
//

import SwiftUI

struct KKVK: View {
    
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var mainVM: MainPageViewModel

    
    var body: some View {
        
        ScrollView {
            
            VStack(spacing: 15) {
                
                Text("KULLANIM KOŞULLARI VE GİZLİLİK SÖZLEŞMESİ")
                    .font(.custom("Roboto-Bold", size: 24))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 10)
                    .padding(.bottom, 35)
                    .id("top1")
                
                
                VStack(alignment: .leading, spacing: 20) {
                    Text("KULLANIM KOŞULLARI")
                        .font(.custom("Roboto-Bold", size: 21))
                        .multilineTextAlignment(.leading)
                    
                    Madde(text: "polimats.com internet sitesini kullanarak, işbu Kullanım Koşulları’nı, Gizlilik Politikası’nı ve Kişisel Verilerin Korunmasına İlişkin Aydınlatma Metni’ni bir bütün olarak kabul etmiş olursunuz.")
                    
                    Text("polimats.com hizmetlerinden yararlanan kullanıcı;")
                        .multilineTextAlignment(.leading)
                        .font(.custom("Roboto-Regular", size: 17))
                    
                    VStack(alignment: .leading, spacing: 15) {
                        
                        Madde(text: " 1. polimats.com’u kullanırken yürürlükteki mevzuatı ihlal etmeyeceğini,")
                        Madde(text: " 2. polimats.com’da yayınlanan hiçbir içeriği polimats.com’dan izin almadan ticari amaçla olsun veya olmasın kullanmayacağını; editörler tarafından üretilen her neviden içerikleri başka internet sitelerinde, konvansiyonel ortamlarda ve diğer mecralarda sahibinin adı ve bağlantı (link) belirtmeksizin yayınlayamayacağını,")
                        Madde(text: " 3. polimats.com markalarının tescilli markalar olduğunu ve izinsiz kullanılamayacağını,")
                        Madde(text: " 4. Herhangi bir yazılım, donanım veya iletişim unsuruna zarar vermek, işlevini aksatmak maksadıyla virüs içeren yazılım veya başka bir bilgisayar kodu, dosyası oluşturmayacağını, yetkisi olmayan herhangi bir sisteme ve/veya veriye ulaşmaya çalışmayacağını,")
                        Madde(text: " 5. Ayrıca direkt veya dolaylı olarak, verilen hizmetlerdeki algoritmaları ve kodları deşifre edecek, işlevlerini bozacak davranışlarda bulunmayacağını, İçerikleri değiştirme, dönüştürme, çevirme, alıntı göstermeksizin başka sitelerde yayınlama gibi davranışlarda bulunmayacağını,")
                        Madde(text: " 6. polimats.com adresinde yayınlanan içeriklerin paylaşılması sebebiyle doğacak olan tüm hukuki sorumluluğun paylaşan kişiye ait olduğunu, polimats.com’un hiçbir sorumluluğunun olmadığını,")
                        Madde(text: " 7. polimats.com birçok içeriğinden başka sitelere bağlantı (link) verilebileceği kabulü ile polimats.com tarafından bağlantı (link)  verilen, tavsiye edilen diğer sitelerin bilgi kullanımı, gizlilik ilkeleri ve içeriğinden polimats.com’un sorumlu olmadığını,")
                        Madde(text: " 8. polimats.com’un kendi ürettiği veya dışardan aldığı bilgi, belge, yazılım, tasarım, grafik vb. eserlerin 5846 Sayılı Fikir ve Sanat Eserleri Kanunu kapsamında korunduğunu ve eser hakkının ihlali halinde bundan dolayı sorumlu olunacağını,")
                        Madde(text: " 9. polimats.com‘un kullanıcı üyeliği gerektirmeyen hizmetleri zaman içinde üyelik gerektiren bir hale dönüştürebileceğini, ilave hizmetler açabileceğini, bazı hizmetlerini kısmen veya tamamen değiştirebileceği veya ücretli hale dönüştürebileceğini,")
                        Madde(text: "10. Kullanıcının içerik oluşturmasına izin verilen yorumlarda ya da forumlarda ya da diğer platformlarda içerik oluşturan kişilerin bu içerikten dolayı tamamen ve tek başına sorumlu olduğunu,")
                        Madde(text: " 11. polimats.com’un içerik oluşturan kullanıcı ile ilgili kısıtlama ve kullanıcı engelleme, silme hakkına sahip olduğunu,")
                        Madde(text: " 12. polimats.com’un hizmetleri, tasarımı ve içeriği her zaman değiştirebilme hakkını saklı tuttuğunu ve sunulan hizmetlerin kullanıcılara kazanılmış hak tahsis etmeyeceğini,")
                        Madde(text: " 13. polimats.com’un kullanım koşulları ve kuralları her zaman tek taraflı değiştirme hakkının saklı olduğunu")
                    }
                    .padding(.top, 7)
                    
                    Madde(text: "ve bu kapsamda, işbu Kullanım Koşulları’nın, Gizlilik Politikası’nın ve Kişisel Verilerin Korunmasına İlişkin Aydınlatma Metni’nin tamamını okuduğunu ve bir bütün olarak onayladığını, polimats.com’a mümkün olan tüm mecralar vasıtası ile ulaşarak ayrıca onay gerekmeksizin belirtilen tüm metinleri ve de metinlerde belirtilen kural ve koşulları bir bütün olarak kabul, beyan ve taahhüt eder.")
                    
                    
                    
                    
                    VStack(alignment: .leading, spacing: 15) {
                        
                        Text("GİZLİLİK POLİTİKASI")
                            .font(.custom("Roboto-Bold", size: 21))
                            .multilineTextAlignment(.leading)
                        
                        Madde(text: "polimats.com web sitesi web sitesi içerisinde gezindiğiniz süre boyunca ‘cookie’ olarak adlandırılan ve Türkçe’ye çerez olarak geçirilen bazı unsurların bilgisayarınıza entegre edilmesi söz konusu olabilir. Çerezler basit metin dosyalarıdır ve kişisel veri ya da başkaca özel veri içermemektedir. Web sitesi oturum bilgileri ve benzeri veriler saklar ve kullanıcıları tekrar tanımak için kullanır. Bu içeriğin güvenilirliğine ilişkin polimats.com’un sorumluluğu bulunmamaktadır.")
                        
                        Madde(text: "polimats.com, web sitesine, haber ağına, herhangi bir listesine, sosyal ağına kaydolma/katılma sebebiyle veya kullanım süresince kullanıcıdan talep edilen veya sitenin/sosyal ağın kullanımı esnasında yapılan işlemlerin otomatik olarak kaydedilmesi yöntemleriyle toplanılan her türlü veriyi saklama, kullanma ve sair şekilde işleme hakkına sahiptir. Toplanan verilerin gizliliğini ve güvenliğini sağlamak polimats.com’un sorumluluğundadır.")
                        
                        Madde(text: "Yasal zorunluluğun söz konusu olması ve yetkili makamlar tarafından usulüne uygun olarak talep edilmesi halinde 5651 sayılı Kanun’dan ve 6698 sayılı Kanun’dan kaynaklanan hallerde bilgiler ilgili makamla paylaşılabilecektir.")
                        
                        Madde(text: "Kullanıcıların polimats.com’a ait sosyal medya paylaşım alanları, web sitesi ve mesajlaşma ortamlarında belirtilen kurallara, yürürlükteki mevzuata ve de hukuka uygun davranması gerekmektedir.")
                        
                        Madde(text: "Kullanım koşulları, Kişisel Verilerin Korunmasına İlişkin Aydınlatma Metni ve bu Gizlilik Politikası ayrılmaz bir bütündür.")
                        
                        Madde(text: "Bu Gizlilik Politikası polimats.com tarafından önceden duyurulmaksızın ve tek taraflı olarak değiştirilebilir. Gizlilik Politikası metninde değişiklik yapılması halinde, metnin yeni hali polimats.com’a yayınlandığı andan itibaren tüm kullanıcılar için geçerli olacaktır. Bu kapsamda, metindeki değişiklikleri takip etmek kullanıcıların yükümlülüğüdür.")
                        
                        Text("Keyifli kullanımlar dileriz.")
                            .font(.custom("Roboto-Bold", size: 17))
                    }
                    
                }
                .padding(.leading, 17)
                .padding(.trailing, 13)
            }
            
            
            EndArticle()
                .padding(.top, 75)
                .padding(.bottom, 35)
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
        
        
        
        .ignoresSafeArea(edges: .bottom)
        .ignoresSafeArea(edges: .horizontal)
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
//    KKVK()
//}

struct Madde: View {
    
    let text: String
    
    var body: some View {
        Text(text)
            .font(.custom("Roboto-Regular", size: 17))
            .multilineTextAlignment(.leading)
            .lineSpacing(7)
    }
}
