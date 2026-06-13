//
//  Typography.swift
//  ScribbleDash
//
//  Created by Galah Seno on 11/06/26.
//

import SwiftUI

private enum AppFontFamily {
    static let bagel = "BagelFatOne-Regular"
    static let outfit = "Outfit-Regular"
}

public enum AppTextStyle: CaseIterable {
    case displayLarge
    case displayMedium
    case headlineLarge
    case headlineMedium
    case headlineSmall
    case headlineXSmall
    case bodyLarge
    case bodyMedium
    case bodySmall
    case labelXLarge
    case labelLarge
    case labelMedium
    case labelSmall
}

internal struct TextStyleSpec {
    let fontName: String
    let weight: Font.Weight
    let size: CGFloat
    let lineHeight: CGFloat
    let relativeTo: Font.TextStyle
}

internal enum AppTypography {
    static func spec(for style: AppTextStyle) -> TextStyleSpec {
        switch style {
        case .displayLarge:
            return TextStyleSpec(
                fontName: AppFontFamily.bagel,
                weight: .regular,
                size: 60,
                lineHeight: 80,
                relativeTo: .largeTitle
            )
        case .displayMedium:
            return TextStyleSpec(
                fontName: AppFontFamily.bagel,
                weight: .regular,
                size: 40,
                lineHeight: 44,
                relativeTo: .title
            )
        case .headlineLarge:
            return TextStyleSpec(
                fontName: AppFontFamily.bagel,
                weight: .regular,
                size: 34,
                lineHeight: 48,
                relativeTo: .title2
            )
        case .headlineMedium:
            return TextStyleSpec(
                fontName: AppFontFamily.bagel,
                weight: .regular,
                size: 26,
                lineHeight: 30,
                relativeTo: .title3
            )
        case .headlineSmall:
            return TextStyleSpec(
                fontName: AppFontFamily.bagel,
                weight: .regular,
                size: 18,
                lineHeight: 26,
                relativeTo: .title3
            )
        case .headlineXSmall:
            return TextStyleSpec(
                fontName: AppFontFamily.bagel,
                weight: .regular,
                size: 14,
                lineHeight: 18,
                relativeTo: .title3
            )
        case .bodyLarge:
            return TextStyleSpec(
                fontName: AppFontFamily.outfit,
                weight: .medium,
                size: 20,
                lineHeight: 24,
                relativeTo: .body
            )
        case .bodyMedium:
            return TextStyleSpec(
                fontName: AppFontFamily.outfit,
                weight: .regular,
                size: 16,
                lineHeight: 24,
                relativeTo: .body
            )
        case .bodySmall:
            return TextStyleSpec(
                fontName: AppFontFamily.outfit,
                weight: .regular,
                size: 14,
                lineHeight: 18,
                relativeTo: .body
            )
        case .labelXLarge:
            return TextStyleSpec(
                fontName: AppFontFamily.outfit,
                weight: .semibold,
                size: 24,
                lineHeight: 28,
                relativeTo: .caption
            )
        case .labelLarge:
            return TextStyleSpec(
                fontName: AppFontFamily.outfit,
                weight: .semibold,
                size: 20,
                lineHeight: 24,
                relativeTo: .caption
            )
        case .labelMedium:
            return TextStyleSpec(
                fontName: AppFontFamily.outfit,
                weight: .medium,
                size: 16,
                lineHeight: 24,
                relativeTo: .caption
            )
        case .labelSmall:
            return TextStyleSpec(
                fontName: AppFontFamily.outfit,
                weight: .semibold,
                size: 14,
                lineHeight: 18,
                relativeTo: .caption
            )
        }
    }
}
