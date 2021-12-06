//
//  UserSelfView.swift
//  Grouper
//
//  Created by 王首之 on 2021/10/26.
//

import SwiftUI

struct UserSelfView: View {
    var body: some View {
        NavigationView{
            ZStack {
                Color("ListColor")
                    .ignoresSafeArea()
                VStack {
                    
                    RoundedRectangle(cornerRadius: 25)
                        .fill(Color("D_Elements"))
                        .padding(.horizontal)
                        
                        .frame(height: 165.0)
                        
                        .overlay(
                            VStack{
                               
                                Image(systemName: "person.crop.circle")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    
                                    .foregroundColor(Color("txtcolor"))
                                    .frame(width: 80.0)
                                    
                                Text("Welcome")
                                    .font(.title2)
                                    .fontWeight(.semibold)
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(Color("txtcolor"))
                                //Spacer()
                            }
                        )
                    
                    HStack {
                        //Spacer()
                        Button(action: {
                            print("a")
                                
                        },label: {
                            HStack {
                                Image(systemName: "square.and.arrow.up.on.square.fill")
                                Text("Export List Data to CSV")
                            }
                            
                        }).padding(.all)
                            .frame(width: 400.0)
                            
                        //Spacer()
                    }
                    
                    
                    Spacer()
                }
            }.navigationTitle(Text("About Me"))
            
            
        }
}
}

struct UserSelfView_Previews: PreviewProvider {
    static var previews: some View {
        UserSelfView()
    }
}
