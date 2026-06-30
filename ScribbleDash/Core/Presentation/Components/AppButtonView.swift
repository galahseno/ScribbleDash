//
//  AppButtonView.swift
//  ScribbleDash
//
//  Created by Galah Seno on 6/7/26.
//

import SwiftUI

struct AppButtonView: View {
    let text: String
    let enabled: Bool
    let fillColor: Color
    var disabledFillColor: Color = .surfaceLowest
    var borderColor: Color = .surfaceHigh
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(text)
                .typography(.headlineSmall)
                .foregroundStyle(.surfaceHigh)
                .padding(.horizontal, 24)
                .padding(.vertical, 12)
                .background(
                    RoundedRectangle(cornerRadius: 16)
                        .fill(enabled ? fillColor : disabledFillColor)
                )
                .padding(6)
                .background(
                    RoundedRectangle(cornerRadius: 22)
                        .fill(borderColor)
                )
        }
        .disabled(!enabled)
        .buttonStyle(.plain)
    }
}
