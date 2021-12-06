//
//  DashboardView.swift
//  Grouper
//
//  Created by 王首之 on 2021/10/26.
//

import SwiftUI



struct DashboardView: View {
    @State private var showAlert = false
    @State private var showFeedback = false
    @State private var showAbout = false
    let listDM: ListDataManager
    var body: some View {
            NavigationView {
                ZStack {
                    Color("DashboardBackground").ignoresSafeArea()
                    
                    VStack{
                        
                        
                        //Text("Hello, World!")
                        //Text("This is Planned for the Dashboard Page")
                        
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
                            
                            
                            NavigationLink(destination: PersonalityUI(listDM: listDM), label: {
                                ZStack {
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
                                                    .foregroundColor(Color("txtcolor"))
                                                    //.padding(.top, -10.0)
                                                
                                            }
                                            )
                                }
                                
                                
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
                                .onTapGesture {
                                    showAlert = true
                                }.alert(isPresented: $showAlert) {
                                    Alert(
                                        title: Text("Currently Not Available"),
                                        message: Text("A function that is still developing \n will hopefully add in the next version" )
                                    )
                                }
                            Spacer()
                                .frame(width: 15.0)
                                
                        }
                        Spacer()
                            .frame(height: 15.0)
                        HStack {
                            Spacer()
                                .frame(width: 15.0)
                            
                            NavigationLink(destination: RandomUI(listDM: listDM, historyDM: HistoryDataManager()), label: {
                                    ZStack {
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
                                                    .foregroundColor(Color("txtcolor"))
                                                    //.padding(.top, -10.0)
                                            }
                                            

                                        )
                                    }
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
                                .onTapGesture {
                                    showFeedback = true
                                }.alert(isPresented: $showFeedback) {
                                    Alert(
                                        title: Text("Thank you for feedbacks"),
                                        message: Text("Please send an email to swang@ves.org" )
                                    )
                                }
                                    
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
                                .onTapGesture {
                                    showAbout = true
                                }.alert(isPresented: $showAbout) {
                                    Alert(
                                        title: Text("About"),
                                        message: Text("Developed by Shawn Wang and Justin Wu \n Resources might came from the Internet")
                                    )
                                }
                                .frame(height: 140.0)
                                
                            Spacer()
                                .frame(width: 15.0)
                        
                        }
                        Spacer()
                            .frame(height: 20.0)
                }
//
//                .navigationTitle("Dashboard")

            
                
            
                }.navigationTitle(Text("Dashboard"))
                    .background(Color("DashboardBackground"))
            
                
            
                    
                
            }
        }

        
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView(listDM: ListDataManager())
            
            
    }
}
