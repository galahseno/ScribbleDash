//
//  PenColors.swift
//  ScribbleDash
//
//  Created by Galah Seno on 10/06/26.
//

import SwiftUI

public enum PenColors {
    // MARK: - Basic Pen Colors
    public static let midnightBlack = Color(hexARGB: 0xFF101820)
    public static let crimsonRed     = Color(hexARGB: 0xFFB22234)
    public static let sunshineYellow = Color(hexARGB: 0xFFF9D85D)
    public static let oceanBlue      = Color(hexARGB: 0xFF1D4E89)
    public static let emeraldGreen   = Color(hexARGB: 0xFF4CAF50)
    public static let flameOrange    = Color(hexARGB: 0xFFF57F20)

    // MARK: - Premium Pen Colors
    public static let roseQuartz     = Color(hexARGB: 0xFFF4A6B8)
    public static let royalPurple    = Color(hexARGB: 0xFF6A0FAB)
    public static let tealDream      = Color(hexARGB: 0xFF008C92)
    public static let goldenGlow     = Color(hexARGB: 0xFFFFD700)
    public static let coralReef      = Color(hexARGB: 0xFFFF6F61)
    public static let majesticIndigo = Color(hexARGB: 0xFF4B0082)
    public static let copperAura     = Color(hexARGB: 0xFFB87333)

    // MARK: - Legendary Pen Gradient
    public static let rainbowPenGradient = LinearGradient(
        colors: [
            Color(hexARGB: 0xFFFB02FB), // Magenta
            Color(hexARGB: 0xFF0000FF), // Blue
            Color(hexARGB: 0xFF00EEFF), // Cyan
            Color(hexARGB: 0xFF008000), // Green
            Color(hexARGB: 0xFFFFFF00), // Yellow
            Color(hexARGB: 0xFFFFA500), // Orange
            Color(hexARGB: 0xFFFF0000)  // Red
        ],
        startPoint: .leading,
        endPoint: .trailing
    )
}
