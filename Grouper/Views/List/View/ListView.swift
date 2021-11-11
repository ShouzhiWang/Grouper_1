//
//  ListView.swift
//  Grouper
//
//  Created by 王首之 on 2021/10/26.
//

import SwiftUI

struct ListView: View {
    let listDM: ListDataManager
    
    @State private var ppls: [People] = [People]()
    
    @State private var needsrefresh: Bool = false
    
    func populateperson() {
        ppls = listDM.getAllPeople()
    }
    
//    init() {
//        UITableView.appearance().backgroundColor = UIColor.clear
//    }
    var body: some View {
        
        NavigationView {
            ZStack {
                Color("ListColor")
                    .ignoresSafeArea()
                VStack{
                    //Spacer()
                        //.frame(height: 95)
                    VStack{
                        HStack {
                            Spacer()
                                .frame(width: 20.0)
                            NavigationLink(destination: AddNewPerson(listDM: listDM), label: {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 10)
                                        .fill(Color("D_Elements"))
                                    
                                        .overlay(
                                            VStack{
                                                Image(systemName: "plus.square")
                                                    .font(.system(size: 50))
                                                    .foregroundColor(Color("ButtonColor"))
                                            }

                                        )
                                        .frame(height: 90)
                                        
                                    
                                }
//                                Image(systemName: "plus.square")
//                                    .aspectRatio(contentMode: .fit)
//                                    .frame(width: 90, height: 90.0)
//                                    .background(Color("D_Elements"))
//                                    .cornerRadius(10)
//                                    .font(.system(size: 50))

                                
                        
                            }
                                           )
//                            RoundedRectangle(cornerRadius: 10)
//                                .fill(Color("D_Elements"))
//                                .overlay(
//                                    Image(systemName: "questionmark.square")
//                                    VStack {
//
//                                            .padding(.bottom, 8.0)
//                                            .font(.system(size: 50))
//
//                                        Text("About")
//                                            .font(.title2)
//                                            .fontWeight(.semibold)
//                                            .multilineTextAlignment(.center)
//                                    }
//)                                .frame(height: 90.0)
//                                .overlay(
//                                    VStack{
//                                        Image(systemName: "plus.square")
//                                            .font(.system(size: 50))
//                                            .foregroundColor(Color("ButtonColor"))
//                                    }
//
//                                )

//                                }
                            //Spacer()
                               // .frame(width: 15.0)
                            Spacer()
                                
                            
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color("D_Elements"))
                                .frame(height: 90.0)
                                .overlay(
                                    VStack{
                                        Image(systemName: "text.badge.plus")
                                            .font(.system(size: 50))
                                            .foregroundColor(Color("ButtonColor"))
                                    }
                                    
                                )
                            
                            Spacer()
                                .frame(width: 20.0)
                        }
                        
                        HStack {
                            Spacer()
                                .frame(width: 20.0)
                            
                            
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color("D_Elements"))
                                .frame(height: 90.0)
                                .overlay(
                                    VStack{
                                        Image(systemName: "square.and.pencil")
                                            .font(.system(size: 50))
                                            .foregroundColor(Color("ButtonColor"))
                                    }
                                    
                                )
                            
                            Spacer()
                                
                            
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color("D_Elements"))
                                .frame(height: 90.0)
                                .overlay(
                                    VStack{
                                        Image(systemName: "magnifyingglass")
                                            .font(.system(size: 50))
                                            .foregroundColor(Color("ButtonColor"))
                                    }
                                    
                                )
                            
                            Spacer()
                                .frame(width: 20.0)
                        }
                    }
                    
                    List {
                        ForEach(ppls, id: \.self) { person in
                            NavigationLink(destination: ListDetail(personsss: person, listDM: listDM, neeedsrefresh: $needsrefresh), label: {
                                HStack {
                                    Image(systemName: "person.circle")
                                        .resizable()
                                        .frame(width: 50, height: 50)
                                    Text(person.name ?? "")
                                }
                            })
                            }.onDelete(perform: {indexSet in indexSet.forEach { index in
                                let person = ppls[index]
                                listDM.deletePerson(person: person)
                                populateperson()
                                //mamager
                                    
                            
                            }}).background(Color.clear)
                            
                    }.listStyle(DefaultListStyle())
                        .accentColor(needsrefresh ? .white: .black)
                    }
                    

                        
                    
//                    List{
//
//
//
//                        ForEach(peoples) { listofpeople in ListRow(listofpeople: listofpeople)
//                            }
//                    }
                        //ListRow(listofpeople: peoples[0])
                        //LandmarkRow(landmark: landmarks[1])
                            
                    //Text("Hello, World!")
                    //Text("This is Planned for the List Page")
                }
                //Color("DashboardBackground").ignoresSafeArea()
                .navigationTitle("List")
                .onAppear(perform: {
                    ppls = listDM.getAllPeople()
                })
            }
    
    }

}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView(listDM: ListDataManager())
            
    }
}
