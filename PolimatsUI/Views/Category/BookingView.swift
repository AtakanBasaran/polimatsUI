//
//  BookingView.swift
//  MovieBooking
//
//  Created by Atakan Başaran on 3.02.2024.
//

import SwiftUI

struct BookingView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @State var gradient = [Color("cyan").opacity(0), Color("cyan"), Color("cyan"), Color("cyan")]
    
    @State var selectedDate = false
    @State var bindingSelection = false
    @State var selectedHour = false
    
    var body: some View {
        
        NavigationStack {
            
            ZStack {
                Image("booking")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxHeight: .infinity, alignment: .top)
                
                VStack { //apply fading effect
                    LinearGradient(colors: gradient, startPoint: .top, endPoint: .bottom)
                        .frame(height: 600)
                }
                .frame(maxHeight: .infinity, alignment: .bottom)
                
                VStack(spacing: 0) {
                    HStack {
                        CircleButton(action: {
                            dismiss()
                        }, image: "arrow.left")
                        
                        Spacer()
                        
                        CircleButton(action: {
                            
                        }, image: "ellipsis")
                    }
                    .padding(EdgeInsets(top: 46, leading: 20, bottom: 0, trailing: 20))
                    
                    Text("Doctor Strange")
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundStyle(.white)
                        .padding(.top, 200)
                    
                    Text("in the Multiverse of Madness")
                        .font(.title3)
                        .foregroundStyle(.white)
                    
                    Text("Dr. Stephen Strange casts a forbidden spell that opens the doorway to multiverse, including alternate version of... ")
                        .font(.subheadline)
                        .foregroundStyle(.white)
                        .padding(30)
                    
                    Text("Select date and time")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)

                }
                .frame(maxHeight: .infinity, alignment: .top)
            }
            .background(Color("cyan"))
        .ignoresSafeArea()
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    BookingView()
}
