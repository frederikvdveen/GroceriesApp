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
    
    var body: some View {
        VStack{
            TextField("Neuer Eintrag", text: $newEntry, onCommit: addNewEntry)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
           
            List{
                ForEach(GroceriesArray, id: \.self){ data in
                    HStack{
                        Text(data.name)
                        Spacer()
                        Text("\(data.quantity)")
                            .fontWeight(.thin)
//                            .padding()
                        Text("\(data.unit)")
                            .fontWeight(.thin)
                    }
                    
                }
                .onDelete(perform: deleteEntry)
            }
            
        }
    }
    
    func addNewEntry() {
        let answer =
            GrocerieItem(name: newEntry.trimmingCharacters(in: .whitespacesAndNewlines), quantity: 2.7, unit: "kg")
        
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
