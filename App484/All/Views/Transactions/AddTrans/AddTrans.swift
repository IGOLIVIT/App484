//
//  AddTrans.swift
//  App484
//
//  Created by IGOR on 31/10/2024.
//

import SwiftUI

struct AddTrans: View {

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
                    .padding()
                
                ZStack {
                    
                    Text("Add transaction")
                        .foregroundColor(.white)
                        .font(.system(size: 18, weight: .semibold))
                    
                    HStack {
                        
                        Button(action: {
                            
                            back.wrappedValue.dismiss()
                            
                        }, label: {
                            
                            Image(systemName: "xmark")
                                .foregroundColor(.white)
                                .font(.system(size: 16, weight: .semibold))
                                .padding(6)
                                .background(Circle().fill(.white.opacity(0.4)))
                            
                            Spacer()
                        })
                    }
                }
                .padding(.bottom, 25)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack {
                        
                        ZStack(content: {
                            
                            Text("Title")
                                .foregroundColor(.gray)
                                .font(.system(size: 16, weight: .regular))
                                .opacity(viewModel.trTitle.isEmpty ? 1 : 0)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            TextField("", text: $viewModel.trTitle)
                                .foregroundColor(Color.white)
                                .font(.system(size: 16, weight: .medium))
                        })
                        .padding(8)
                        .frame(maxWidth: .infinity)

                        Rectangle()
                            .fill(.white.opacity(0.2))
                            .frame(maxWidth: .infinity)
                            .frame(height: 1)
                        
                        ZStack(content: {
                            
                            Text("Description")
                                .foregroundColor(.gray)
                                .font(.system(size: 16, weight: .regular))
                                .opacity(viewModel.trDescr.isEmpty ? 1 : 0)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            TextField("", text: $viewModel.trDescr)
                                .foregroundColor(Color.white)
                                .font(.system(size: 16, weight: .medium))
                        })
                        .padding(8)
                        .frame(maxWidth: .infinity)

                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 25.0).fill(Color("bg2")))

                    VStack {

                        ZStack(content: {
                            
                            Text("Amount")
                                .foregroundColor(.gray)
                                .font(.system(size: 16, weight: .regular))
                                .opacity(viewModel.trAmount.isEmpty ? 1 : 0)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            TextField("", text: $viewModel.trAmount)
                                .foregroundColor(Color.white)
                                .font(.system(size: 16, weight: .medium))
                        })
                        .padding(8)
                        .frame(maxWidth: .infinity)

                        Rectangle()
                            .fill(.white.opacity(0.2))
                            .frame(maxWidth: .infinity)
                            .frame(height: 1)
                        
                        HStack {
                            
                                Menu(content: {
                                    
                                    ForEach(viewModel.types, id: \.self) { index in
                                        
                                        Button(action: {
                                            
                                            viewModel.currentType = index
                                            
                                        }, label: {
                                            
                                            Text(index)
                                        })
                                    }
                                    
                                }, label: {
                                    
                                    if viewModel.currentType.isEmpty {
                                        
                                        Text("Status")
                                            .foregroundColor(.gray)
                                            .font(.system(size: 16, weight: .regular))
                                        
                                        Spacer()
                                        
                                        Image(systemName: "chevron.up.chevron.down")
                                            .foregroundColor(.gray)
                                            .font(.system(size: 15, weight: .regular))
                                        
                                    } else {
                                        
                                        Text(viewModel.currentType)
                                            .foregroundColor(.gray)
                                            .font(.system(size: 16, weight: .regular))
                                        
                                        Spacer()
                                        
                                        Image(systemName: "chevron.up.chevron.down")
                                            .foregroundColor(.gray)
                                            .font(.system(size: 15, weight: .regular))
                                    }
                                    
                                })
                        }
                        .padding(8)
                        .frame(maxWidth: .infinity)

                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 25.0).fill(Color("bg2")))
                }
                
                Button(action: {
                    
                    if viewModel.currentType == "Positive" {
                        
                        viewModel.positive += Int(viewModel.trAmount) ?? 0
                        
                    } else {
                        
                        viewModel.negative += Int(viewModel.trAmount) ?? 0

                    }
                    
                    viewModel.Persons += 1

                    viewModel.trType = viewModel.currentType
                    
                    viewModel.addTrans()

                    viewModel.trTitle = ""
                    viewModel.trDescr = ""
                    viewModel.trAmount = ""
                    viewModel.currentType = ""
                    
                    viewModel.fetchTranss()
                    
                    withAnimation(.spring()) {
                        
                        viewModel.isAdd = false
                    }
                    
                }, label: {
                    
                    Text("Add")
                        .foregroundColor(.black)
                        .font(.system(size: 15, weight: .medium))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("prim")))
                })
                .opacity(viewModel.trTitle.isEmpty || viewModel.currentType.isEmpty || viewModel.trAmount.isEmpty ? 0.5 : 1)
                .disabled(viewModel.trTitle.isEmpty || viewModel.currentType.isEmpty || viewModel.trAmount.isEmpty ? true : false)
            }
            .padding()
        }
    }
}

#Preview {
    AddTrans(viewModel: TransactionsViewModel())
}
