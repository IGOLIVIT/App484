//
//  LoadingView.swift
//  App484
//
//  Created by IGOR on 30/10/2024.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {

        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Image("bg")
                        .resizable()
                        .ignoresSafeArea()
                    
                 Image("Llogo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
            }
        }
    }
}

#Preview {
    LoadingView()
}
