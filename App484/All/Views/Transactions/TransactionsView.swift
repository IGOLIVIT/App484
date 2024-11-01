//
//  TransactionsView.swift
//  App484
//
//  Created by IGOR on 31/10/2024.
//

import SwiftUI

struct TransactionsView: View {
    
    @StateObject var viewModel = TransactionsViewModel()
    
    var body: some View {

        ZStack {
            
            LinearGradient(colors: [Color("prim").opacity(0.9), Color("bg"), Color("bg"), Color("bg"), Color("bg"), Color("bg"), Color("bg")], startPoint: .topTrailing, endPoint: .bottomLeading)
                .ignoresSafeArea()
            
            VStack {
                
                HStack {
                    
                    Text("Transactions")
                        .foregroundColor(.white)
                        .font(.system(size: 26, weight: .semibold))
                    
                    Spacer()
                    
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isAdd = true
                        }
                        
                    }, label: {
                        
                        Text("+")
                            .foregroundColor(Color("prim"))
                            .font(.system(size: 19, weight: .semibold))
                            .padding(9)
                            .background(Circle().fill(.black))
                    })
                }
                .padding()
                
                HStack {
                    
                    VStack(alignment: .leading, spacing: 12) {
                        
                        HStack {
                            
                            Image(systemName: "plus")
                                .foregroundColor(.green)
                                .font(.system(size: 17, weight: .regular))
                                .frame(width: 30, height: 30)
                                .background(RoundedRectangle(cornerRadius: 6).fill(.green.opacity(0.4)))
                         
                            Text("Positive txs")
                                .foregroundColor(.green)
                                .font(.system(size: 15, weight: .regular))
                        }
                        
                        Text("\(viewModel.positive)")
                            .foregroundColor(.white)
                            .font(.system(size: 20, weight: .semibold))
                    }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .frame(height: 100)
                    .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg2")))
                    
                    VStack(alignment: .leading, spacing: 12) {
                        
                        HStack {
                            
                            Image(systemName: "minus")
                                .foregroundColor(.red)
                                .font(.system(size: 17, weight: .regular))
                                .frame(width: 30, height: 30)
                                .background(RoundedRectangle(cornerRadius: 6).fill(.red.opacity(0.4)))
                         
                            Text("Negative txs")
                                .foregroundColor(.red)
                                .font(.system(size: 15, weight: .regular))
                        }
                        
                        Text("\(viewModel.negative)")
                            .foregroundColor(.white)
                            .font(.system(size: 20, weight: .semibold))
                    }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .frame(height: 100)
                    .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg2")))
                    
                    
                }
                .padding(.horizontal)
                
                HStack {
                    
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                        .font(.system(size: 15, weight: .regular))
                    
                    ZStack(alignment: .leading, content: {
                        
                        Text("Search")
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .regular))
                            .opacity(viewModel.search.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.search)
                            .foregroundColor(.white)
                            .font(.system(size: 14, weight: .regular))
                    })
                }
                .padding(8)
                .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg2")))
                .padding()
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    LazyVStack(spacing: 15) {
                        
                        ForEach(viewModel.fetchTransactionsBySearch(), id: \.self) { index in
                        
                            HStack {
                                
                                if index.trType == "Positive" {
                                    
                                    Image(systemName: "arrow.up.right")
                                        .foregroundColor(.white.opacity(0.9))
                                        .font(.system(size: 16, weight: .regular))
                                        .padding(8)
                                        .background(RoundedRectangle(cornerRadius: 5).fill(.green))
                                        .frame(width: 90, height: 90)
                                        .background(RoundedRectangle(cornerRadius: 15).fill(.green.opacity(0.2)))
                                    
                                } else {
                                    
                                    Image(systemName: "arrow.down.right")
                                        .foregroundColor(.white.opacity(0.9))
                                        .font(.system(size: 16, weight: .regular))
                                        .padding(8)
                                        .background(RoundedRectangle(cornerRadius: 5).fill(.red))
                                        .frame(width: 90, height: 90)
                                        .background(RoundedRectangle(cornerRadius: 15).fill(.red.opacity(0.2)))
                                }
                                
                                VStack(alignment: .leading, spacing: 7) {
                                    
                                    Text(index.trTitle ?? "")
                                        .foregroundColor(.white)
                                        .font(.system(size: 18, weight: .medium))
                                    
                                    Text(index.trDescr ?? "")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 14, weight: .regular))
                                }
                                .frame(maxWidth: .infinity, alignment: .leading)
                                
                                if index.trType == "Positive" {
                                    
                                    Text("+$\(index.trAmount ?? "")")
                                        .foregroundColor(.green)
                                        .font(.system(size: 18, weight: .semibold))
                                    
                                } else {
                                    
                                    Text("-$\(index.trAmount ?? "")")
                                        .foregroundColor(.red)
                                        .font(.system(size: 18, weight: .semibold))
                                }
                            }
                        }
                    }
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(RoundedRectangle(cornerRadius: 45).fill(Color("bg2")))
                .ignoresSafeArea()
            }
        }
        .onAppear {
            
            viewModel.fetchTranss()
        }
        .sheet(isPresented: $viewModel.isAdd, content: {
            
            AddTrans(viewModel: viewModel)
        })
    }
}

#Preview {
    TransactionsView()
}
