//
//  NetworkMonitor.swift
//  PolimatsUI
//
//  Created by Atakan Başaran on 26.02.2024.
//

import Foundation
import Network

final class NetworkMonitor: ObservableObject {
    
    private let networkMonitor = NWPathMonitor()
    private let workerQueue = DispatchQueue(label: "Monitor")
    @Published var isConnected = true
    
    init() {
        
        networkMonitor.pathUpdateHandler = { path in
            
            DispatchQueue.main.async {
                self.isConnected = path.status == .satisfied
            }
        }
        
        networkMonitor.start(queue: workerQueue)
        
    }
}
