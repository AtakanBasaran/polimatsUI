//
//  TabBarItems.swift
//  PolimatsUI
//
//  Created by Atakan Başaran on 7.02.2024.
//

import Foundation

enum TabBarItems: Int, CaseIterable {
    
    case anasayfa = 0
    case popüler
    case you
    case menu

    
    var title: String {
        
        switch self {
            
        case .anasayfa:
            return "Ana Sayfa"
            
        case .popüler:
            return "Popüler"
            
        case .you:
            return "Sizin için"
            
        case .menu:
            return "Menü"
        }
    }
    
    var icon: String {
        
        switch self {
            
        case .anasayfa:
            return "house"
//            "list.bullet.clipboard"
            
        case .popüler:
            return "star"
            
        case .you:
            return "person"
            
        case .menu:
            return "circle.grid.2x2"
            
        
            
        }
    }
}
