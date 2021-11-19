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
    
    @State private var searchtext: String = ""
    
    
    
    func populateperson() {
        ppls = listDM.getAllPeople()
    }
    

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


                                
                        
                            }
                                           )

                            Spacer()
                                
                            NavigationLink(destination: ExistingGroups(listDM: listDM), label: {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 10)
                                        .fill(Color("D_Elements"))
                                    
                                        .overlay(
                                            VStack{
                                                Image(systemName: "text.badge.plus")
                                                    .font(.system(size: 50))
                                                    .foregroundColor(Color("ButtonColor"))
                                            }

                                        )
                                        .frame(height: 90)
                                        
                                    
                                }


                                
                        
                            }
                                           )
//                            RoundedRectangle(cornerRadius: 10)
//                                .fill(Color("D_Elements"))
//                                .frame(height: 90.0)
//                                .overlay(
//                                    VStack{
//                                        Image(systemName: "text.badge.plus")
//                                            .font(.system(size: 50))
//                                            .foregroundColor(Color("ButtonColor"))
//                                    }
                                    
                           //     )
                            
                            Spacer()
                                .frame(width: 20.0)
                        }
                        Spacer()
                            .frame(height: 10)
                        
                        HStack {
                            Spacer()
                                .frame(width: 10.0)
                            
                            SearchBarView(text: $searchtext)
                            
                            Spacer()
                                }

                    }
                    
                    List {
                        ForEach(ppls.filter({searchtext.isEmpty ? true : $0.name?.contains(searchtext) as! Bool}), id: \.self) { person in
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
                            
                    }
                    
                    .listStyle(DefaultListStyle())
                        .accentColor(needsrefresh ? .white: .black)
                    
                    }

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
