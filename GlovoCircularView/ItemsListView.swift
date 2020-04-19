//
//  ItemsListView.swift
//  GlovoCircularView
//
//  Created by Amr AbdelWahab on 4/19/20.
//  Copyright © 2020 Orcas. All rights reserved.
//

import Foundation
import SwiftUI

struct ItemsListView: View {
    let items = [Item(index: 1, name: "1",color: .red),
                 Item(index: 2, name: "2",color:.green),
                 Item(index: 3, name: "3",color:.yellow),
                 Item(index: 4, name: "4",color:.blue),
                 Item(index: 5, name: "5",color:.gray),
                 Item(index: 6, name: "6",color: .purple)]
   var body: some View {
    
    GlovoCircularView(items:items, arcCell: { item in
        return ArcCell.init(name: item.name)
    }
 , width: 400)
      }
}

struct Item: Identifiable {
    let id = UUID()
    let index: Int
    let name: String
    let color: Color
}

struct ArcCell: View {
    let name: String
    var body: some View {
        Text(name).foregroundColor(.pink)
    }
}
