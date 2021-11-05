//
//  CircleImage.swift
//  Grouper
//
//  Created by 王首之 on 2021/11/4.
//


import SwiftUI

struct CircleImage: View {
    var listofpeople: ContactList
    var body: some View {
        listofpeople.image
            .resizable()
            .clipShape(Circle())
            .overlay (
                Circle()
                    .stroke(.white, lineWidth: 4)
                    
            )
            .shadow(radius: 7)
        
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(listofpeople: peoples[0])
            .previewLayout(.fixed(width: 150, height: 150))
    }
}
