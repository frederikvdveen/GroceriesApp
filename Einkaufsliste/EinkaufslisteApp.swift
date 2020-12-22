//
//  EinkaufslisteApp.swift
//  Einkaufsliste
//
//  Created by Frederik van der Veen on 07.12.20.
//

import SwiftUI

@main
struct EinkaufslisteApp: App {
    @StateObject var groceriesList = GroceriesList()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(groceriesList)
        }
    }
}
