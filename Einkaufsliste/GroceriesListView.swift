//
//  GroceriesListView.swift
//  Einkaufsliste
//
//  Created by Jan van der Veen on 23.12.20.
//

import SwiftUI

struct GroceriesListView: View {
    @EnvironmentObject var groceriesList: GroceriesList

    var body: some View {
        List {
            ForEach(groceriesList.grocerieItems) { item in
                GroceriesListItemView(item: item)
            }
            .onDelete { indexSet in
                if let index = indexSet.first {
                    groceriesList.deleteItem(at: index)
                }
            }
        }
    }
}

struct GroceriesListView_Previews: PreviewProvider {
    static var previews: some View {
        Text("XXX")
//        GroceriesListView(grocerieItems: [GrocerieItem]())
    }
}
