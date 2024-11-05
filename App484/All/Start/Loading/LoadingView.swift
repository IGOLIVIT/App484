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
            
            Color("nbg")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                 Image("2Llogo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding(70)
                }
            }
        }
    }
}

#Preview {
    LoadingView()
}
