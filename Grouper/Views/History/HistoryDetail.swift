//
//  HistoryDetail.swift
//  Grouper
//
//  Created by 王首之 on 2021/12/5.
//

import SwiftUI

struct HistoryDetail: View {
    let historyDM: HistoryDataManager
    let record: History
    let dateformatterd = DateFormatter()
    
    //let ping = record.pInGroup
    
    var body: some View {
        ZStack{
            Color("ListColor")
                .ignoresSafeArea()
            
            VStack {
                
                List(record.members!, id: \.self) { m in
                    Text(m)
                }
                Text("\(record.pInGroup ?? "") person per group")
                
            }
        }.navigationTitle(Text("Details"))
            .navigationBarTitleDisplayMode(.inline)
            
        
        
        //Text("\(record.pInGroup) in each group")
    }
}

struct HistoryDetail_Previews: PreviewProvider {
    static var previews: some View {
        let record = History()
        HistoryDetail(historyDM: HistoryDataManager(), record: record)
    }
}
