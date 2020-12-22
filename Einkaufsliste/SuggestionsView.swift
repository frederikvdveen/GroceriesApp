//
//  SuggestionsView.swift
//  Einkaufsliste
//
//  Created by Jan van der Veen on 22.12.20.
//

import SwiftUI

struct SuggestionsView: View {
    @EnvironmentObject var groceriesList: GroceriesList
    
    @Binding var newEntry: String
    
    let onAction: () -> Void

    var body: some View {
        if products.filter({ $0.hasPrefix(newEntry) }).count > 0 {
            ScrollView(.horizontal){
                HStack{
                    ForEach(products.filter { $0.hasPrefix(newEntry) }, id: \.self) { data in
                        Button(action: {
                            newEntry = data
                            onAction()
                        }) {
                            Text(data)
                                .lineLimit(1)
                                .allowsTightening(false)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
            }
            .padding()
        }
    }
}

struct SuggestionsView_Previews: PreviewProvider {
    static var previews: some View {
        Text("XXX")
/*
        SuggestionsView()
            .environmentObject(GroceriesList())
*/
    }
}
