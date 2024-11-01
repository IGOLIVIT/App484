//
//  HomeView.swift
//  App484
//
//  Created by IGOR on 30/10/2024.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var viewModel = HomeViewModel()
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                VStack {
                    
                    HStack {
                        
                        Text("Your objects")
                            .foregroundColor(.black)
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
                    
                    HStack {
                        
                        VStack(alignment: .leading, spacing: 12) {
                            
                            HStack {
                                
                                Image(systemName: "arrow.up.right")
                                    .foregroundColor(.green)
                                    .font(.system(size: 17, weight: .regular))
                                    .padding(6)
                                    .background(RoundedRectangle(cornerRadius: 6).fill(.green.opacity(0.4)))
                             
                                Text("Earnings")
                                    .foregroundColor(.green)
                                    .font(.system(size: 15, weight: .regular))
                            }
                            
                            Text("$\(viewModel.positive)")
                                .foregroundColor(.white)
                                .font(.system(size: 20, weight: .semibold))
                        }
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(RoundedRectangle(cornerRadius: 25).fill(.black))
                        
                        VStack(alignment: .leading, spacing: 12) {
                            
                            HStack {
                                
                                Image(systemName: "arrow.up.right")
                                    .foregroundColor(.red)
                                    .font(.system(size: 17, weight: .regular))
                                    .padding(6)
                                    .background(RoundedRectangle(cornerRadius: 6).fill(.red.opacity(0.4)))
                             
                                Text("Expenses")
                                    .foregroundColor(.red)
                                    .font(.system(size: 15, weight: .regular))
                            }
                            
                            Text("$\(viewModel.negative)")
                                .foregroundColor(.white)
                                .font(.system(size: 20, weight: .semibold))
                        }
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(RoundedRectangle(cornerRadius: 25).fill(.black))
                        
                    }
                    
                    HStack {
                        
                        VStack(alignment: .leading, spacing: 12) {

                                Text("Objects amount")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 15, weight: .regular))
                            
                            Text("\(viewModel.ObAmount)")
                                .foregroundColor(.white)
                                .font(.system(size: 20, weight: .semibold))
                        }
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(RoundedRectangle(cornerRadius: 25).fill(.black))
                        
                        VStack(alignment: .leading, spacing: 12) {

                                Text("Residents amount")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 15, weight: .regular))
                            
                            Text("\(viewModel.Persons)")
                                .foregroundColor(.white)
                                .font(.system(size: 20, weight: .semibold))
                        }
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(RoundedRectangle(cornerRadius: 25).fill(.black))
                    }
                    
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
                    .padding(.vertical, 8)
                }
                .padding()
                .padding(.top, 25)
                .frame(maxWidth: .infinity)
                .background(RoundedRectangle(cornerRadius: 20).fill(Color("prim")))
                .padding(.horizontal, 10)
                
                VStack {
                    
                    Text("Objects")
                        .foregroundColor(.gray)
                        .font(.system(size: 25, weight: .semibold))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        LazyVStack {
                          
                            ForEach(viewModel.fetchObjectssBySearch(), id: \.self) { index in
                            
                                Button(action: {
                                    
                                    viewModel.selectedObject = index
                                    
                                    withAnimation(.spring()) {
                                        
                                        viewModel.isDetail = true
                                    }
                                    
                                }, label: {
                                    
                                    HStack {
                                        
                                        Image(index.obImage ?? "")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 100)
                                            .cornerRadius(25)
                                        
                                        VStack(alignment: .leading, spacing: 5) {
                                            
                                            if index.obStatus == "Available" {
                                                
                                                Text(index.obStatus ?? "")
                                                    .foregroundColor(.green)
                                                    .font(.system(size: 11, weight: .regular))
                                                    .padding(6)
                                                    .padding(.horizontal, 4)
                                                    .background(RoundedRectangle(cornerRadius: 15).fill(.green.opacity(0.2)))
                                                
                                            } else {
                                                
                                                Text(index.obStatus ?? "")
                                                    .foregroundColor(.red)
                                                    .font(.system(size: 11, weight: .regular))
                                                    .padding(6)
                                                    .padding(.horizontal, 4)
                                                    .background(RoundedRectangle(cornerRadius: 15).fill(.red.opacity(0.2)))
                                            }
                                            
                                            Text(index.obPType ?? "")
                                                .foregroundColor(.white)
                                                .font(.system(size: 18, weight: .medium))
                                            
                                            Text(index.obDescr ?? "")
                                                .foregroundColor(.gray)
                                                .font(.system(size: 14, weight: .medium))
                                            
                                            HStack {
                                                
                                                Image(systemName: "dollarsign.arrow.circlepath")
                                                    .foregroundColor(.gray)
                                                    .font(.system(size: 11, weight: .regular))
                                                    .padding(4)
                                                    .background(RoundedRectangle(cornerRadius: 5).fill(.gray.opacity(0.1)))
                                                
                                                Text(index.obMonRent ?? "")
                                                    .foregroundColor(.gray)
                                                    .font(.system(size: 12, weight: .regular))
                                                
                                                Image(systemName: "arrow.up.left.square")
                                                    .foregroundColor(.gray)
                                                    .font(.system(size: 11, weight: .regular))
                                                    .padding(4)
                                                    .background(RoundedRectangle(cornerRadius: 5).fill(.gray.opacity(0.1)))
                                                
                                                Text(index.obSize ?? "")
                                                    .foregroundColor(.gray)
                                                    .font(.system(size: 12, weight: .regular))
                                                
                                                Image(systemName: "cursorarrow")
                                                    .foregroundColor(.gray)
                                                    .font(.system(size: 11, weight: .regular))
                                                    .padding(4)
                                                    .background(RoundedRectangle(cornerRadius: 5).fill(.gray.opacity(0.1)))
                                                
                                                Text(index.obLoc ?? "")
                                                    .foregroundColor(.gray)
                                                    .font(.system(size: 12, weight: .regular))
                                            }
                                            
                                        }
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                    }
                                    .padding()
                                    .background(RoundedRectangle(cornerRadius: 25.0).fill(.white.opacity(0.1)))
                                })
                            }
                        }
                    }
                    
                }
                .padding()                
            }
            .ignoresSafeArea(.all, edges: .top)
        }
        .onAppear {
            
            viewModel.fetchObjects()
        }
        .sheet(isPresented: $viewModel.isAdd, content: {
            
            AddObject(viewModel: viewModel)
        })
        .sheet(isPresented: $viewModel.isDetail, content: {
            
            ObDetail(viewModel: viewModel)
        })
    }
}

#Preview {
    HomeView()
}
