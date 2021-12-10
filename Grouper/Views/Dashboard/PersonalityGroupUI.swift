//
//  PersonalityGroupUI.swift
//  Grouper
//
//  Created by 王首之 on 2021/12/10.
//

import SwiftUI

struct PersonalityGroupUI: View {
    let historyDM: HistoryDataManager
    @State private var hsty: [History] = [History]()
    
    var body: some View {
        VStack {
            List(hsty.last!.members!, id: \.self) { p in
                Text(p)
            }
            
        }.onAppear(perform: {
            hsty = historyDM.getAllHistory()
        })
        
        
    }
}

struct PersonalityGroupUI_Previews: PreviewProvider {
    static var previews: some View {
        PersonalityGroupUI(historyDM: HistoryDataManager())
    }
}
