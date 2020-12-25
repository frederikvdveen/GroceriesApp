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
            
            if isTyping() && !newEntry.isEmpty && products.filter({ $0.hasPrefix(newEntry) }).count > 0 {
                SuggestionsView(newEntry: $newEntry)
                {
                    addNewEntry()
                }
                .padding()
            }
            
            GroceriesListView()
        }
    }

    func isTyping() -> Bool {
        return typing == true
    }
    
    func addNewEntry() {
        var grocerieItem = GrocerieItem(name: "", quantity: 1.0, unit: "")
        grocerieItem.fromString(entry: newEntry)
        
        let answer =
            GrocerieItem(name: newEntry.trimmingCharacters(in: .whitespacesAndNewlines), quantity: 8, unit: "kg")
        
        guard answer.name.count > 0 else {
            return
        }
        // extra validation
        
        groceriesList.insertItem(answer)
        products.insert(newEntry, at: 0)
        newEntry = ""
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(GroceriesList())
    }
}
