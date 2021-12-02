//
//  ContentView.swift
//  Grouper
//
//  Created by 王首之 on 2021/10/19.
//

import SwiftUI

struct ContentView: View {
    @State private var selection: Tab = .dashboard
    
    enum Tab {
        case dashboard
        case list
        case history
        case me
    }
    
        
    var body: some View {
        TabView(selection: $selection) {
            
            DashboardView(listDM: ListDataManager())
                .tabItem {
                    Label("Dashboard", systemImage: "speedometer")
                        }

                .tag(Tab.dashboard)
                .onAppear {
                    if #available(iOS 15.0, *) {
                        let appearance = UITabBarAppearance()
                        UITabBar.appearance().scrollEdgeAppearance = appearance
                    }
                }
            
                //.border("blue")

            ListView(listDM: ListDataManager())
                .tabItem {
                    Label("List", systemImage: "person.crop.rectangle.stack")
                        }
                .tag(Tab.list)
            
            HistoryView()
                .tabItem {
                    Label("History", systemImage: "clock.arrow.circlepath")
                        }
                .tag(Tab.history)
            
            UserSelfView()
                .tabItem {
                    Label("Me", systemImage: "person.crop.circle")
                        }
                .tag(Tab.me)
        }
        //Text("hello world")
        //Image("introduction_V1").resizable(resizingMode: .stretch).ignoresSafeArea()
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            ContentView()
        }
            
    }
}

