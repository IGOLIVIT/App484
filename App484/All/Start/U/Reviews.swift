//
//  Reviews.swift
//  App484
//
//  Created by IGOR on 30/10/2024.
//

import SwiftUI
import StoreKit

struct Reviews: View {
    var body: some View {

        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Image("Reviews")
                        .resizable()
                        .ignoresSafeArea()
                 
                    VStack {
                        
                        Text("Rate our app in the AppStore")
                            .foregroundColor(.white)
                            .font(.system(size: 34, weight: .bold))
                            .multilineTextAlignment(.center)
                            .padding()
                        
                        Spacer()
                        
                        NavigationLink(destination: {
                            
                            Not()
                                .navigationBarBackButtonHidden()
                            
                        }, label: {
                            
                            Text("Next")
                                .foregroundColor(.black)
                                .font(.system(size: 14, weight: .regular))
                                .frame(maxWidth: .infinity)
                                .frame(height: 50)
                                .background(RoundedRectangle(cornerRadius: 20).fill(Color("prim")))
                        })
                        .padding()
                    }
                }
            }
        }
        .onAppear {
            
            SKStoreReviewController.requestReview()
        }
    }
}

#Preview {
    Reviews()
}
