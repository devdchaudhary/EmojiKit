# EmojiKit

A Package that uses the StringProtocol to allow users to fetch a predefined list of emojis, based on their scalar values.

The View uses a ```EmojiPickerView``` constructor wrapper to show the picker view and returns one emoji type of EmojiModel.

Requirements

iOS 15,
Swift 5.0
Xcode 13.0+

Installation

Swift Package Manager

To integrate VoiceRecorderPackage into your Xcode project, specify it in Package Dependancies > Click the "+" button > Copy and paste the URL below:

```https://github.com/devdchaudhary/EmojiKit```

set branch to "master"

Check EmojiKit

Click Add to Project

Usage

Step 1 : Import ```EmojiKit```

Step 2 : Call the ```EmojiKit``` view inside your Main View.

Step 3: Pass in your state variables that will update with the values returned by the view upon your closure running when the view is dismissed.

Below is an example demonstrating the use of the EmojiPicker View.

```
import SwiftUI
import EmojiKit

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
        .sheet(isPresented: $showSheet) {
            EmojiPickerView() { name, value in
                selectedEmoji = name
                selectedEmojiDesc = value
            }
        }
    }
}
```
