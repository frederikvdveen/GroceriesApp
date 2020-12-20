//
//  GroceriesModel.swift
//  Einkaufsliste
//
//  Created by Frederik van der Veen on 20.12.20.
//

import Foundation

struct GrocerieItem: Hashable {
    var name: String
    var quantity: Double = 1.0
    var unit: String = ""
}

let products: Set = ["Aalsuppe", "Agavendicksaft", "Ahornsirup", "Ajvar", "Ananas", "Anis", "Anona", "Apfel", "Apfelkompott", "Apfelkraut", "Backaroma", "Backfett", "Backware", "Backwerk", "Baiser", "Balsamessig", "Balsamico", "Banane", "Basilikum", "Bauernbrot", "Calzone", "Camembert", "Cannelloni", "Cashew", "Cashewnuss", "Cayennepfeffer", "Champignon", "Cheddarkäse", "Chester", "Chesterkäse", "Apfelsine", "Aprikose", "Artischocke", "Artischockenherz", "Aubergine", "Auflauf", "Austernpilz", "Avocado", "Bergkäse", "Bienenstich", "Birne", "Biskuitteig", "Bitterschokolade", "Blattsalat", "Blattspinat", "Blaubeere", "Blaukohl", "Blaukraut", "Blauschimmelkäse", "Blätterteig", "Blumenkohl", "Blutorange", "Blutwurst", "Blütenhonig", "Bockwurst", "Bohne", "Bohnenkraut", "Bohnensuppe", "Borschtsch", "Boskop", "Bouillon", "Bouillonwürfel", "Bratapfel", "Bratwurst", "Broccoli", "Brokkoli", "Brombeere", "Brot", "Brotaufstrich", "Brotsuppe", "Brotteig", "Brunnenkresse", "Brühwürfel", "Buchweizen", "Bulgur", "Butter", "Buttercreme", "Buttergebäck", "Butterkäse", "Butterkeks", "Butterpilz", "Büchsenmilch", "Béchamelsauce", "Chiasamen", "Chicken", "Nugetts", "Chicorée", "Chili", "Chilisauce", "Chilisoße", "Chinakohl", "Chorizo", "Christstollen", "Ciabatta", "Citrusfrucht", "Clementine", "Consommé", "Cookie", "Corned", "beef", "Cornflakes", "Couscous", "Cranberry", "Croissant", "Crème fraîche", "Curry", "Currypulver", "Currysauce", "Currysoße", "Currywurst", "Béchamelsoße"]
