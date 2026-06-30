//
//  ControlButtonView.swift
//  ScribbleDash
//
//  Created by Galah Seno on 29/6/26.
//

import SwiftUI

struct ControlButtonView: View {
    let image: ImageResource
    let enabled: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Image(image)
                .renderingMode(.template)
                .scaledToFit()
                .frame(width: 26, height: 26)
                .foregroundStyle(.onBackground)
                .opacity(enabled ? 1 : 0.4)
                .padding(15)
                .background(
                    RoundedRectangle(cornerRadius: 22)
                        .fill(.surfaceLow)
                        .opacity(enabled ? 1 : 0.4)
                )
        }
        .disabled(!enabled)
        .buttonStyle(.plain)
    }
}
