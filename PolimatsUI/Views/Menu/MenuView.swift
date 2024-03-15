//
//  Menu.swift
//  PolimatsUI
//
//  Created by Atakan Başaran on 22.02.2024.
//

import SwiftUI
import OneSignalFramework

enum AppearanceMode: String {
    case light, dark
}

enum silenceMode: String {
    case silence, loud
}

struct MenuView: View {
    
    @EnvironmentObject var mainVM: MainPageViewModel
    @Environment(\.colorScheme) var colorScheme
    @AppStorage("appearanceMode") var appearanceMode: AppearanceMode = .light
    @AppStorage("silencetMode") var silenceMode: silenceMode = .loud
    @State private var isAlertActive = false
    @State private var isPresentedSearch = false

    var body: some View {
        
    
        ZStack(alignment: .top) {
            
            
            RoundedRectangle(cornerRadius: 35)
                .frame(width: 309.5, height: 280)
                .foregroundStyle(colorScheme == .dark ? .gray.opacity(0.75) : .black.opacity(0.7))
            
            
            VStack(spacing: 30) {
                
                HStack(spacing: 30) {
                    
                    Button(action: {
                        mainVM.hapticFeedback()
                        isPresentedSearch = true
                    }, label: {
                        MenuItem(image: "magnifyingglass", text: "Ara", color: .realRed)
                    })
                
                    .popover(isPresented: $isPresentedSearch , content: {
                        SearchView()
                    })
                    
                    Button(action: {
                        mainVM.hapticFeedback()
                        appearanceMode = (appearanceMode == .light) ? .dark : .light
                    }, label: {
                        MenuItem(image: colorScheme == .dark ? "moon.fill" : "sun.max", text: colorScheme == .dark ? "Koyu" : "Açık", color: colorScheme == .dark ? .white : .sun)
                    })
                }
                .padding(.horizontal, 10)

                
                HStack(spacing: 30) {
                    
                    Button(action: {
                        mainVM.hapticFeedback()
                        EmailController.shared.sendEmail(subject: "Destek Talebi", to: "iletisim@polimats.com")
                    }, label: {
                        MenuItem(image: "envelope", text: "İletişim", color: .blue)
                    })
                    
                    
                    Button(action: {
                        //                        silenceMode = (silenceMode == .loud) ? .silence : .loud
                        //
                        //                        if silenceMode == .silence {
                        //                            silenceMode = .loud
                        //                        } else {
                        //                            isAlertActive = true
                        //                        }
                        //
                        //                        if silenceMode == .loud {
                        //                            OneSignal.User.pushSubscription.optIn()
                        //                        } else {
                        //                            OneSignal.User.pushSubscription.optOut()
                        //                        }
                        mainVM.hapticFeedback()
                        isAlertActive = true
                        
                    }, label: {
                        MenuItem(image: silenceMode == .loud ? "bell" : "bell.slash" , text: "Bildirim", color: .green)
                    })
                    
                    .alert(isPresented: $isAlertActive) {
                        Alert(title: Text("Bildirimler"), message: Text("Bildirim durumunu ayarlardan değiştirebilirsiniz.") ,primaryButton: .cancel(Text("İptal")), secondaryButton: .destructive(Text("Ayarlara git"), action: {
                            if let settingsURL = URL(string: UIApplication.openSettingsURLString) {
                                UIApplication.shared.open(settingsURL)
                            }
                        }))
                        
                    }
                }
                .padding(.horizontal, 10)

                
            }
            .padding(.top, 50)
        }
        .frame(width: 309.5, height: 280)
        
        
        
        
    }
}

#Preview {
    MenuView()
}
