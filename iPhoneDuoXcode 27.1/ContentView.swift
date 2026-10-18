//
//  ContentView.swift
//  iPhoneDuoXcode 27.1
//
//  Created by Almira Khafizova on 18.10.26.
//

//This file is responsible for creating the main tab-based navigation interface, allowing users to switch between four screens: Toolbars, Fold, Hinge, and Arrange.

import SwiftUI

struct ContentView: View {
  var body: some View {
    TabView {
      Tab("Toolbars", systemImage: "sidebar.right") {
        ToolbarView()
      }
      Tab("Fold", systemImage: "rectangle.split.2x1") {
        FoldView()
      }
      Tab("Hinge", systemImage: "book") {
        HingeView()
      }
      Tab("Arrange", systemImage: "rectangle.righthalf.inset.filled") {
        ArrangeView()
      }
    }
  }
}

#Preview {
    ContentView()
}
