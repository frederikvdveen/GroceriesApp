//
//  GroceriesModel.swift
//  Einkaufsliste
//
//  Created by Frederik van der Veen on 20.12.20.
//

import Foundation

enum GroceriesListError: Error {
    case IndexOfItemWithIdNotFound
}

class GroceriesList: ObservableObject {
    @Published var grocerieItems = [GrocerieItem]()
    
    func getItems() -> [GrocerieItem] {
        return grocerieItems
    }
    
    func insertItem(_ item: GrocerieItem) {
        grocerieItems.insert(item, at: 0)
        grocerieItems.sort(by: { $0.name < $1.name } )
    }
    
    func deleteItem(at: Int) {
        grocerieItems.remove(at: at)
    }
    
    func deleteItem(id: UUID) {
        grocerieItems.removeAll { item in
            item.id == id
        }
    }
    
    func toggleStrokeState(id: UUID) {
        do {
            let index = try indexOfItemWithId(id)
            grocerieItems[index].toggleStrokeState()
        }
        catch (GroceriesListError.IndexOfItemWithIdNotFound) {
            print("No item with id \(id) found in groceryItems")
        }
        catch {
            print("Unknown error in toggleStrokeState(id: \(id)")
        }
    }
    
    private func indexOfItemWithId(_ id: UUID) throws -> Int {
        for index: Int in 0..<grocerieItems.count {
            if id == grocerieItems[index].id {
                return index
            }
        }
        throw GroceriesListError.IndexOfItemWithIdNotFound
    }
}

enum GrocerieItemError: Error {
    case InputIsEmpty
    case NoNameFound
    case NoQuantityFound
}
        

struct GrocerieItem: Hashable, Identifiable {
    let id = UUID()
    
    var name: String = ""
    var quantity: Double = 1.0
    var unit: String = ""
    
    var strokenOut: Bool = false
    
    mutating func toggleStrokeState() {
        self.strokenOut.toggle()
    }
    
    func toString() -> String {
        return "\(self.name) : \(self.quantity) \(self.unit)"
    }
    
    mutating func fromString(entry: String) throws {
        let input = entry.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if input.count == 0 {
            throw GrocerieItemError.InputIsEmpty
        }
        
        if !input.contains(":") {
            self.name = entry
            self.quantity = 1.0
            self.unit = ""
            
            return
        }
            
        if ":" == input.first {
            throw GrocerieItemError.NoNameFound
        }
        
        let parts = input.split(separator: ":")

        self.name = String(parts[0]).trimmingCharacters(in: .whitespacesAndNewlines)
        
        if 1 == parts.count {
            self.quantity = 1.0
            self.unit = ""
            
            return
        }
        
        var rest = parts[1].trimmingCharacters(in: .whitespacesAndNewlines)
            
        if let number = rest.range(of: #"\b((\d+(\.\d*)?)|("# + Locale.current.decimalSeparator! + #"\d+))"#, options: .regularExpression) {
            if let q = Double(rest[number]) {
                self.quantity = q
            } else {
                throw GrocerieItemError.NoQuantityFound
            }
            rest.removeSubrange(number)
        }
        self.unit = rest.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}

class Products: ObservableObject {
    @Published var products = ["Aalsuppe", "Agavendicksaft", "Ahornsirup", "Ajvar", "Ananas", "Anis", "Anona", "Apfel", "Apfelkompott", "Apfelkraut", "Backaroma", "Backfett", "Backware", "Backwerk", "Baiser", "Balsamessig", "Balsamico", "Banane", "Basilikum", "Bauernbrot", "Calzone", "Camembert", "Cannelloni", "Cashew", "Cashewnuss", "Cayennepfeffer", "Champignon", "Cheddarkäse", "Chester", "Chesterkäse", "Apfelsine", "Aprikose", "Artischocke", "Artischockenherz", "Aubergine", "Auflauf", "Austernpilz", "Avocado", "Bergkäse", "Bienenstich", "Birne", "Biskuitteig", "Bitterschokolade", "Blattsalat", "Blattspinat", "Blaubeere", "Blaukohl", "Blaukraut", "Blauschimmelkäse", "Blätterteig", "Blumenkohl", "Blutorange", "Blutwurst", "Blütenhonig", "Bockwurst", "Bohne", "Bohnenkraut", "Bohnensuppe", "Borschtsch", "Boskop", "Bouillon", "Bouillonwürfel", "Bratapfel", "Bratwurst", "Broccoli", "Brokkoli", "Brombeere", "Brot", "Brotaufstrich", "Brotsuppe", "Brotteig", "Brunnenkresse", "Brühwürfel", "Buchweizen", "Bulgur", "Butter", "Buttercreme", "Buttergebäck", "Butterkäse", "Butterkeks", "Butterpilz", "Büchsenmilch", "Béchamelsauce", "Chiasamen", "Chicken", "Nugetts", "Chicorée", "Chili", "Chilisauce", "Chilisoße", "Chinakohl", "Chorizo", "Christstollen", "Ciabatta", "Citrusfrucht", "Clementine", "Consommé", "Cookie", "Corned", "beef", "Cornflakes", "Couscous", "Cranberry", "Croissant", "Crème fraîche", "Curry", "Currypulver", "Currysauce", "Currysoße", "Currywurst", "Béchamelsoße"]
    
    func insertProduct(_ product: String) {
        if 0 == products.filter({ product == $0 }).count {
            products.insert(product, at: 0)
            products.sort(by: { $0 < $1 } )
        }
    }
}
