//
//  ListDetail.swift
//  Grouper
//
//  Created by 王首之 on 2021/11/4.
//

import SwiftUI

struct ListDetail: View {
    let personsss: People
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    let listDM: ListDataManager
    
    @Binding var neeedsrefresh: Bool
    
    @State private var name: String = ""
    
    @State private var selectedRole: String = ""
    
    @State private var selectedGroups: String = ""
    
    @State private var descriptionwritten: String = ""
    
    @State private var selectedpersonality: String = ""
    
    
    private func addrow() {
        if !name.isEmpty {
            personsss.name = name
            listDM.updatePerson()
        }else if !selectedRole.isEmpty {
            personsss.role = selectedRole
            listDM.updatePerson()
        }else if !selectedGroups.isEmpty {
            personsss.group = selectedGroups
            listDM.updatePerson()
        }else if !descriptionwritten.isEmpty {
            personsss.descrip = descriptionwritten
            listDM.updatePerson()
        }else if !selectedpersonality.isEmpty {
            personsss.personality = selectedpersonality
            listDM.updatePerson()
            
        }
        neeedsrefresh.toggle()
        self.presentationMode.wrappedValue.dismiss()
    }
    
    
    var body: some View {
        //Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        ZStack{
            Color("ListColor")
                .ignoresSafeArea()
            
            VStack {
                //Spacer()
                    //.frame(height: 100.0)
                Image(systemName: "person.circle")
                    .resizable()
                    .clipShape(Circle())
                    .overlay (
                        Circle()
                            .stroke(.white, lineWidth: 4)
                            
                    )
                    .shadow(radius: 7)
                    .frame(width: 150.0, height: 150.0)
                
                List {
                    TextField(personsss.name ?? "", text: $name)
                    TextField(personsss.role ?? "", text: $selectedRole)
                    TextField(personsss.group ?? "", text: $selectedGroups)
                    TextField(personsss.personality ?? "", text: $selectedpersonality)

                    
//                    Toggle(isOn: Binding(get: {
//                        personsss.isimportant
//                    }, set: { selectedImportance = $0
//                    })
//                    ) {
//                                        Text("Special Treatment")
//                                    }
                    TextField(personsss.descrip ?? "", text: $descriptionwritten)

                        }
                        
                    
                    //Text("Selected flavor: \(selectedRole.rawValue)")
                    //HStack {
                        //Text("Name:")
                        
                    
                    //}
                }.background(Color.clear)
                
            } //Color.blue.edgesIgnoringSafeArea(.all)
            
            //.navigationTitle("Add a Person")
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            //.background(Color("ListColor")).ignoresSafeArea()
            
            .navigationBarItems(trailing: Button(action: {
                self.addrow()
                        }) {
                            Text("Save")
                        })
        }
}

struct ListDetail_Previews: PreviewProvider {
    static var previews: some View {
        let personsss = People()
        ListDetail(personsss: personsss, listDM: ListDataManager(), neeedsrefresh: .constant(false))
        
    }
}
