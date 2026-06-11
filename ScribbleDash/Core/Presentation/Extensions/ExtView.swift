//
//  ExtView.swift
//  ScribbleDash
//
//  Created by Galah Seno on 11/06/26.
//

import SwiftUI

private struct AppTextStyleModifier: ViewModifier {
    private let spec: TextStyleSpec
    @ScaledMetric private var scaledSize: CGFloat
    @ScaledMetric private var scaledLineHeight: CGFloat

    init(style: AppTextStyle) {
        let spec = AppTypography.spec(for: style)
        self.spec = spec
        self._scaledSize = ScaledMetric(wrappedValue: spec.size, relativeTo: spec.relativeTo)
        self._scaledLineHeight = ScaledMetric(wrappedValue: spec.lineHeight, relativeTo: spec.relativeTo)
    }

    func body(content: Content) -> some View {
        content
            .font(.custom(spec.fontName, size: scaledSize, relativeTo: spec.relativeTo)
                .weight(spec.weight))
            .lineSpacing(max(0, scaledLineHeight - scaledSize))
    }
}

public extension View {
    func typography(_ style: AppTextStyle) -> some View {
        modifier(AppTextStyleModifier(style: style))
    }
}
