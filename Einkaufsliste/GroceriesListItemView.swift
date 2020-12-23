//
//  GroceriesListItemView.swift
//  Einkaufsliste
//
//  Created by Jan van der Veen on 23.12.20.
//

import SwiftUI

struct GroceriesListItemView: View {
    @EnvironmentObject var groceriesList: GroceriesList
    
    var item: GrocerieItem
    
    var body: some View {
        HStack {
            Text(item.name)
                .strikethrough(item.strokenOut)
            
            Spacer()
            
            //Checks if data.quantity has decimals
            if floor(item.quantity) == item.quantity {
                Text(String(format: "%.0f", item.quantity))
                    .fontWeight(.thin)
                    .strikethrough(item.strokenOut)
            } else {
                Text(String(format: "%.2f", item.quantity))
                    .fontWeight(.thin)
                    .strikethrough(item.strokenOut)
            }
            Text(item.unit)
                .fontWeight(.thin)
                .strikethrough(item.strokenOut)
        }
        .contentShape(Rectangle())
        .onTapGesture {
            groceriesList.toggleStrokeState(id: item.id)
        }
    }
}

struct GroceriesListItemView_Previews: PreviewProvider {
    static var previews: some View {
        Text("GroceriesListItemView")
    }
}
