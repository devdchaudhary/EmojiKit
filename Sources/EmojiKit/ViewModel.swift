//
//  File.swift
//  
//
//  Created by devdchaudhary on 11/07/23.
//

import Foundation

extension EmojiPickerView {
    
    func getEmojiScalar() -> [String] {
        
        var emojiScalar = [String]()
        
        let emojiRanges = [
            0x1F600...0x1F64F, // Emoticons
            8400...8447, // Combining Diacritical Marks for Symbols
            9100...9300, // Misc items
            0x2600...0x26FF, // Misc symbols
            0x2700...0x27BF, // Dingbats
            0xFE00...0xFE0F, // Variation Selectors
            0x1F018...0x1F270, // Various asian characters
            0x1F300...0x1F5FF, // Misc Symbols and Pictographs
            0x1F680...0x1F6FF, // Transport and Map
            0x1F1E6...0x1F1FF, // Regional country flags
            0x1F900...0x1F9FF // Supplemental Symbols and Pictographs
        ]
        
        for range in emojiRanges {
            for i in range {
                guard let scalar = UnicodeScalar(i) else { continue }
                let c = String(scalar)
                if let first = c.first {
                    if first.isSimpleEmoji {
                        emojiScalar.append(c)
                    }
                }
            }
        }
        return emojiScalar
    }
    
    func getEmojiModel() -> [EmojiModel] {
        
        let collection: [String] = getEmojiScalar()
        
        var emojis: [EmojiModel] = []
        
        for emoji in collection {
            
            var name = ""
            
            for scalar in emoji.unicodeScalars {
                name = scalar.properties.name ?? ""
            }
            
            emojis.append(EmojiModel(value: emoji, name: name))
        }
        return emojis
    }
}
