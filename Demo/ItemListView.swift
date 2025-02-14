//
//  ItemListView.swift
//  Demo
//
//  Created by apple on 2025/02/10.
//

import SwiftUI

struct ItemListView: View {
    @State private var searchText = ""
    
    var filteredItems: [String: [Item]] {
        guard !searchText.isEmpty else { return groupedItems }
        return groupedItems.mapValues { $0.filter { $0.name.localizedCaseInsensitiveContains(searchText) } }
    }
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(filteredItems.keys.sorted(), id: \.self) { category in
                    Section(header: Text(category)) {
                        ForEach(filteredItems[category] ?? []) { item in
                            NavigationLink(destination: ItemDetailView(item: item)) {
                                Text(item.name)
                            }
                        }
                    }
                }
            }
            .navigationTitle("図面管理リスト")
            .searchable(text: $searchText, prompt: "キーワード")
        }
    }
}
