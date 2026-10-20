//
//  ArrangeView.swift
//  iPhoneDuoXcode 27.1
//
//  Created by Almira Khafizova on 18.10.26.
//

import SwiftUI

// ArrangeView is responsible for demonstrating different UI arrangement styles (automatic, split, overlay) and tracking a view’s position on the screen.

struct ArrangeView: View {
  enum Style: String, CaseIterable {
    case automatic, split, overlay
  }
  
  @State private var style: Style = .automatic
  
  var body: some View {
    VStack(spacing: 0) {
      // This code creates a style picker:
      Picker("Style", selection: $style) {
        ForEach(Style.allCases, id: \.self) { Text($0.rawValue) }
      }
      .pickerStyle(.segmented)
      .padding()
      // The selected style is applied to the list here:
      switch style {
      case .automatic: if #available(anyAppleOS 27.1, *) {
        arrangement.arrangementViewStyle(.automatic)
      } else {
        // Fallback on earlier versions
      }
      case .split: if #available(anyAppleOS 27.1, *) {
        arrangement.arrangementViewStyle(.split)
      } else {
        // Fallback on earlier versions
      }
      case .overlay: if #available(anyAppleOS 27.1, *) {
        arrangement.arrangementViewStyle(.overlay)
      } else {
        // Fallback on earlier versions
      }
      }
    }
  }
  
  private var arrangement: some View {
    if #available(anyAppleOS 27.1, *) {
      ArrangementView {
        List(1...12, id: \.self) { Text("Photo \($0)") }
      } secondary: {
        EditorPane()
      }
    } else {
      // HStack { list; editor}
    }
  }
}

struct EditorPane: View {
  @State private var span: ClosedRange<Int> = 0...0
  
  var body: some View {
    ZStack {
      Color.indigo.opacity(0.2)
      VStack(spacing: 8) {
        Label("Editor", systemImage: "slider.horizontal.3")
          .font(.title2)
        Text("Editor x \(span.lowerBound)–\(span.upperBound)")
          .font(.caption.monospaced())
      }
    }
    /*
     EditorPane — Tracking the View's Position
     This code:
     1. Retrieves the geometry of EditorPane.
     2. Determines its left and right coordinates along the X-axis.
     3. Stores these coordinates in @State span.
     4. Displays the coordinates using Text.
     */
    .onGeometryChange(for: ClosedRange<Int>.self) { proxy in
      let frame = proxy.frame(in: .global)
      return Int(frame.minX)...Int(frame.maxX)
    } action: { newValue in
      span = newValue
    }
  }
}
