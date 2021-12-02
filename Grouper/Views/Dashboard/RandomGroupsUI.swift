//
//  RandomGroupsUI.swift
//  Grouper
//
//  Created by Justin on 12/2/21.
//

import SwiftUI

struct RandomGroupsUI: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
    
    func mrgroups(plist: [String],pInGroup: Int) {
        var peopleingroup = plist
        peopleingroup.shuffle()
        var peoplecount = peopleingroup.count
        
        
        ForEach(plist, id: \.self) { person in
            
        }
    }
}

struct RandomGroupsUI_Previews: PreviewProvider {
    static var previews: some View {
        RandomGroupsUI()
    }
}
