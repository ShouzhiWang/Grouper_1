//
//  PersonalityUI.swift
//  Grouper
//
//  Created by Justin on 12/1/21.
//

import SwiftUI

struct PersonalityUI: View {
    @State private var nump = 3
    var body: some View {
        ZStack {
            VStack {
                VStack {
                    Button("Make Groups") {
                        print("tapped")
                    
                    }
                        .frame(minWidth: 0, maxWidth: 330)
                    
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(17)
                    
                    Stepper("People in every group", value: $nump, in: 2...9)
                        .padding(.horizontal)
                    Text("\(nump) per group")
                        .foregroundColor(.accentColor)
                }
                
                Spacer()
                
                
                
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            }
            
        }
            
            
        
        
        
            //.navigationTitle("Make Groups By Personality")
            .navigationBarTitleDisplayMode(.inline)
    }
        
    //.navigationBarTitle(Text("Title"), displayMode: .inline)
}

struct PersonalityUI_Previews: PreviewProvider {
    static var previews: some View {
        PersonalityUI()
    }
}
