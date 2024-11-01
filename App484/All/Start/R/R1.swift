//
//  R1.swift
//  App484
//
//  Created by IGOR on 30/10/2024.
//

import SwiftUI

struct R1: View {
    var body: some View {

        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Image("R1")
                        .resizable()
                        .ignoresSafeArea()
                 
                    VStack {
                        
                        Text("Rent out your apartment smartly!")
                            .foregroundColor(.white)
                            .font(.system(size: 34, weight: .bold))
                            .multilineTextAlignment(.center)
                            .padding()
                        
                        Spacer()
                        
                        NavigationLink(destination: {
                            
                            R2()
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
    }
}

#Preview {
    R1()
}
