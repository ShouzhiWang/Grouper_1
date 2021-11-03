//
//  ListView.swift
//  Grouper
//
//  Created by 王首之 on 2021/10/26.
//

import SwiftUI

struct ListView: View {
    var body: some View {
        ZStack{
            
            NavigationView {
                VStack{
                    Text("Hello, World!")
                    Text("This is Planned for the List Page")
                }
                //Color("DashboardBackground").ignoresSafeArea()
                .navigationTitle("List")
                
            }
        
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
