//
//  RandomUI.swift
//  Grouper
//
//  Created by Justin on 12/2/21.
//

import SwiftUI

struct RandomUI: View {
    @State private var nump = 3
    let listDM: ListDataManager
    let historyDM: HistoryDataManager
    
    @State private var ppls: [People] = [People]()
    @State private var needsrefresh: Bool = false
    @State var selections: [String] = []
    @State var compgroups: [String] = []
    @State private var showAbout = false
    
    @State private var showingPopover = false
    
    func populateperson() {
        ppls = listDM.getAllPeople()
    }
    
    func mrgroups(plist: [String],pInGroup: Int) -> [String] {
        //make random groups
        var peopleingroup = plist
        var labels:[String] = []
        let subrange = 0...pInGroup - 1
        var tempgroup: String = ""
        peopleingroup.shuffle()
        
        
        while peopleingroup.count >= pInGroup {
            tempgroup = ""
            for s in subrange {
                let tempg = peopleingroup[s]
                tempgroup += "\(tempg)   "
            }
            
            labels.append(tempgroup)
            
            peopleingroup.removeSubrange(subrange)
            
            
        }
        if peopleingroup.count < pInGroup && peopleingroup.count != 0 {
            
            tempgroup = ""
            for p in peopleingroup {
                let tempg = p
                tempgroup += "\(tempg)   "
            }
            labels.append(tempgroup)
           
        }
        historyDM.savePerson(igroup: String(nump), members: labels)
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
                                            }
                                            else {
                                                self.selections.append(person.name ?? "")
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
                            for p in ppls {
                                selections.append(p.name ?? "")
                            }
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
                    List(mrgroups(plist: selections, pInGroup: nump), id: \.self) { c in
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


struct RandomUI_Previews: PreviewProvider {
    static var previews: some View {
        RandomUI(listDM: ListDataManager(), historyDM: HistoryDataManager())
    }
}
