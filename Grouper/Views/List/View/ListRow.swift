//
//  ListRow.swift
//  Grouper
//
//  Created by 王首之 on 2021/10/28.
//

import SwiftUI

struct ListRow: View {
    var listofpeople: ContactList
    
    var body: some View {
        HStack{
            listofpeople.image
                .resizable()
                .frame(width: 50, height: 50)
            Text(listofpeople.name)

                       Spacer()
        }
        
    }
}

struct ListRow_Previews: PreviewProvider {
    static var previews: some View {
        ListRow(listofpeople: peoples[0])
            .previewLayout(.fixed(width: 300, height: 70))
    }
}
