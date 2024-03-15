//
//  MainPageModelView.swift
//  PolimatsUI
//
//  Created by Atakan Başaran on 4.02.2024.
//

import SwiftUI

//"https://polimats.com/wp-json/wp/v2/posts?per_page=100&categories=\(category)"

@MainActor class MainPageViewModel: ObservableObject {
    
    @Published var polimatsData: [WordPressData] = []
    @Published var polimatsDataMore: [WordPressData] = []
    @Published var polimatsDataPopular: [WordPressData] = []
    @Published var polimatsDataSearch: [WordPressData] = []
    @Published var polimatsDataRandom: [WordPressData] = []
    @Published var isLoading = false
    @Published var showButton = false
    @Published var isLoadingLogo = true
    @Published var isActive = false
    @Published var isActiveSearch = false
    @Published var isActiveRandom = false
    @Published var showArticle = false
    
    


    var currentPage = 1
    var lastSelectedCategory: String = ""
    var lastSelectedCategoryMore: Int? = nil
    
    func getData(category: String? = nil) {
        
        isLoading = true
        
        Task {
            do {
                let categoryToUse = category ?? lastSelectedCategory
                
                let urlString = "https://polimats.com/wp-json/wp/v2/posts?per_page=10&page=\(currentPage)\(categoryToUse)"
                print("url: \(urlString)")
                
                var newData = try await NetworkManager.shared.downloadData(urlString: urlString)
                print("done data")

//                newData.removeAll {$0.categories == [140] }
//                newData = newData.filter { $0.categories.first != 140 }
                polimatsData.append(contentsOf: newData)
                isLoading = false
                currentPage += 1
                
            } catch {
                if let serviceError = error as? ApiError {
                    
                    switch serviceError {
                        
                    case .serverError:
                        print("serverError")
                        
                    case .parseError:
                        print("parseError")

                    case .invalidURL:
                        print("invalidURL")

                    case .responseError:
                        print("responseError")

                    }
                }
                isLoading = false
            }
        }
        
    }
    
    func getMoreArticleData(category: Int? = nil) {
    
        Task {
            do {
                let categoryToUse = category ?? lastSelectedCategoryMore
                
                let urlString = "https://polimats.com/wp-json/wp/v2/posts?per_page=7&page=1&categories=\(categoryToUse ?? 70)"
                print("url: \(urlString)")
                
                let newData = try await NetworkManager.shared.downloadData(urlString: urlString)
                print("done more article")

                polimatsDataMore = newData
                polimatsDataMore.removeFirst()
                
            } catch {
                if let serviceError = error as? ApiError {
                    
                    switch serviceError {
                        
                    case .serverError:
                        print("serverError")
                        
                    case .parseError:
                        print("parseError")

                    case .invalidURL:
                        print("invalidURL")

                    case .responseError:
                        print("responseError")

                    }
                }

            }
        }
        
    }
    
    func getPopularData() {
        
        isLoading = true
        
        Task {
            do {
  
                let urlString = "https://polimats.com/wp-json/wp/v2/posts?per_page=15&tags=169"
                print("url: \(urlString)")
                
                let newData = try await NetworkManager.shared.downloadData(urlString: urlString)
                print("done popular data")

                polimatsDataPopular = newData
                isLoading = false
                
            } catch {
                if let serviceError = error as? ApiError {
                    
                    switch serviceError {
                        
                    case .serverError:
                        print("serverError")
                        
                    case .parseError:
                        print("parseError")

                    case .invalidURL:
                        print("invalidURL")

                    case .responseError:
                        print("responseError")

                    }
                }
                isLoading = false
            }
        }
        
    }
    
    func searchData(search: String) {
        
        isLoading = true
        
        Task {
            do {
                let urlString = "https://polimats.com/wp-json/wp/v2/posts?&search=\(search)"
                
                if search != "" {
                    
                    let newData = try await NetworkManager.shared.downloadData(urlString: urlString)
                    print("search done")
                    
                    polimatsDataSearch = newData
                    polimatsDataSearch = polimatsDataSearch.filter {$0.content.rendered.localizedCaseInsensitiveContains(search)}

                    isLoading = false
                    
                } else {
                    isLoading = false
                }
           
            } catch {
                
                if let serviceError = error as? ApiError {
                    
                    switch serviceError {
                        
                    case .serverError:
                        print("serverError")
                        
                    case .parseError:
                        print("parseError")

                    case .invalidURL:
                        print("invalidURL")

                    case .responseError:
                        print("responseError")

                    }
                }
                isLoading = false
            }
    
        }
    }
    
    func getRandomData(category: Int) {
        
        isLoading = true
        
        Task {
            do {
  
                let urlString = "https://polimats.com/wp-json/wp/v2/posts?per_page=100&categories=\(category)"
                print("url: \(urlString)")
                
                var newData = try await NetworkManager.shared.downloadData(urlString: urlString)
                print("done random data")
                
                
                polimatsDataRandom.append(newData.randomElement() ?? exData.exArticle)
                newData.removeAll()
                isLoading = false
                
            } catch {
                if let serviceError = error as? ApiError {
                    
                    switch serviceError {
                        
                    case .serverError:
                        print("serverError")
                        
                    case .parseError:
                        print("parseError")

                    case .invalidURL:
                        print("invalidURL")

                    case .responseError:
                        print("responseError")

                    }
                }
                isLoading = false
            }
        }
        
    }
    
    func hapticFeedback() {
        
        let generator = UIImpactFeedbackGenerator(style: .heavy)
        generator.impactOccurred()
        
    }
    
}


