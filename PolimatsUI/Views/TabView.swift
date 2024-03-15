//
//  TabView.swift
//  PolimatsUI
//
//  Created by Atakan Başaran on 7.02.2024.
//

import SwiftUI

struct TabbedView: View {
    
    @State var selectedTab = 0
    @Environment(\.colorScheme) var colorScheme
    @EnvironmentObject var mainVM: MainPageViewModel
    @EnvironmentObject var adVM: ViewModelAd
    @StateObject var networkMonitor = NetworkMonitor()
    @State private var isMenuOpen = false // Track if menu is open
    @State private var animateMenu = false
    @State private var isButtonTapped = true
    @State private var isMenuButtonTapped = false
    
    
    
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    
    var body: some View {
        
        ZStack(alignment: .bottom) {
            
            TabView(selection: $selectedTab) {
                
                CategoryView()
                    .tag(0)
                
                PopularView(dataTap: exData.exArticle)
                    .tag(1)
                
                
                ForYouBeginning()
                    .tag(2)
                
                    .onChange(of: selectedTab) { newValue in
                        if newValue == 3 { // Check if the menu tab is selected
                            
                            isMenuOpen = true
                            
                            withAnimation(.easeInOut(duration: 0.7)) {
                                animateMenu = true
                            }
                            
                        } else {
                            
                            withAnimation(.easeInOut(duration: 0.7)) {
                                isMenuOpen = false
//                                selectedTab = 0
                                isButtonTapped = false
                            }
                            animateMenu = false
                            
                        }
                        
                        if newValue != 2 {
                            mainVM.isActiveRandom = false
                        }
                        
                        if newValue != 1 {
                            mainVM.showArticle = false
                        }
                        
                        if newValue == 0 {
                            isButtonTapped = true
                        }
                    }
            }
            
            if isMenuOpen {
                
                ZStack(alignment: .bottom) {
                    
                    Color(.black)
                        .opacity(0.5)
                        .ignoresSafeArea()
                        .onTapGesture(perform: {
                            isMenuOpen = false
                            selectedTab = 0
                        })
                

                    MenuView()
//                        .padding(EdgeInsets(top: 425, leading: 10.5, bottom: 16, trailing: 10.5))
                        .padding(.bottom, 15)
                        .offset(y: animateMenu ? 0 : 300)
                }
            }
            
            ZStack {
                HStack {
                    ForEach(TabBarItems.allCases, id: \.self) { item in
                        Button(action: {
                            withAnimation(.spring) {
                                selectedTab = item.rawValue
                                mainVM.hapticFeedback()
                            }
                            
                            if selectedTab == 0 {
                                
                                if isButtonTapped {
                                    mainVM.isActive = false
                                } else {
                                    // Update the state for the first tap
                                    isButtonTapped = true
                                }
                            } else {
                                isButtonTapped = false
                            }
                            
//                            if selectedTab == 3 {
//                                
//                                if isMenuButtonTapped {
//                                    isMenuOpen = false
//                                    isMenuButtonTapped = false
////                                    selectedTab = 0
//                                    
//                                } else {
//                                    isMenuButtonTapped = true
//                                }
//                            } else {
//                                isMenuButtonTapped = false
//                            }
                            
                            
 
                        }, label: {
                            CustomTabItem(imageName: item.icon, title: item.title, isActive: (selectedTab == item.rawValue))
                        })
                    }
                }
                .padding(5)
            }
            .frame(height: 70)
            .background(colorScheme == .dark ? .gray.opacity(0.5) : .black.opacity(0.7))
            .clipShape(.rect(cornerRadius: 35))
            .padding(.horizontal, 26)
            .padding(.bottom, 15)
         
            
            if mainVM.isLoading {
                loadingScreen()
            }
            
            if mainVM.isLoadingLogo {
                LoadingViewLogo()
            }
            
            if !networkMonitor.isConnected {
                NoConnection()
            }
        }
        .ignoresSafeArea(.keyboard)
        .task {
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 5.5) {
                mainVM.isLoadingLogo = false
            }
            adVM.refreshAd()
            
        }
        .onChange(of: networkMonitor.isConnected) { _ in
            
            if mainVM.polimatsData.isEmpty {
                mainVM.getData()
            }
            
            if mainVM.polimatsDataPopular.isEmpty {
                mainVM.getPopularData()
            }
        }
        
    }
    
    func CustomTabItem(imageName: String, title: String, isActive: Bool) -> some View {
        
        HStack(spacing: 10) {
            Spacer()
            
            Image(systemName: imageName)
                .foregroundStyle(colorScheme == .dark ? (isActive ? .black : .white) : (isActive ? .white : Color(.colorGray)) )
            
            
            if isActive {
                Text(title)
                    .font(.custom("Roboto-Regular", size: 13.5))
                    .foregroundStyle(colorScheme == .dark ? (isActive ? .black : .white) : (isActive ? .white : Color(.colorGray)))
            }
            Spacer()
        }
        .frame(width: isActive ? 140 : 45, height: 60)
        .background(isActive ? Color(.realRed).opacity(0.8) : .clear)
        .clipShape(.rect(cornerRadius: 35))
    }
}

//#Preview {
//    TabbedView()
//}
