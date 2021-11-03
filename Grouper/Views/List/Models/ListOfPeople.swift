//
//  ListOfPeople.swift
//  Grouper
//
//  Created by 王首之 on 2021/10/28.
//

import Foundation
import SwiftUI

struct ContactList: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var group: String
    var role: String
    var description: String
    var isFeatured: Bool
    
    
    private var imageName: String
    var image: Image {
        if imageName == "Default" {
            return Image(systemName: "person.circle")
        }
        else {
            return Image(imageName)
        }
    }
}

