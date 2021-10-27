//
//  DashboardView.swift
//  Grouper
//
//  Created by 王首之 on 2021/10/26.
//

import SwiftUI



struct DashboardView: View {
    var body: some View {
        ZStack{
            
            NavigationView {
                Color("DashboardBackground").ignoresSafeArea()
                .navigationTitle("Dashboard")
                
            }
                VStack{
                    
                    
                    //Text("Hello, World!")
                    //Text("This is Planned for the Dashboard Page")
                    Spacer()
                        .frame(height: 110)
                    HStack {
                        Spacer()
                            .frame(width: 15.0)
                        
                        RoundedRectangle(cornerRadius: 20)
                        
                        Spacer()
                            .frame(width: 15.0)
                        RoundedRectangle(cornerRadius: 20)
                        Spacer()
                            .frame(width: 15.0)
                            
                    }
                    Spacer()
                        .frame(height: 15.0)
                    HStack {
                        Spacer()
                            .frame(width: 15.0)
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color("D_Elements"))
                            .overlay(
                                VStack{
                                    Image("Dice")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                    Text("Random")
                                        .font(.title2)
                                        .fontWeight(.semibold)
                                        .multilineTextAlignment(.center)
                                        .padding(.top, -30.0)
                                }
                                

                            )
                        Spacer()
                            .frame(width: 15.0)
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color("D_Elements"))
                            .overlay(
                                VStack{
                                    Image("Dice")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                    Text("Random")
                                        .font(.title2)
                                        .fontWeight(.semibold)
                                        .multilineTextAlignment(.center)
                                        .padding(.top, -30.0)
                                    
                                }
                                )
                        
                        Spacer()
                            .frame(width: 15.0)
                    
                    }
                    Spacer()
                        .frame(height: 15.0)
                    HStack {
                        Spacer()
                            .frame(width: 15.0)
                        RoundedRectangle(cornerRadius: 20)
                            .frame(height: 130.0)
                        Spacer()
                            .frame(width: 15.0)
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color.blue)
                            .frame(height: 130.0)
                            
                        Spacer()
                            .frame(width: 15.0)
                    
                    }
                    Spacer()
                        .frame(height: 50.0)
            }
            
                    
                
            }
        }

        
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
            
            
    }
}
