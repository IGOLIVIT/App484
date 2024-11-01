//
//  Not.swift
//  App484
//
//  Created by IGOR on 30/10/2024.
//

import SwiftUI

struct Not: View {

    @AppStorage("status") var status: Bool = false
    
    var body: some View {

        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Image("Notif")
                        .resizable()
                        .ignoresSafeArea()
                 
                    VStack {
                        
                        Text("Don’t miss the most useful information")
                            .foregroundColor(.white)
                            .font(.system(size: 34, weight: .bold))
                            .multilineTextAlignment(.center)
                            .padding()
                        
                        Spacer()
                        
                        Button(action: {
                            
                            status = true
                            
                        }, label: {
                            
                            Text("Enable notifications")
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
            
            VStack {
                
                Button(action: {
                    
                    status = true
                    
                }, label: {
                    
                    Image(systemName: "xmark")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .semibold))
                        .padding(5)
                        .background(Circle().fill(.gray))
                })
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding(.horizontal)
                
                Spacer()
            }
        }
    }
}

#Preview {
    Not()
}
