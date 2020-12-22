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
            
            List {
                ForEach(groceriesList.getItems(), id: \.self) { data in
                    HStack{
                        Text(data.name)
                        Spacer()
                        
                        //Checks if data.quantity has decimals
                        if floor(data.quantity) == data.quantity {
                            Text(String(format: "%.0f", data.quantity))
                                .fontWeight(.thin)
                        } else {
                            Text(String(format: "%.2f", data.quantity))
                                .fontWeight(.thin)
                        }
                        Text(data.unit)
                            .fontWeight(.thin)
                    }
                    .contentShape(Rectangle())
                    .onTapGesture {
                        print(data.name)
                    }
                }
                .onDelete(perform: deleteEntry)
            }
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

    func deleteEntry(index: IndexSet) {
      if let first = index.first {
        groceriesList.deleteItem(at: first)
      }
    }

    func markEntry(index: IndexSet) {
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(GroceriesList())
    }
}
