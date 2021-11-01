//
//  ListRow.swift
//  Grouper
//
//  Created by 王首之 on 2021/10/28.
//

import SwiftUI

struct ListRow: View {
    var listofpeople: ListOfPeople
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct ListRow_Previews: PreviewProvider {
    static var previews: some View {
        ListRow(listofpeople: ContactList)
    }
}
