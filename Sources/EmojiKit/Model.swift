//
//  File.swift
//  
//
//  Created by devdchaudhary on 11/07/23.
//

import Foundation

public struct EmojiModel: Hashable {
    
    let id: UUID
    let value: String
    let name: String

    init(value: String, name: String) {
        id = UUID()
        self.value = value
        self.name = name
    }
    
}
