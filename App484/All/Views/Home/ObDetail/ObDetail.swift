//
//  ObDetail.swift
//  App484
//
//  Created by IGOR on 31/10/2024.
//

import SwiftUI

struct ObDetail: View {
    
    @StateObject var viewModel: HomeViewModel
    @Environment(\.presentationMode) var back
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                
                Image(viewModel.selectedObject?.obImage ?? "")
                    .resizable()
                    .frame(maxWidth: .infinity)
                    .frame(height: 280)
                    .overlay(
                        
                        VStack {
                            
                            HStack {
                                
                                Button(action: {
                                    
                                    back.wrappedValue.dismiss()
                                    
                                }, label: {
                                    
                                    Image(systemName: "chevron.left")
                                        .foregroundColor(Color("prim"))
                                        .font(.system(size: 17, weight: .medium))
                                    
                                    Text("Back")
                                        .foregroundColor(Color("prim"))
                                        .font(.system(size: 16, weight: .regular))
                                })
                                
                                Spacer()
                            }
                            
                            Spacer()
                            
                            if viewModel.selectedObject?.obStatus == "Available" {
                                
                                Text(viewModel.selectedObject?.obStatus ?? "")
                                    .foregroundColor(.green)
                                    .font(.system(size: 11, weight: .regular))
                                    .padding(6)
                                    .padding(.horizontal, 4)
                                    .background(RoundedRectangle(cornerRadius: 15).fill(.green.opacity(0.2)))
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                            } else {
                                
                                Text(viewModel.selectedObject?.obStatus ?? "")
                                    .foregroundColor(.red)
                                    .font(.system(size: 11, weight: .regular))
                                    .padding(6)
                                    .padding(.horizontal, 4)
                                    .background(RoundedRectangle(cornerRadius: 15).fill(.red.opacity(0.2)))
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            }
                        }
                            .padding()
                    )
                
                ScrollView(.vertical, showsIndicators: false) {
                
                    VStack(alignment: .leading, spacing: 16) {
                    
                    HStack {
                        
                        VStack(alignment: .leading, spacing: 5) {
                            
                            HStack {
                                
                                Image(systemName: "dollarsign.arrow.circlepath")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 11, weight: .regular))
                                    .padding(4)
                                    .background(RoundedRectangle(cornerRadius: 5).fill(.gray.opacity(0.1)))
                                
                                Text("Price")
                                    .foregroundColor(.black)
                                    .font(.system(size: 14, weight: .regular))
                            }
                            
                            Text("\(viewModel.selectedObject?.obMonRent ?? "") $")
                                .foregroundColor(.black)
                                .font(.system(size: 16, weight: .medium))
                        }
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .frame(height: 90)
                        .background(RoundedRectangle(cornerRadius: 20).fill(Color("prim")))
                        
                        VStack(alignment: .leading, spacing: 5) {
                            
                            HStack {
                                
                                Image(systemName: "arrow.up.left.square")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 11, weight: .regular))
                                    .padding(4)
                                    .background(RoundedRectangle(cornerRadius: 5).fill(.gray.opacity(0.1)))
                                
                                Text("Size")
                                    .foregroundColor(.black)
                                    .font(.system(size: 14, weight: .regular))
                            }
                            
