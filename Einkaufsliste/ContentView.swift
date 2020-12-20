//
//  ContentView.swift
//  Einkaufsliste
//
//  Created by Frederik van der Veen on 07.12.20.
//

import SwiftUI

struct ContentView: View {
    
    @State var GroceriesArray = [GrocerieItem]()
    @State var newEntry = ""
    
    @State var typing = false

    var body: some View {
        VStack{
            
            TextField("Neuer Eintrag", text: $newEntry, onEditingChanged: { self.typing = $0 }, onCommit: addNewEntry)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            if typing && !newEntry.isEmpty {
                List {
                    ForEach(products.filter { $0.hasPrefix(newEntry)}, id: \.self) { data in
                        Text(data)
                    }
                }
            } else {
                List {
                    ForEach(GroceriesArray, id: \.self){ data in
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
                        
                    }
                    .onDelete(perform: deleteEntry)
                }
            }
        }
    }

    func addNewEntry() {
        let answer =
            GrocerieItem(name: newEntry.trimmingCharacters(in: .whitespacesAndNewlines), quantity: 8.3974598347598, unit: "kg")
        
        guard answer.name.count > 0 else {
            return
        }
        // extra valiation
        
        GroceriesArray.insert(answer, at: 0)
        newEntry = ""
        
    }

    func deleteEntry(index: IndexSet) {
      if let first = index.first {
        GroceriesArray.remove(at: first)
      }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
