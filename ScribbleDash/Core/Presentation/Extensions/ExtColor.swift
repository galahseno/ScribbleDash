//
//  ExtColors.swift
//  ScribbleDash
//
//  Created by Galah Seno on 10/06/26.
//

import SwiftUI

// Utility to create SwiftUI Color from ARGB hex (e.g., 0xFF101820)
extension Color {
    /// Initialize a Color from a 32-bit ARGB hex literal.
    /// Example: `Color(hexARGB: 0xFF101820)`
    init(hexARGB: UInt32) {
        let a = Double((hexARGB >> 24) & 0xFF) / 255.0
        let r = Double((hexARGB >> 16) & 0xFF) / 255.0
        let g = Double((hexARGB >> 8) & 0xFF) / 255.0
        let b = Double(hexARGB & 0xFF) / 255.0
        self.init(.sRGB, red: r, green: g, blue: b, opacity: a)
    }
}