                            Text("\(viewModel.selectedObject?.obSize ?? "") sq. ft.")
                                .foregroundColor(.black)
                                .font(.system(size: 16, weight: .medium))
                        }
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .frame(height: 90)
                        .background(RoundedRectangle(cornerRadius: 20).fill(Color("prim")))
                        
                        VStack(alignment: .leading, spacing: 5) {
                            
                            HStack {
                                
                                Image(systemName: "cursorarrow")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 11, weight: .regular))
                                    .padding(4)
                                    .background(RoundedRectangle(cornerRadius: 5).fill(.gray.opacity(0.1)))
                                
                                Text("Location")
                                    .foregroundColor(.black)
                                    .font(.system(size: 14, weight: .regular))
                            }
                            
                            Text(viewModel.selectedObject?.obLoc ?? "")
                                .foregroundColor(.black)
                                .font(.system(size: 16, weight: .medium))
                        }
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .frame(height: 90)
                        .background(RoundedRectangle(cornerRadius: 20).fill(Color("prim")))
                    }
                    
                    Text(viewModel.selectedObject?.obPType ?? "")
                        .foregroundColor(.white)
                        .font(.system(size: 20, weight: .semibold))
                    
                    Text(viewModel.selectedObject?.obDescr ?? "")
                        .foregroundColor(.gray)
                        .font(.system(size: 14, weight: .regular))
                    
                    Text("Overview")
                        .foregroundColor(.white)
                        .font(.system(size: 20, weight: .semibold))
                    
                    VStack {
                        
                        Text("\(viewModel.selectedObject?.obBed ?? "") Bedrooms")
                            .foregroundColor(Color.white)
                            .font(.system(size: 16, weight: .medium))
                            .padding(8)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Rectangle()
                            .fill(.white.opacity(0.2))
                            .frame(maxWidth: .infinity)
                            .frame(height: 1)
                        
                        Text("\(viewModel.selectedObject?.obBath ?? "") Bathrooms")
                            .foregroundColor(Color.white)
                            .font(.system(size: 16, weight: .medium))
                            .padding(8)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 25.0).fill(Color("bg2")))
                }
                .padding()
            }
                
                HStack {
                    
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isDelete = true
                        }
                        
                    }, label: {
                        
                        Image(systemName: "trash.fill")
                            .foregroundColor(.red)
                            .font(.system(size: 16, weight: .regular))
                            .frame(width: 50, height: 50)
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color("prim")))
                    })
                    
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            back.wrappedValue.dismiss()
                        }
                        
                    }, label: {
                        
                        Text("Back")
                            .foregroundColor(.black)
                            .font(.system(size: 16, weight: .regular))
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color("prim")))
                    })
                }
                .padding()
            }
        }
        .overlay(
            
            ZStack {
                
                Color.black.opacity(viewModel.isDelete ? 0.5 : 0)
                    .ignoresSafeArea()
                    .onTapGesture {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isDelete = false
                        }
                    }
                
                VStack {
                    
                    HStack {
                        
                        Spacer()
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isDelete = false
                            }
                            
                        }, label: {
                            
                            Image(systemName: "xmark")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .regular))
                        })
                    }
                    
                    Text("Delete?")
                        .foregroundColor(.black)
                        .font(.system(size: 20, weight: .semibold))
                        .padding()
                    
                    Text("Are you sure you want to delete this card?")
                        .foregroundColor(.black)
                        .font(.system(size: 14, weight: .regular))
                        .multilineTextAlignment(.center)
                        .padding(.bottom, 30)
                    
                    Button(action: {
               
                        viewModel.ObAmount -= 1
                        
                        CoreDataStack.shared.deleteObject(withObDescr: viewModel.selectedObject?.obDescr ?? "", completion: {
                            
                            viewModel.fetchObjects()
                        })
          
                        withAnimation(.spring()) {
                            
                            viewModel.isDelete = false
                            viewModel.isDetail = false

                        }
                                
                    }, label: {
                        
                        Text("Delete")
                            .foregroundColor(.red)
                            .font(.system(size: 18, weight: .semibold))
                            .frame(maxWidth: .infinity)
                            .frame(height: 40)
                        
                    })
                    
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isDelete = false
                        }
                        
                    }, label: {
                        
                        Text("Close")
                            .foregroundColor(.black)
                            .font(.system(size: 18, weight: .regular))
                            .frame(maxWidth: .infinity)
                            .frame(height: 40)
                        
                    })
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(RoundedRectangle(cornerRadius: 20).fill(Color("prim")))
                .padding()
                .offset(y: viewModel.isDelete ? 0 : UIScreen.main.bounds.height)
            }
        )
    }
}

#Preview {
    ObDetail(viewModel: HomeViewModel())
}
