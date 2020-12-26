//
//  ContentView.swift
//  Einkaufsliste
//
//  Created by Frederik van der Veen on 07.12.20.
//

import SwiftUI


struct ContentView: View {
    @EnvironmentObject var products: Products
    @EnvironmentObject var groceriesList: GroceriesList

    @State var newEntry = ""
    @State var typing = false
    
    @State private var showingAlert = false

    var body: some View {
        VStack{
            TextField("Neuer Eintrag", text: $newEntry, onEditingChanged: { self.typing = $0 }, onCommit: addNewEntry)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .alert(isPresented: $showingAlert) {
                    Alert(title: Text("Fehler"), message: Text("Name:Anzahl Einheit"), dismissButton: .default(Text("Ok")))
                }
            
            if isTyping() && !newEntry.isEmpty && products.products.filter({ $0.hasPrefix(newEntry) }).count > 0 {
                SuggestionsView(newEntry: $newEntry) {
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
        
        do {
            try grocerieItem.fromString(entry: newEntry)
            groceriesList.insertItem(grocerieItem)

            products.insertProduct(grocerieItem.name)
            
            newEntry = ""
        }
        catch {
            self.showingAlert = true
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(GroceriesList())
    }
}
