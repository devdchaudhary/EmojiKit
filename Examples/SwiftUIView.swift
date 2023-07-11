//
//  SwiftUIView.swift
//  
//
//  Created by devdchaudhary on 11/07/23.
//

import SwiftUI

struct EmojiView: View {
    
    @State private var selectedEmoji = "Select"
    @State private var selectedEmojiDesc = "Desc"

    @State private var showSheet = false
    
    var body: some View {
        
        VStack {
            
            Button {
                showSheet.toggle()
            } label: {
                Text(selectedEmoji)
                    .font(.system(size: 20))
            }
            
            Text(selectedEmojiDesc)
                .foregroundColor(.primaryText)
                .padding(.vertical)
            
        }
        .fullScreenCover(isPresented: $showSheet) {
            EmojiPickerView() { name, value in
                selectedEmoji = name
                selectedEmojiDesc = value
            }
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiView()
    }
}
