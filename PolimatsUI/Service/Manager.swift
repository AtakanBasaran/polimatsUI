//
//  Manager.swift
//  PolimatsUI
//
//  Created by Atakan Başaran on 15.02.2024.
//

import Foundation
import SwiftSoup


struct Manager {
    
    
//    func getPhoto(dataPolimats: WordPressData) -> String {
//        
//        switch dataPolimats.authorInfo.displayName {
//            
//        case "Arda Ilgaz":
//            return "arda"
//            
//        case "Oğuz Erdem":
//            return "oğuz"
//            
//        case "Ataberk Alikahya":
//            return "ataberk"
//            
//        case "Atakan Başaran":
//            return "atakan"
//            
//        case "Berke Yaşar":
//            return "berke"
//            
//        case "Dilara Şen":
//            return "dilo"
//            
//        case "Büşra Şenel":
//            return "busra"
//            
//        case "Pelin Nur Özgür":
//            return "pelin"
//            
//        case "Deniz Atmaca":
//            return "deniz"
//            
//        case "Ege Çakmakçı":
//            return "ege"
//            
//        default:
//            return "polimats-black"
//        }
//        
//    }
    
    func getPhoto(dataPolimats: WordPressData) -> String {
        
        switch dataPolimats.authorInfo.displayName {
            
        case "Arda Ilgaz":
            return "https://polimats.com/wp-content/uploads/arda-ilgaz2.png"
            
        case "Oğuz Erdem":
            return "https://polimats.com/wp-content/uploads/oguz-erdem2.png"
            
        case "Ataberk Alikahya":
            return "https://polimats.com/wp-content/uploads/ataberk-alikahya3.jpg.png"
            
        case "Atakan Başaran":
            return "https://polimats.com/wp-content/uploads/atakan-basaran2.png"
            
        case "Berke Yaşar":
            return "https://polimats.com/wp-content/uploads/berke-yasar2.png"
            
        case "Dilara Şen":
            return "https://polimats.com/wp-content/uploads/cropped-dilara-sen.png"
            
        case "Büşra Şenel":
            return "https://polimats.com/wp-content/uploads/busra-senel.jpg"
            
        case "Pelin Nur Özgür":
            return "https://polimats.com/wp-content/uploads/pelinnur-ozgur.jpg"
            
        case "Deniz Atmaca":
            return "https://polimats.com/wp-content/uploads/deniz-atmaca2.jpg"
            
        case "Ege Çakmakçı":
            return "https://polimats.com/wp-content/uploads/ege-cakmakci.jpg"
        default:
            return "polimats-black"
        }
        
    }
    
