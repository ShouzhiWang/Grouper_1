//
//  HistoryView.swift
//  Grouper
//
//  Created by 王首之 on 2021/10/26.
//

import SwiftUI


struct HistoryView: View {
    let dateformatterd = DateFormatter()
    let historyDM: HistoryDataManager
    @State private var hsty: [History] = [History]()
    
    func populateperson() {
        hsty = historyDM.getAllHistory()
    }
//    init() {
//        dateformatterd.dateFormat = " YYYY - MM - dd HH:mm"
//    }
    
    
    
    
    var body: some View {
        
        
        NavigationView {
            
            
                
                List {
                    ForEach(hsty, id: \.self) { ht in

                        NavigationLink(destination: HistoryDetail(historyDM: HistoryDataManager(), record: ht), label: {
                            Text(dateformatterd.string(from: ht.time!))
                                
                        }
                            )
                            
                            
                            
                        
                        
                    }.onDelete(perform: {indexSet in indexSet.forEach { index in
                        let person = hsty[index]
                        historyDM.deleteHistory(person: person)
                        populateperson()
                        //mamager
                            
                    
                    }}).background(Color.clear)
                }.onAppear(perform: {
                hsty = historyDM.getAllHistory()
                dateformatterd.dateFormat = " YYYY-MM-dd HH:mm"
                
                
            })
            .navigationTitle(Text("History"))
        }
        
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView(historyDM: HistoryDataManager())
    }
}
