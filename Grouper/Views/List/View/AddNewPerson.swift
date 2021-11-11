//
//  AddNewPerson.swift
//  Grouper
//
//  Created by 王首之 on 2021/11/4.
//

import SwiftUI



struct AddNewPerson: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    let listDM: ListDataManager
    
    @State private var name: String = ""
    
    @State private var selectedRole: String = "Student"
    
    @State private var selectedGroups: String = "Please Choose..."
    
    //@State private var selectedImportance: Bool = false
    
    @State private var descriptionwritten: String = ""
    
    @State private var selectedpersonality: String = "Optional..."
    
    
    
    //
    
    
    var Roles = ["Student", "Teacher", "Administrator"]
    var Groups = ["Please Choose...", "test1", "test2", "test3"]
    var isImportant = false
    let Personalities = ["Optional...", "INFP", "ENFP", "INFJ", "ENFJ", "INTJ", "ENTJ", "INTP", "ENTP", "ISFP", "ISTP", "ESTP", "ISFJ", "ESFJ", "ISTJ", "ESTJ"]
    
    private func addRow() {
        listDM.savePerson(name: name, role: selectedRole, group: selectedGroups, descrip: descriptionwritten, personality: selectedpersonality, picturen: "default")
        self.presentationMode.wrappedValue.dismiss()
    }
    
//    init() {
//        UITableView.appearance().backgroundColor = UIColor.clear
//
//    }
//    enum Roles: String, CaseIterable {
//        case student
//        case teacher
//        case administrator
//    }
    
    var body: some View {
        
        
        
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
                    TextField("Name", text: $name)
                    

                    Picker("Role", selection: $selectedRole) {
                        ForEach(Roles, id: \.self) {
                                            Text($0)
                                        }
                        
                    }
                    
                    Picker("Group", selection: $selectedGroups) {
                        ForEach(Groups, id: \.self) {
                                            Text($0)
                                        }
                    }
                    
                    Picker("Personality", selection: $selectedpersonality) {
                        ForEach(Personalities, id: \.self) {
                                            Text($0)
                                        }
                    }
                    
//                    Toggle(isOn: $selectedImportance) {
//                                        Text("Special Treatment")
//                                    }
                    ZStack(alignment: .leading) {
                        if descriptionwritten.isEmpty {
                            Text("Description(Optional)")
                                .foregroundColor(Color.gray)
                                

                        }
                        
                    TextEditor(text: $descriptionwritten)
                            .foregroundColor(Color.black)
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
                            self.addRow()
                        }) {
                            Text("Save")
                        })
        }
        
        //NavigationView {
            
            
        //window.backgroundColor = "purple"
        
    }
    
        
}


struct AddNewPerson_Previews: PreviewProvider {
    static var previews: some View {
        AddNewPerson(listDM: ListDataManager())
    }
}
