//
//  SizeClassBadge.swift
//  iPhoneDuoXcode 27.1
//
//  Created by Almira Khafizova on 18.10.26.
//

// This file is responsible for displaying the current horizontal and vertical size classes (compact or regular) in a badge, helping developers understand how the UI adapts to different screen sizes and orientations.

import SwiftUI

struct SizeClassBadge: View {
  //Layout from size classes don't write  if UIDevice.current.model == ...
  @Environment(\.horizontalSizeClass) private var horizontal
  // if horizontal == .regular { twoPanes } else { onePane }
  @Environment(\.verticalSizeClass) private var vertical
  
  var body: some View {
    Text("w: \(label(horizontal))  h: \(label(vertical))")
      .font(.caption.monospaced())
      .padding(.horizontal, 10)
      .padding(.vertical, 4)
      .background(.thinMaterial, in: .capsule)
  }
  
  private func label(_ sizeClass: UserInterfaceSizeClass?) -> String {
    switch sizeClass {
    case .compact: "compact"
    case .regular: "regular"
    default: "nil"
    }
  }
}
