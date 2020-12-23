//
//  ContentView.swift
//  Einkaufsliste
//
//  Created by Frederik van der Veen on 07.12.20.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var groceriesList: GroceriesList

    @State var newEntry = ""
    @State var typing = false

    var body: some View {
        VStack{
            TextField("Neuer Eintrag", text: $newEntry, onEditingChanged: { self.typing = $0 }, onCommit: addNewEntry)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            if isTyping() && !newEntry.isEmpty {
                SuggestionsView(newEntry: $newEntry) {
                    addNewEntry()
                }
            }
            
            GroceriesListView()
        }
    }

    func isTyping() -> Bool {
        return typing == true
    }
    
    func addNewEntry() {
        let answer =
            GrocerieItem(name: newEntry.trimmingCharacters(in: .whitespacesAndNewlines), quantity: 8, unit: "kg")
        
        guard answer.name.count > 0 else {
            return
        }
        // extra valiation
        
        groceriesList.insertItem(answer)
        products.insert(newEntry)
        newEntry = ""
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(GroceriesList())
    }
}
