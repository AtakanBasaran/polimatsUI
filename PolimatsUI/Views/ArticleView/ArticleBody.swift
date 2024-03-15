import SwiftUI
import SwiftSoup
import WebKit


protocol ElementViewModel {
    var id: String { get }
    var view: AnyView { get }
}

struct ArticleBody: View {
    
    let elements: [ElementViewModel]
    let manager = Manager()
    @Environment(\.colorScheme) var colorScheme
    
    init(dataPolimats: WordPressData) {
        self.elements = manager.parseElements(from: dataPolimats.content.rendered)
    }
    
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            ForEach(elements, id: \.id) { viewModel in
                viewModel.view
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        .ignoresSafeArea(edges: .horizontal)
        .padding(.horizontal, 15)
    }
}



struct LinkedParagraphViewModel: ElementViewModel {
    let id = UUID().uuidString
    let attributedString: NSAttributedString
    
    var view: AnyView {
        AnyView(
            Text(attributedString.string)
                .font(.custom("Roboto-Regular", size: 17))
                .lineSpacing(10)
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .foregroundColor(Color(red: 255/255, green: 0/255, blue: 0/255))
                .onTapGesture {
                    // Handle tapping the link
                    // You can use attributedString.attribute(.link, at: index, effectiveRange: nil) to get the URL
                }
        )
    }
}

struct ImageViewModel: ElementViewModel {
    let id = UUID().uuidString
    let src: String
    var view: AnyView {
        
        AnyView(
            
            HStack {
                Spacer()
                
                ImageHandle(placeHolder: "grayImage", urlString: src)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 340, alignment: .center)
                    .clipShape(.rect(cornerRadius: 20))
                
                Spacer()
            }
        )
        
    }
}

struct LinkViewModel: ElementViewModel {
    let id = UUID().uuidString
    let label: String
    let destination: String
    
    var view: AnyView {
        AnyView(
            Link(destination: URL(string: destination)!) {
                Text(label)
                    .foregroundStyle(.realRed)
            }
        )
    }
}

struct TitleViewModel: ElementViewModel {
    
    let id = UUID().uuidString
    let text: String
    
    var view: AnyView {
        
        AnyView(
            HStack {
                Rectangle()
                    .frame(width: 4, alignment: .leading)
                
                Text(text)
                    .font(.custom("Roboto-Bold", size: 20))
                    .multilineTextAlignment(.leading)
                
                Spacer()
            }
                .fixedSize(horizontal: false, vertical: true)
                .frame(alignment: .leading)
            
            
        )
    }
}

struct ParagraphViewModel: ElementViewModel {
    let id = UUID().uuidString
    let text: String
    
    var view: AnyView {
        AnyView(
            HStack {
                
                Text(text)
                    .font(.custom("Roboto-Regular", size: 17))
                    .lineSpacing(10)
                    .multilineTextAlignment(.leading)
                
                Spacer()
            }
        )
    }
}

struct ListItemViewModel: ElementViewModel {
    let id = UUID().uuidString
    let text: String
    
    var view: AnyView {
        
        AnyView(
            HStack(alignment: .top) {
                Image(systemName: "circle.fill")
                    .font(.system(size: 6))
                    .padding(.top, 6)
                
                Text(text)
                    .font(.custom("Roboto-Regular", size: 17))
                    .lineSpacing(10)
                    .multilineTextAlignment(.leading)
                
                Spacer()
            }
                .frame(alignment: .leading)
                .padding(.leading, 15)
        )
    }
}

struct YouTubeViewModel: ElementViewModel {
    let id = UUID().uuidString
    let embedURL: String
    
    var view: AnyView {
        AnyView(
            HStack {
                Spacer()
                
                YouTubeVideo(videoURL: embedURL)
                    .frame(width: 350, height: 200, alignment: .center)
                    .clipShape(.rect(cornerRadius: 20))
                
                Spacer()
            }
            
        )
    }
}

struct YouTubeVideo: UIViewRepresentable {
    
    let videoURL: String
    
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        if let url = URL(string: videoURL) {
            webView.load(URLRequest(url: url))
        }
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
    }
}
