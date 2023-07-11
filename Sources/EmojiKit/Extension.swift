//
//  File.swift
//  
//
//  Created by devdchaudhary on 11/07/23.
//

import SwiftUI

public extension Character {
    
    var isSimpleEmoji: Bool {
        guard let firstScalar = unicodeScalars.first else { return false }
        return firstScalar.properties.isEmoji && firstScalar.value > 0x238C
    }
    
}

public extension Color {
    
    static let primaryText = Color("primaryText", bundle: .module)
    static let secondaryColor = Color("secondaryColor", bundle: .module)
    
}
