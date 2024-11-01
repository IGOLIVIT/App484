//
//  R2.swift
//  App484
//
//  Created by IGOR on 30/10/2024.
//

import SwiftUI

struct R2: View {
    
    @AppStorage("status") var status: Bool = false
    
    var body: some View {

        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Image("R2")
                        .resizable()
                        .ignoresSafeArea()
                 
                    VStack {
                        
                        Text("Keep transactions in one place!")
                            .foregroundColor(.white)
                            .font(.system(size: 34, weight: .bold))
                            .multilineTextAlignment(.center)
                            .padding()
                        
                        Spacer()
                        
                        Button(action: {
                            
                            status = true
                            
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
    R2()
}
