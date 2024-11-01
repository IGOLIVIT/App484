//
//  SettingsView.swift
//  App484
//
//  Created by IGOR on 31/10/2024.
//

import SwiftUI
import StoreKit

struct SettingsView: View {
    
    @StateObject var viewModel = TransactionsViewModel()

    var body: some View {

        ZStack {
            
            LinearGradient(colors: [Color("prim").opacity(0.9), Color("bg"), Color("bg"), Color("bg"), Color("bg"), Color("bg"), Color("bg")], startPoint: .topTrailing, endPoint: .bottomLeading)
                .ignoresSafeArea()
            
            VStack {
                
                HStack {
                    
                    Text("Settings")
                        .foregroundColor(.white)
                        .font(.system(size: 26, weight: .semibold))
                    
                    Spacer()
                    
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isPairs = true
                        }
                        
                    }, label: {
                        
                        HStack {
                            
                            Text("USD")
                                .foregroundColor(Color("prim"))
                                .font(.system(size: 14, weight: .semibold))
                            
                            Image(systemName: "chevron.right")
                                .foregroundColor(Color("prim"))
                                .font(.system(size: 16, weight: .semibold))
                            
                        }
                        .padding(9)
                        .background(RoundedRectangle(cornerRadius: 25).fill(.black))
                    })
                }
                .padding()
                
                HStack {
                    
                    Button(action: {
                        
                        SKStoreReviewController.requestReview()
                        
                    }, label: {
                        
                        VStack(spacing: 12) {
                                                        
                                Image(systemName: "star.fill")
                                    .foregroundColor(Color("prim"))
                                    .font(.system(size: 22, weight: .regular))
                                
                                Text("Rate app")
                                .foregroundColor(Color("prim"))
                                    .font(.system(size: 15, weight: .regular))
     
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .frame(height: 100)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg2")))
                        
                    })

                    Button(action: {
                        
                        guard let url = URL(string: "https://www.termsfeed.com/live/c7d1a06f-5ffe-48ff-be85-b42cfb7bd40e") else { return }
                        
                        UIApplication.shared.open(url)
                        
                    }, label: {
                        
                        VStack(spacing: 12) {
                                                        
                                Image(systemName: "doc.text.fill")
                                    .foregroundColor(Color("prim"))
                                    .font(.system(size: 22, weight: .regular))
                                
                                Text("Usage Policy")
                                .foregroundColor(Color("prim"))
                                    .font(.system(size: 15, weight: .regular))
     
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .frame(height: 100)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg2")))
                        
                    })
                    
                }
                .padding()

                Spacer()
            }
        }
        .sheet(isPresented: $viewModel.isPairs, content: {
            
            PairsView(viewModel: viewModel)
        })
    }
}

#Preview {
    SettingsView()
}
