import SwiftUI

struct UpButton: View {
    
    @Binding var showButton: Bool
    var action: () -> ()
    
    var body: some View {
    
        
        if showButton {
            Button(action: action, label: {
                
                ZStack {
                    Circle()
                        .frame(width: 60, height: 60)
                        .foregroundStyle(Color(.realRed))
                    
                    Image(systemName: "chevron.up")
                        .font(.system(size: 22))
                        .fontWeight(.bold)
                        .foregroundStyle(.white)
                }
            })
        }
        
 
    }
}



#Preview {
    UpButton(showButton: .constant(true), action: {print("tapped")})
}

