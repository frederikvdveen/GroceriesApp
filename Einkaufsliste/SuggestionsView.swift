//
//  SuggestionsView.swift
//  Einkaufsliste
//
//  Created by Jan van der Veen on 22.12.20.
//

import SwiftUI

struct SuggestionsView: View {
    @Binding var newEntry: String
    var onAction: () -> Void

    @State private var totalHeight = CGFloat.infinity
    
    var body: some View {
        VStack {
            GeometryReader { geometry in
                self.generateContent(in: geometry)
            }
        }
        .frame(maxHeight: totalHeight)
    }

    private func generateContent(in g: GeometryProxy) -> some View {
        var width = CGFloat.zero
        var height = CGFloat.zero

        return ZStack(alignment: .topLeading) {
            ForEach(products.filter({ $0.hasPrefix(newEntry) }).prefix(15), id: \.self) { suggestion in
                Button(action: {
                    newEntry = suggestion
                    onAction()
                })
                {
                    self.item(for: suggestion)
                        .padding([.horizontal, .vertical], 4)
                        .alignmentGuide(.leading, computeValue: { d in
                            if (abs(width - d.width) > g.size.width)
                            {
                                width = 0
                                height -= d.height
                            }
                            let result = width
                            if suggestion == products.filter({ $0.hasPrefix(newEntry) }).prefix(15).last! {
                                width = 0 //last item
                            } else {
                                width -= d.width
                            }
                            return result
                        })
                        .alignmentGuide(.top, computeValue: {d in
                            let result = height
                            if suggestion == products.filter({ $0.hasPrefix(newEntry) }).prefix(15).last! {
                                height = 0 // last item
                            }
                            return result
                        })
                }
            }
        }.background(viewHeightReader($totalHeight))
    }

    private func item(for text: String) -> some View {
        Text(text)
            .padding(.all, 5)
            .font(.body)
            .background(Color.gray)
            .foregroundColor(Color.white)
            .cornerRadius(5)
    }

    private func viewHeightReader(_ binding: Binding<CGFloat>) -> some View {
        return GeometryReader { geometry -> Color in
            let rect = geometry.frame(in: .local)
            DispatchQueue.main.async {
                binding.wrappedValue = rect.size.height
            }
            return .clear
        }
    }
}

/*
struct SuggestionsView: View {
    @Binding var newEntry: String
    
    let onAction: () -> Void

    var body: some View {
        if products.filter({ $0.hasPrefix(newEntry) }).count > 0 {
            GeometryReader { geometry in
                self.generateContent(in: geometry)
            }
        }
    }

    private func generateContent(in g: GeometryProxy) -> some View {
        var width = CGFloat.zero
        var height = CGFloat.zero

        return ZStack(alignment: .topLeading) {
            ForEach(products.filter({ $0.hasPrefix(newEntry) }), id: \.self) { suggestion in
                Button(action: {
                    newEntry = suggestion
                    onAction()
                }) {
                    self.item(for: suggestion)
                        .padding([.horizontal, .vertical], 4)
                        .alignmentGuide(.leading, computeValue: { d in
                            if (abs(width - d.width) > g.size.width)
                            {
                                width = 0
                                height -= d.height
                            }
                            let result = width
                            if suggestion == (products.filter({ $0.hasPrefix(newEntry) })).last {
                                width = 0 //last item
                            } else {
                                width -= d.width
                            }
                            return result
                        })
                        .alignmentGuide(.top, computeValue: {d in
                            let result = height
                            if suggestion == (products.filter({ $0.hasPrefix(newEntry) })).last {
                                height = 0 // last item
                            }
                            return result
                        })
                }
            }
        }
    }

    func item(for text: String) -> some View {
        Text(text)
            .padding(.all, 5)
            .font(.body)
            .foregroundColor(Color.black)
        
    }
}

struct TestWrappedLayout_Previews: PreviewProvider {
    static var previews: some View {
        Text("Hello World!")
    }
}

/*import SwiftUI

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
*/
 */
