//
//  PairsView.swift
//  App484
//
//  Created by IGOR on 31/10/2024.
//

import SwiftUI

struct PairsView: View {
    
    @StateObject var viewModel: TransactionsViewModel
    @Environment(\.presentationMode) var back
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                RoundedRectangle(cornerRadius: 6)
                    .fill(.gray)
                    .frame(width: 40, height: 5)
                    .padding(.bottom)
                
                ZStack {
                    
                    Text("Cirrencies")
                        .foregroundColor(.white)
                        .font(.system(size: 18, weight: .semibold))
                    
                    HStack {
                        
                        Button(action: {
                            
                            back.wrappedValue.dismiss()
                            
                        }, label: {
                            
                            Image(systemName: "chevron.left")
                                .foregroundColor(Color("prim"))
                                .font(.system(size: 16, weight: .semibold))
                            
                            Text("Back")
                                .foregroundColor(Color("prim"))
                                .font(.system(size: 16, weight: .regular))
                            
                            Spacer()
                        })
                    }
                }
                .padding(.bottom, 25)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack(spacing: 17) {
                        
                        ForEach(viewModel.pairs, id: \.self) { index in
                            
                            Button(action: {
                                
                                viewModel.curCurrency = index
                                
                                withAnimation(.spring()) {
                                    
                                    viewModel.isGraph = true
                                }
                                
                            }, label: {
                                
                                HStack {
                                    
                                    Image(index)
                                        .resizable()
                                        .frame(width: 50, height: 30)
                                    
                                    Text(index)
                                        .foregroundColor(.white)
                                        .font(.system(size: 17, weight: .medium))
                                    
                                    Spacer()
                                    
                                    VStack(alignment: .trailing, spacing: 5) {
                                        
                                        Text("\(viewModel.int1).\(viewModel.int2)\(viewModel.int1)\(viewModel.int2)")
                                            .foregroundColor(.white)
                                            .font(.system(size: 14, weight: .medium))
                                        
                                        Text("+\(viewModel.int2).\(viewModel.int2)(\(viewModel.int2).\(viewModel.int1)%)")
                                            .foregroundColor(.green)
                                            .font(.system(size: 14, weight: .medium))
                                        
                                    }
                                }
                            })
                        }
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 30).fill(Color("bg2")))
                }
            }
            .padding()
        }
        .sheet(isPresented: $viewModel.isGraph, content: {
            
            GraphView(viewModel: viewModel)
        })
    }
}

#Preview {
    PairsView(viewModel: TransactionsViewModel())
}
