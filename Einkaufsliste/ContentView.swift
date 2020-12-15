//
//  ContentView.swift
//  Einkaufsliste
//
//  Created by Frederik van der Veen on 07.12.20.
//

import SwiftUI

struct ContentView: View {
    
    @State var usedWords = [String]()
    @State var rootWord = ""
    @State var newWord = ""
    
    var body: some View {
        VStack{
            TextField("Neuer Eintrag", text: $newWord, onCommit: addNewWord)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            List{
                ForEach(usedWords) { word in
                    Text(usedWords)
                }
            }
        }
    }
    func addNewWord() {
        let answer =
            newWord.trimmingCharacters(in: .whitespacesAndNewlines)
        
        guard answer.count > 0 else {
            return
        }
        // extra valiation
        
        usedWords.insert(answer, at: 0)
        newWord = ""
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