    func getAbout(dataPolimats: WordPressData) -> String {
        
        switch dataPolimats.authorInfo.displayName {
            
        case "Arda Ilgaz":
            return "Merhaba, ben Arda. 1999’da İzmir’de doğdum. Bilkent Üniversitesi Endüstri Mühendisliği mezunuyum. Film izlemeyi ve izlediğim filmler üzerine yazı yazmayı seviyorum. Ayrıca bölümüm gereğince ekonomi ve dijital pazarlama alanlarında da kendimi geliştirmeye çalışıyorum."
            
        case "Oğuz Erdem":
            return "Merhaba! Benim adım Oğuz. Bilkent Üniversitesi Makine Mühendisliği mezunuyum. Mayıs 1999 yılı Bursa doğumluyum. Boş zamanlarımda kendimi teknoloji, spor ve sinema alanlarında geliştirmeye çalışıyorum. Hobi olarak kitap okuyup, kendi hayatımın kesitlerinden oluşan videolar çekiyor, ülkeleri geziyor, yazılım ve yabancı dil öğreniyorum."
            
        case "Ataberk Alikahya":
            return "Merhaba, ben Ataberk. Bilkent Üniversitesi’nde Endüstri Mühendisliği mezunuyum. 1999 Bursa doğumluyum. Çocukluğumdan beri her türlü sporla içli dışlıyım, özellikle futbol, basketbol ve fitness ile ilgileniyorum. Ayrıca yazılım ve finans konularında kendimi geliştirmeye çalışıyorum."
            
        case "Atakan Başaran":
            return "Merhaba, ben Atakan. Bilkent Üniversitesi, Elektrik-Elektronik Mühendisliği mezunuyum. 1998 yılında Bursa’da doğdum. Spora ve teknolojiye çocukluğumdan beri ilgi duyuyorum ve zaman harcayıp, kendimi geliştirmeye çalışıyorum. Ayrıca bölümüm gereği teknoloji ve yazılım dünyasını yakından takip ediyorum."
            
        case "Berke Yaşar":
            return "Merhabalar, ben Berke. 1999 yılında Bursa’da doğdum. Boğaziçi Üniversitesi’nde Kimya Mühendisliği bölümü mezunuyum. Çeşitli sporlarla (basketbol, futbol ve atletizm) uğraşıyorum ve basketbol gündemini yakından takip ediyorum. Diğer hobilerim ise dizi-film seyretmek ve müzik dinlemek."
            
        case "Dilara Şen":
            return "Merhaba! Ben Dilara, İstanbul Üniversitesi Hukuk Fakültesi mezunuyum. Bölümümün getirdiği bir kazanım olarak sosyal bilimlere karşı ilgili olduğumu söyleyebilirim, insanlarla fikir alışverişinde bulunmaktan ve yeni şeyler öğrenip genel kültürümü arttırmaktan keyif alırım. Boş zamanlarımda resim yapmak, güncel dizileri takip etmek, yeni yerler keşfedip farklı tatlar deneyimlemek ise vazgeçilmezlerimden."
            
        case "Deniz Atmaca":
            return "Merhaba, ben Deniz! Sainte Pulchérie Fransız Lisesi son sınıf öğrencisiyim. Kendimi bildim bileli resim çiziyorum ve sanata ilgiliyim. Fotoğraf çekmek; yemek, spor yapmak; seyahat etmek; dizi/film izlemek ve sevdiklerimi güldürmek en sevdiğim aktiviteler arasında."
            
        case "Pelin Nur Özgür":
            return "Herkese merhaba! Ben Pelin, 1999 yılında İzmir’de doğdum. Bilkent Üniversitesi’nde Endüstri Mühendisliği bölümü mezunuyum. Boş zamanlarımda dizi ve film izlemeyi, müzik dinlemeyi çok severim. Bunun yanında ise yeni ülkeler keşfedip yeni diller öğrenmek benim için çok önemli."
            
        case "Büşra Şenel":
            return "Merhaba! Ben Büşra Şenel. Ankara Üniversitesi Diş Hekimliği mezunuyum. 7 Ocak 1999'da Bursa'da doğdum. Uzun yıllardır sinemayla ilgileniyorum ve üzerine okumalar yapmayı seviyorum. Bana ilham veren her şeyi okumaya, izlemeye çalışıyorum."
            
        case "Altar Sertpoyraz":
            return "Merhaba, ben Altar. 2000 yılında Ankarda doğdum. Boş zamanlarımda bilim ve teknoloji konusunda dergiler okuyarak ve video editleyerek kendimi geliştiriyorum. Hobi olarak ise yeni sporlar öğrenmeye çalışıyorum, kitap okuyorum, film ve dizi izliyorum."
            
        case "Ege Çakmakçı":
            return "Merhaba! Benim adım Ege, Bilkent Üniversitesi'nde Makine Mühendisliği mezunuyum. Müziğe, otomotiv ve motorspor dünyasına yakından ilgi duyuyorum ve bu konularda öğrendiğim bilgileri paylaşıp insanlarla fikir alışverişi yapmayı seviyorum."
            
        default:
            return ""
        }
        
    }
    
    
     func getCategory(dataPolimats: WordPressData) -> String {
        
        switch dataPolimats.categories {
            
        case [7]:
            return "Sinema"
            
        case [70]:
            return "Serpme"
            
        case [9]:
            return "Eğlence"
            
        case [6]:
            return "Teknoloji"
            
        case [33]:
            return "Duyuru"
            
        case [5]:
            return "Spor"
            
        case [132], [136], [138], [134], [140], [142], [144]:
            return "English"
            
        case [8]:
            return "Gezi"
            
        default:
            return "Serpme"
        }
    }
    
    func chooseRandomCategory() -> Int {
        
        let categoryNumbers = [5, 6, 7, 8, 9, 70]
        
        if let randomCategoryNo = categoryNumbers.randomElement() {
            return randomCategoryNo
        } else {
            return 70 //return serpme category 
        }
        
    }
    
    
    func getDate(dataPolimats: WordPressData) -> String {
        
        let dateString = dataPolimats.date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        
        if let date = dateFormatter.date(from: dateString) {
            dateFormatter.dateFormat = "dd.MM.yyyy"
            
            let formattedDate = dateFormatter.string(from: date)
            return formattedDate
            
        } else {
            print("Unable to parse the date")
            return "05.12.2022"
        }
    }
    
    
    func convertHtmlToPlainText(_ htmlString: String) -> String {
        do {
            // Parse the HTML string
            let doc = try SwiftSoup.parse(htmlString)
            
            // Get the text content
            let text = try doc.text()
            
            return text
        } catch {
            print("Error converting HTML to plain text: \(error)")
            return ""
        }
    }
    
    func parseElements(from html: String) -> [ElementViewModel] {
        
        do {
            let doc: Document = try SwiftSoup.parse(html)
            let elements: Elements = try doc.select("*")
            
            var viewModels: [ElementViewModel] = []
            for element in elements {
                if let tagName = try? element.tagName() {
                    switch tagName {
                    case "img":
                        if let src = try? element.attr("src") {
                            viewModels.append(ImageViewModel(src: src))
                        }
                        
//                    case "a":
//                        if let href = try? element.attr("href"), let text = try? element.text() {
//                            viewModels.append(LinkViewModel(label: text, destination: href))
//                        }
                        
                    case "h1", "h2", "h3", "h4", "h5", "h6":
                        if let text = try? element.text() {
                            viewModels.append(TitleViewModel(text: text))
                        }
                    case "p":
                        if let text = try? element.text() {
                            viewModels.append(ParagraphViewModel(text: text))
                        }
                        
                    case "ul":
                        if let listItems = try? element.select("li") {
                            for listItem in listItems {
                                if let text = try? listItem.text() {
                                    viewModels.append(ListItemViewModel(text: text))
                                }
                            }
                        }
                        
                    case "iframe":
                        if let src = try? element.attr("src") {
                            viewModels.append(YouTubeViewModel(embedURL: src))
                        }
                    default:
                        break
                    }
                }
            }
            return viewModels
        } catch {
            // Handle parsing errors
            return []
        }
    }
    
     
}




