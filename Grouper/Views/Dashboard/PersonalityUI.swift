//
//  PersonalityUI.swift
//  Grouper
//
//  Created by Justin on 12/1/21.
//

import SwiftUI

struct PersonalityUI: View {
    @State private var nump = 3
    let listDM: ListDataManager
    let historyDM: HistoryDataManager
    
    @State private var ppls: [People] = [People]()
    @State private var pSelection: [People] = []
    @State private var needsrefresh: Bool = false
    @State var selections: [String] = []
    @State var compgroups: [String] = []
    @State private var showAbout = false
    
    @State private var showingPopover = false
    
    func populateperson() {
        ppls = listDM.getAllPeople()
    }
    
    func mrgroups(pInGroup: Int, pdata: [People]) -> [String] {
        //make random groups
        //var peopleingroup = plist
        var labels:[String] = []
        var pConflict:[String] = []
        var pOptional:[String] = []
        var pElse:[String] = []
        var pLeftover:[String] = []

        let subrange = 0...pInGroup - 1
        var tempgroup: String = ""
        
        for p in pdata {
            if p.personality == "INFP" || p.personality == "ENFP" || p.personality == "INFJ" || p.personality == "ENFJ" {
                pConflict.append(p.name!)
            }
            else if p.personality == "Optional..." {
                pOptional.append(p.name!)
            }
            else {
                pElse.append(p.name!)
            }
        }
        
        pConflict.shuffle()
        pOptional.shuffle()
        pElse.shuffle()
        
        //pConflict
        while pConflict.count >= pInGroup {
            tempgroup = ""
            for s in subrange {
                let tempg = pConflict[s]
                tempgroup += "\(tempg)   "
            }
            
            labels.append(tempgroup)
            
            pConflict.removeSubrange(subrange)
            
        }
        if pConflict.count < pInGroup && pConflict.count != 0 {
            
            tempgroup = ""
            for p in pConflict {
                let tempg = p
                tempgroup += "\(tempg)   "
            }
            pLeftover.append(tempgroup)
        }
        
        //pOptional
        while pOptional.count >= pInGroup {
            tempgroup = ""
            for s in subrange {
                let tempg = pOptional[s]
                tempgroup += "\(tempg)   "
            }
            
            labels.append(tempgroup)
            
            pOptional.removeSubrange(subrange)
            
        }
        if pOptional.count < pInGroup && pOptional.count != 0 {
            
            tempgroup = ""
            for p in pOptional {
                let tempg = p
                tempgroup += "\(tempg)   "
            }
            pLeftover.append(tempgroup)
        }
        
        //pElse
        while pElse.count >= pInGroup {
            tempgroup = ""
            for s in subrange {
                let tempg = pElse[s]
                tempgroup += "\(tempg)   "
            }
            
            labels.append(tempgroup)
            
            pElse.removeSubrange(subrange)
            
        }
        if pElse.count < pInGroup && pElse.count != 0 {
            
            tempgroup = ""
            for p in pElse {
                let tempg = p
                tempgroup += "\(tempg)   "
            }
            pLeftover.append(tempgroup)
        }
        
        
        //pLeftover
        while pLeftover.count >= pInGroup {
            tempgroup = ""
            for s in subrange {
                let tempg = pLeftover[s]
                tempgroup += "\(tempg)   "
            }
            
            labels.append(tempgroup)
            
            pLeftover.removeSubrange(subrange)
            
        }
        if pLeftover.count < pInGroup && pLeftover.count != 0 {
            
            tempgroup = ""
            for p in pLeftover {
                let tempg = p
                tempgroup += "\(tempg)   "
            }
            labels.append(tempgroup)
        }
        
        
        //historyDM.savePerson(igroup: String(nump), members: labels)
        return labels
            
        }
    
    var body: some View {
        ZStack {
            VStack {
                VStack {
                    
                    Stepper("People in every group", value: $nump, in: 2...9)
                        .padding(.horizontal)
                    Text("\(nump) per group")
                        .foregroundColor(.accentColor)
                    
                }
                
                //Spacer()
                
                List {
                    ForEach(ppls, id: \.self) { person in
                        MultipleSelectionRow(title: person.name ?? "", isSelected: self.selections.contains(person.name ?? "")) {
                                            if self.selections.contains(person.name ?? "") {
                                                self.selections.removeAll(where: { $0 == person.name ?? "" })
                                                self.pSelection.removeAll(where: { $0 == person})
                                            }
                                            else {
                                                self.selections.append(person.name ?? "")
                                                self.pSelection.append(person)
                                            }
                                        }
//                        HStack {
//                            Image(systemName: "person.circle")
//                                .resizable()
//                                .frame(width: 50, height: 50)
//                            Text(person.name ?? "")
//                        }
                        }
                }
                        
                
                .listStyle(DefaultListStyle())
                    
                    
                
                VStack {
                    Text("Don't select anyone if you want to make groups for everyone")
                        .font(.footnote)
                        
                    
                    Button("Make Groups") {
                        if selections.isEmpty {
                            pSelection = ppls
                            showingPopover = true
                           //showAbout = true
                        }
                        else {
                            
                            showingPopover = true
                        }
                        
                    
                    }
                        .frame(minWidth: 0, maxWidth: 330)
                    
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(17)
                        .alert(isPresented: $showAbout) {
                            Alert(
                                title: Text("Don't forget to choose people! ")
                            )
                        }
                    
                    
                }
                
            }
            
        }
            
            //.navigationTitle("Make Groups By Personality")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear(perform: {
                ppls = listDM.getAllPeople()
                
            })
    
        .popover(isPresented: $showingPopover) {
            //navigationBarBackButtonHidden(false)
            NavigationView {
                VStack {
                    List(mrgroups(pInGroup: nump, pdata: pSelection), id: \.self) { c in
                        Text(c)
                    }
//                    List {
//                        ForEach(compgroups, id:\.self) { pl in
//                            Text(pl)
//                        }
                    
                    
                    
//                    Text("Your content here")
//                        .font(.headline)
//                        .padding()
                }
                
                    
                    .toolbar {
                        Button("Done") {
                            showingPopover = false
                        }
                        
                        
                    }
            }
            }
            
                        

//            NavigationLink(destination: DashboardView(listDM: listDM)) {
//                Label("Done", systemImage: "folder")
//            }
//
                        
   
        
    //.navigationBarTitle(Text("Title"), displayMode: .inline)
}


    struct MultipleSelectionRow: View {
        var title: String
        var isSelected: Bool
        var action: () -> Void

        var body: some View {
            
            Button(action: self.action) {
                HStack {
                    Image(systemName: "person.circle")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .foregroundColor(Color("txtcolor"))
                    Text(title)
                        .foregroundColor(Color("txtcolor"))
                    if self.isSelected {
                        Spacer()
                        Image(systemName: "checkmark")
                    }
                }
            }
        }
    }
}
        


struct MultipleSelectionRow: View {
    var title: String
    var isSelected: Bool
    var action: () -> Void

    var body: some View {
        
        Button(action: self.action) {
            HStack {
                Image(systemName: "person.circle")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .foregroundColor(Color(UIColor.darkText))
                Text(title)
                    .foregroundColor(Color(UIColor.darkText))
                if self.isSelected {
                    Spacer()
                    Image(systemName: "checkmark")
                }
            }
        }
    }
}

struct PersonalityUI_Previews: PreviewProvider {
    static var previews: some View {
        PersonalityUI(listDM: ListDataManager(), historyDM: HistoryDataManager())
    }
}
