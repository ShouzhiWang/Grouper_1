//
//  RandomGroupsUI.swift
//  Grouper
//
//  Created by Justin on 12/2/21.
//

import SwiftUI

struct RandomGroupsUI: View {
    var body: some View {
        List {
            
        }
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
    
    func mrgroups(plist: [String],pInGroup: Int) -> [String] {
        var peopleingroup = plist
        var labels:[String] = []
        let subrange = 0...pInGroup
        peopleingroup.shuffle()
        
        while true {
            if peopleingroup.count.isMultiple(of: pInGroup) {
                labels += peopleingroup[subrange]
                peopleingroup.removeSubrange(subrange)
        }
            else {
                labels += peopleingroup
                break
            }
        }
        return labels
            
        }
}


struct RandomGroupsUI_Previews: PreviewProvider {
    static var previews: some View {
        RandomGroupsUI()
    }
}
