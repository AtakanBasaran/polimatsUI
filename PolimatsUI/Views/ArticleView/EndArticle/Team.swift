//
//  Team.swift
//  PolimatsUI
//
//  Created by Atakan Başaran on 21.02.2024.
//

import SwiftUI

struct Team: View {
    
    @EnvironmentObject var mainVM: MainPageViewModel
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        
        
        ScrollView {
            
            Text("Ekip")
                .font(.custom("Roboto-Bold", size: 5))
                .opacity(0)
                .id("top4")
                .padding(.bottom, 10)
            
            VStack(spacing: 55) {
                
                Person(image: "oğuz", name: "Oğuz Erdem", job: "Yazar | Web Geliştirme", about: "Merhaba! Benim adım Oğuz. Bilkent Üniversitesi Makine Mühendisliği mezunuyum. Mayıs 1999 yılı Bursa doğumluyum. Boş zamanlarımda kendimi teknoloji, spor ve sinema alanlarında geliştirmeye çalışıyorum. Hobi olarak kitap okuyup, kendi hayatımın kesitlerinden oluşan videolar çekiyor, ülkeleri geziyor, yazılım ve yabancı dil öğreniyorum.", urlLinkedin: "https://www.linkedin.com/in/oquzerdm/")
                
                Person(image: "atakan", name: "Atakan Başaran", job: "Yazar | iOS Geliştirme", about: "Merhaba, ben Atakan. Bilkent Üniversitesi, Elektrik-Elektronik Mühendisliği mezunuyum. 1998 yılında Bursa’da doğdum. Spora ve teknolojiye çocukluğumdan beri ilgi duyuyorum ve zaman harcayıp, kendimi geliştirmeye çalışıyorum. Ayrıca bölümüm gereği teknoloji ve yazılım dünyasını yakından takip ediyorum.", urlLinkedin: "https://www.linkedin.com/in/atakan-basaran/")
                
                Person(image: "ataberk", name: "Ataberk Alikahya", job: "Yazar | İçerik Editörü", about: "Merhaba, ben Ataberk. Bilkent Üniversitesi’nde Endüstri Mühendisliği mezunuyum. 1999 Bursa doğumluyum. Çocukluğumdan beri her türlü sporla içli dışlıyım, özellikle futbol, basketbol ve fitness ile ilgileniyorum. Ayrıca yazılım ve finans konularında kendimi geliştirmeye çalışıyorum.", urlLinkedin: "https://www.linkedin.com/in/ataberk-alikahya-8905551b1/")
                
                Person(image: "arda", name: "Arda Ilgaz", job: "Yazar", about: "Merhaba, ben Arda. 1999’da İzmir’de doğdum. Bilkent Üniversitesi Endüstri Mühendisliği mezunuyum. Film izlemeyi ve izlediğim filmler üzerine yazı yazmayı seviyorum. Ayrıca bölümüm gereğince ekonomi ve dijital pazarlama alanlarında da kendimi geliştirmeye çalışıyorum.", urlLinkedin: "https://www.linkedin.com/in/ilgazarda/")
                
                Person(image: "berke", name: "Berke Yaşar", job: "Yazar", about: "Merhabalar, ben Berke. 1999 yılında Bursa’da doğdum. Boğaziçi Üniversitesi’nde Kimya Mühendisliği bölümü mezunuyum. Çeşitli sporlarla (basketbol, futbol ve atletizm) uğraşıyorum ve basketbol gündemini yakından takip ediyorum. Diğer hobilerim ise dizi-film seyretmek ve müzik dinlemek.", urlLinkedin: "https://www.linkedin.com/in/berke-yasar-738343193/")
            }
            .padding(.top, 10)
            
            
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
        
        .onAppear(perform: {
            mainVM.showButton = false
        })
        
        .navigationBarBackButtonHidden()
        .navigationTitle("Ekip")
        .navigationBarTitleDisplayMode(.large)
        
    }
}

#Preview {
    Person(image: "atakan", name: "Atakan Başaran", job: "iOS", about: "Bilkent", urlLinkedin: "https://www.linkedin.com/in/atakan-basaran/")
}

struct Person: View {
    
    let image: String
    let name: String
    let job: String
    let about: String
    let urlLinkedin: String
    
    var body: some View {
        
        VStack {
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 270, height: 270)
                .clipShape(Circle())
                .overlay {
                    Circle()
                        .stroke(LinearGradient(colors: [Color(.darkGray)], startPoint: .top, endPoint: .bottom),style: StrokeStyle(lineWidth: 3))
                }
            
            
            VStack(alignment: .leading, spacing: 15) {
                
                HStack {
                    Text(name)
                        .font(.custom("Roboto-Bold", size: 26))
                        .foregroundStyle(.realRed)
                    
                    Link(destination: URL(string: urlLinkedin)!) {
                        Image("linkedin")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .aspectRatio(contentMode: .fit)
                    }
                }
                
                Text(job)
                    .font(.custom("Roboto-Medium", size: 20))
                
                Madde(text: about)
            }
            .padding(.top, 20)
            .padding(.horizontal, 10)
        }
    }
}
