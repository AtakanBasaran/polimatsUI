//
//  NetworkManager.swift
//  PolimatsUI
//
//  Created by Atakan Başaran on 4.02.2024.
//

import UIKit

enum ApiError: Error {
    case serverError
    case parseError
    case invalidURL
    case responseError
}

final class NetworkManager {
    
    static let shared = NetworkManager()
    private let cache = NSCache<NSString, UIImage>()
    
    private init() {}
    
    func downloadData(urlString: String) async throws -> [WordPressData] {
        
        guard let url = URL(string: urlString) else {
            throw ApiError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw ApiError.responseError
        }
        
        if data.isEmpty {
            throw ApiError.serverError
        }
        
        do {
            let decodedData = try JSONDecoder().decode([WordPressData].self, from: data)
            return decodedData
            
        } catch {
            throw ApiError.parseError
        }
        
    }
    
    
    func downloadImage(urlString: String, completion: @escaping(UIImage?) -> ()) {
        
        let cacheKey = NSString(string: urlString)
        
        if let image = cache.object(forKey: cacheKey) { //if we have a image return that
            completion(image)
            return
        }
        
        guard let url = URL(string: urlString) else {
            completion(nil)
            print("invalid url for image")
            print("image url: \(urlString)")
            return
        }
        
        URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            
            if let error {
                print(error.localizedDescription)
            }
            
            guard let data, let image = UIImage(data: data) else {
                completion(nil)
                return
            }
            
            self.cache.setObject(image, forKey: cacheKey) //save into cache
            
            DispatchQueue.main.async {
                completion(image)
            }
            
        }.resume()
    }
    
}
