//
//  Toolbarview.swift
//  iPhoneDuoXcode 27.1
//
//  Created by Almira Khafizova on 18.10.26.
//

// This file is responsible for demonstrating SwiftUI toolbar layouts, including settings, sorting, and add buttons, while displaying the toolbar's vertical edge position and the device's current size class.

import SwiftUI

struct ToolbarView: View {
  @Environment(\.toolbarVerticalEdge) private var verticalEdge
  
  var body: some View {
    NavigationStack {
      List {
        SizeClassBadge()
        LabeledContent("Vertical edge", value: edgeLabel)
        ForEach(1...20, id: \.self) { index in
          Text("Row \(index)")
        }
      }
      .navigationTitle("Toolbars")
      .toolbar {
        ToolbarItem(placement: .topBarLeading) {
          Button("Settings", systemImage: "gear") {}
        }
        ToolbarItem(placement: .topBarTrailing) {
          HStack {
            sortMenu
            addButton
          }
        }
      }
    }
  }
  
  private var sortMenu: some View {
    Menu("Sort", systemImage: "arrow.up.arrow.down") {
      Button("Newest") {}
      Button("Oldest") {}
    }
  }
  
  private var addButton: some View {
    Button("Add", systemImage: "plus") {}
  }
  
  private var edgeLabel: String {
    switch verticalEdge {
    case .leading: "leading"
    case .trailing: "trailing"
    case nil: "none"
    }
  }
}
