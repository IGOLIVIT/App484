//
//  AddObject.swift
//  App484
//
//  Created by IGOR on 30/10/2024.
//

import SwiftUI

struct AddObject: View {
    
    @StateObject var viewModel: HomeViewModel
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
                    
                    Text("Add object")
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
                            
                            Text("Property Type")
                                .foregroundColor(.gray)
                                .font(.system(size: 16, weight: .regular))
                                .opacity(viewModel.obPType.isEmpty ? 1 : 0)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            TextField("", text: $viewModel.obPType)
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
                                    
                                    ForEach(viewModel.statuses, id: \.self) { index in
                                        
                                        Button(action: {
                                            
                                            viewModel.currentStatus = index
                                            
                                        }, label: {
                                            
                                            Text(index)
                                        })
                                    }
                                    
                                }, label: {
                                    
                                    if viewModel.currentStatus.isEmpty {
                                        
                                        Text("Status")
                                            .foregroundColor(.gray)
                                            .font(.system(size: 16, weight: .regular))
                                        
                                        Spacer()
                                        
                                        Image(systemName: "chevron.up.chevron.down")
                                            .foregroundColor(.gray)
                                            .font(.system(size: 15, weight: .regular))
                                        
                                    } else {
                                        
                                        Text(viewModel.currentStatus)
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

                        Rectangle()
                            .fill(.white.opacity(0.2))
                            .frame(maxWidth: .infinity)
                            .frame(height: 1)
                        
                        ZStack(content: {
                            
                            Text("Location")
                                .foregroundColor(.gray)
                                .font(.system(size: 16, weight: .regular))
                                .opacity(viewModel.obLoc.isEmpty ? 1 : 0)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            TextField("", text: $viewModel.obLoc)
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
                                    
                                    ForEach(viewModel.images, id: \.self) { index in
                                        
                                        Button(action: {
                                            
                                            viewModel.currentImage = index
                                            
                                        }, label: {
                                            
                                            Image(index)
                                        })
                                    }
                                    
                                }, label: {
                                    
                                    if viewModel.currentImage.isEmpty {
                                        
                                        Text("Image")
                                            .foregroundColor(.gray)
                                            .font(.system(size: 16, weight: .regular))
                                        
                                        Spacer()
                                        
                                        Image(systemName: "paperclip")
                                            .foregroundColor(.gray)
                                            .font(.system(size: 15, weight: .regular))
                                        
                                    } else {
                                        
                                        Text("Image")
                                            .foregroundColor(.gray)
                                            .font(.system(size: 16, weight: .regular))
                                        
                                        Spacer()
                                        
                                        Image(viewModel.currentImage)
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 20)
                                    }
                                    
                                })
                        }
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
                                .opacity(viewModel.obDescr.isEmpty ? 1 : 0)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            TextField("", text: $viewModel.obDescr)
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
                            
                            Text("Monthly Rent")
                                .foregroundColor(.gray)
                                .font(.system(size: 16, weight: .regular))
                                .opacity(viewModel.obMonRent.isEmpty ? 1 : 0)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            TextField("", text: $viewModel.obMonRent)
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
                            
                            Text("Lease Term")
                                .foregroundColor(.gray)
                                .font(.system(size: 16, weight: .regular))
                                .opacity(viewModel.obLT.isEmpty ? 1 : 0)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            TextField("", text: $viewModel.obLT)
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
                            
                            Text("Size")
                                .foregroundColor(.gray)
                                .font(.system(size: 16, weight: .regular))
                                .opacity(viewModel.obSize.isEmpty ? 1 : 0)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            TextField("", text: $viewModel.obSize)
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
                            
                            Text("Bedrooms")
                                .foregroundColor(.gray)
                                .font(.system(size: 16, weight: .regular))
                                .opacity(viewModel.obBed.isEmpty ? 1 : 0)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            TextField("", text: $viewModel.obBed)
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
                            
                            Text("Bathrooms")
                                .foregroundColor(.gray)
                                .font(.system(size: 16, weight: .regular))
                                .opacity(viewModel.obBath.isEmpty ? 1 : 0)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            TextField("", text: $viewModel.obBath)
                                .foregroundColor(Color.white)
                                .font(.system(size: 16, weight: .medium))
                        })
                        .padding(8)
                        .frame(maxWidth: .infinity)

                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 25.0).fill(Color("bg2")))
                }
                
                Button(action: {
                    
                    viewModel.ObAmount += 1
                    
                    viewModel.obImage = viewModel.currentImage
                    viewModel.obStatus = viewModel.currentStatus
                    
                    viewModel.addObject()
                    
                    viewModel.currentStatus = ""
                    viewModel.currentImage = ""
                    viewModel.obPType = ""
                    viewModel.obLoc = ""
                    viewModel.obDescr = ""
                    viewModel.obMonRent = ""
                    viewModel.obLT = ""
                    viewModel.obSize = ""
                    viewModel.obBed = ""
                    viewModel.obBath = ""
                    
                    viewModel.fetchObjects()
                    
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
                .opacity(viewModel.obPType.isEmpty || viewModel.currentStatus.isEmpty || viewModel.obLoc.isEmpty ? 0.5 : 1)
                .disabled(viewModel.obPType.isEmpty || viewModel.currentStatus.isEmpty || viewModel.obLoc.isEmpty ? true : false)
            }
            .padding()
        }
    }
}

#Preview {
    AddObject(viewModel: HomeViewModel())
}
