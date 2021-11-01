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
                        .frame(height: 95)
                    HStack{
                        Spacer()
                            .frame(width: 15.0)
                        Text("Make Groups According to:")
                            .font(.body)
                        Spacer()
                    }
                    HStack {
                        Spacer()
                            .frame(width: 15.0)
                        
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color("D_Elements"))
                            .overlay(
                                VStack{
                                    Image("Brain")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .padding(.horizontal, 25.0)
                                        .padding(.bottom, 15)
                                    Text("Personality")
                                        .font(.title2)
                                        .fontWeight(.semibold)
                                        .multilineTextAlignment(.center)
                                        //.padding(.top, -10.0)
                                    
                                }
                                )
                        
                        Spacer()
                            .frame(width: 15.0)
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color("D_Elements"))
                            .overlay(
                                VStack{
                                    Image("School")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .padding(.horizontal, 25.0)
                                        .padding(.bottom, 15)
                                    Text("Academics")
                                        .font(.title2)
                                        .fontWeight(.semibold)
                                        .multilineTextAlignment(.center)
                                        //.padding(.top, -10.0)
                                    
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
                            .fill(Color("D_Elements"))
                            .overlay(
                                VStack{
                                    Image("Dice")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .padding(.horizontal, 30.0)
                                        .padding(.bottom, 15)
                                    Text("Random")
                                        .font(.title2)
                                        .fontWeight(.semibold)
                                        .multilineTextAlignment(.center)
                                        //.padding(.top, -10.0)
                                }
                                

                            )
                        Spacer()
                            .frame(width: 15.0)
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color("D_Elements"))
                            .overlay(
                                VStack{
                                    Image("Ellispsis")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .padding(.horizontal, 30.0)
                                        .padding(.bottom, 15)
                                    
                                    Text("More")
                                        .font(.title2)
                                        .fontWeight(.semibold)
                                        .multilineTextAlignment(.center)
                                        //.padding(-10.0)
                                    
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
                            .fill(Color("D_Elements"))
                            .overlay(
                                VStack {
                                    Image(systemName: "square.and.pencil")
                                        .padding(.bottom, 8.0)
                                        .font(.system(size: 50))
                                        
                                    Text("Feedback")
                                        .font(.title2)
                                        .fontWeight(.semibold)
                                        .multilineTextAlignment(.center)
                                }
                                )
                                
                            .frame(height: 140.0)
                        Spacer()
                            .frame(width: 15.0)
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color("D_Elements"))
                            .overlay(
                                VStack {
                                    Image(systemName: "questionmark.square")
                                        .padding(.bottom, 8.0)
                                        .font(.system(size: 50))
                                       
                                    Text("About")
                                        .font(.title2)
                                        .fontWeight(.semibold)
                                        .multilineTextAlignment(.center)
                                }
                                )
                            .frame(height: 140.0)
                            
                        Spacer()
                            .frame(width: 15.0)
                    
                    }
                    Spacer()
                        .frame(height: 20.0)
            }
            
                    
                
            }
        }

        
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
            
            
    }
}
