//
//  GraphView.swift
//  App484
//
//  Created by IGOR on 31/10/2024.
//

import SwiftUI

struct GraphView: View {

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
                    
                    Text("Graphic")
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
                .padding()
                
                HStack {
                    
                    Image(viewModel.curCurrency)
                        .resizable()
                        .frame(width: 50, height: 30)
                    
                    Text(viewModel.curCurrency)
                        .foregroundColor(.white)
                        .font(.system(size: 17, weight: .medium))
                    
                    Spacer()
                }
                .padding(.horizontal)
                
                HStack {
                    
                    Text("\(viewModel.int2).\(viewModel.int1)\(viewModel.int2)\(viewModel.int1)\(viewModel.int2)\(viewModel.int2)\(viewModel.int1)")
                        .foregroundColor(.white)
                        .font(.system(size: 24, weight: .bold))
                    
                    Text("+\(viewModel.int1).\(viewModel.int2)%")
                        .foregroundColor(.green)
                        .font(.system(size: 11, weight: .regular))
                        .padding(5)
                        .padding(.horizontal, 4)
                        .background(RoundedRectangle(cornerRadius: 25.0).fill(.green.opacity(0.1)))
                    
                    Spacer()
                }
                .padding(.horizontal)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack(spacing: 17) {
                        
                        Image("graph")
                            .resizable()
                            .frame(maxWidth: .infinity)
                            .frame(height: 500)
                        
                        HStack {
                            
                            Button(action: {
                                
                                withAnimation(.spring()) {
                                    
                                    viewModel.isPairs = false
                                    viewModel.isGraph = false
                                }
                                
                            }, label: {
                                
                                Text("Apply")
                                    .foregroundColor(.black)
                                    .font(.system(size: 15, weight: .regular))
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 50)
                                    .background(RoundedRectangle(cornerRadius: 15).fill(Color("prim")))
                            })
                            
                            Button(action: {
                                
                                withAnimation(.spring()) {
                                    
                                    viewModel.isPairs = false
                                    viewModel.isGraph = false
                                }
                                
                            }, label: {
                                
                                Text("Close")
                                    .foregroundColor(.black)
                                    .font(.system(size: 15, weight: .regular))
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 50)
                                    .background(RoundedRectangle(cornerRadius: 15).fill(Color.red))
                            })
                        }
                        .padding()
                    }
                }
            }
        }
    }
}

#Preview {
    GraphView(viewModel: TransactionsViewModel())
}
