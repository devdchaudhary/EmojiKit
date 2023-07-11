//
//  SwiftUIView.swift
//  
//
//  Created by devdchaudhary on 11/07/23.
//

import SwiftUI

public struct EmojiPickerView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @State var emojiList: [EmojiModel] = []
    
    @State var isSearched = false
    @State var searchQuery = ""
    
    var reactionSelected: ((String, String) -> Void)?
    
    let items: [GridItem] = [
        .init(.flexible(), spacing: 0),
        .init(.flexible(), spacing: 0),
        .init(.flexible(), spacing: 0),
        .init(.flexible(), spacing: 0)
    ]
    
    public init(isSearched: Bool = false, searchQuery: String = "", reactionSelected: ((String, String) -> Void)?) {
        self.emojiList = emojiList
        self.isSearched = isSearched
        self.searchQuery = searchQuery
        self.reactionSelected = reactionSelected
    }
    
    public var body: some View {
        
        VStack {
            
            Spacer()
            
            HStack {
                
                Spacer()
                
                HStack {
                    
                    Image(systemName: "magnifyingglass")
                    
                    TextField("", text: $searchQuery)
                        .submitLabel(.search)
                        .onSubmit {
                            withAnimation {
                                searchClicked()
                            }
                        }
                        .onChange(of: searchQuery) { newVal in
                            
                            searchQuery = newVal.trimmingCharacters(in: .whitespacesAndNewlines)
                            
                            if searchQuery.isEmpty {
                                
                                isSearched = false
                                searchQuery = ""
                                emojiList = []
                                emojiList = getEmojiModel()
                                
                            } else {
                                
                                emojiList = emojiList.filter({ $0.name.contains(searchQuery.uppercased())})
                                
                            }
                        }
                    
                    Spacer()
                    
                    if isSearched {
                        
                        Button {
                            withAnimation {
                                searchCancelled()
                            }
                        } label: {
                            Image(systemName: "xmark")
                                .foregroundColor(.primaryText)
                        }
                    }
                }
                .padding(.horizontal)
                .padding(.vertical,10)
                .background(Color(uiColor: .systemGray5))
                .cornerRadius(30)
                
                Spacer()
                
            }
            .padding(.vertical, 20)
            .padding(.horizontal)
            
            Spacer()
            
            ScrollView(.vertical) {
                LazyVGrid(columns: items, spacing: 0) {
                    ForEach(emojiList, id: \.id) { emoji in
                        Button {
                            reactionSelected?(emoji.value, emoji.name)
                            dismiss()
                        } label: {
                            Text(emoji.value)
                                .font(.system(size: 30))
                                .padding()
                                .background(Color.secondaryColor.opacity(0.7))
                                .clipShape(Circle())
                        }
                    }
                }
            }
            .onAppear {
                emojiList = getEmojiModel()
            }
        }
    }
    
    private func searchClicked() {
        
        isSearched = true
        
        if searchQuery == "" {
            searchCancelled()
            return
        }
        
        emojiList = emojiList.filter({ $0.name.contains(searchQuery.uppercased())})
    }
    
    private func searchCancelled() {
        isSearched = false
        searchQuery = ""
        emojiList = []
        emojiList = getEmojiModel()
    }
    
}
