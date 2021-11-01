//
//  ListOfPeople.swift
//  Grouper
//
//  Created by 王首之 on 2021/10/28.
//

import Foundation
import SwiftUI

struct ContactList: Hashable, Codable {
    var id: Int
    var name: String
    var group: String
    var role: String
    var description: String
    
    
    private var imageName: String
    var image: Image {
        Image(imageName)
    }
}

