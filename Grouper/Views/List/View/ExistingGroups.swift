//
//  ExistingGroups.swift
//  Grouper
//
//  Created by 王首之 on 2021/11/12.
//

import SwiftUI



struct ExistingGroups: View {
    let listDM: ListDataManager
    
    @State private var ppls: [People] = [People]()
    
    @State private var needsrefresh: Bool = false
    
    func populateperson() {
        ppls = listDM.getAllPeople()
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                
                    
                List {
                    //UITableView.appearance().contentInset.top = -35
//                }(ppls, id: \.self) { person in
//
//                    HStack {
//                        Image(systemName: "person.circle")
//                            .resizable()
//                            .frame(width: 50, height: 50)
//                        Text(person.name ?? "")
//                    }
                
                    Section(header: Text("Students")) {
                        ForEach(ppls.filter({($0.role?.contains("Student")) as! Bool}), id: \.self) { person in
                            
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
                    
                    Section(header: Text("Teachers")) {
                        ForEach(ppls.filter({($0.role?.contains("Teacher")) as! Bool}), id: \.self) { person in
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
                    Section(header: Text("Administrators")) {
                        ForEach(ppls.filter({($0.role?.contains("Administrator")) as! Bool}), id: \.self) { person in
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
                    
                }
                
                
            
            //Text("hello world")
            }
        }
        .navigationBarTitle("Manage Groups", displayMode: .inline)
        
        //.navigationBarHidden(true)
        .onAppear(perform: {
            ppls = listDM.getAllPeople()
            
        })
}
}

struct ExistingGroups_Previews: PreviewProvider {
    static var previews: some View {
        ExistingGroups(listDM: ListDataManager())
    }
}
