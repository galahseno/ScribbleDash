//
//  GameModeCardView.swift
//  ScribbleDash
//
//  Created by Ismael Cordón Domínguez on 20/6/26.
//

import SwiftUI

struct GameModeCardView: View {
    let image: ImageResource
    let borderColor: Color
    let gameTitle: String
    let onClick: () -> Void

    var body: some View {
        Button(action: onClick) {
            HStack {
                Text(gameTitle)
                    .typography(.headlineMedium)
                    .foregroundStyle(.onBackground)
                    .multilineTextAlignment(.center)

                Image(image)
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity)
            }
            .padding(.leading, 24)
            .background(.surfaceHigh)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(borderColor, lineWidth: 12)
            )
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    VStack(spacing: 16) {
        GameModeCardView(
            image: .oneRoundWonder,
            borderColor: .success,
            gameTitle: "One Round Wonder"
        ) {
            print("tapped")
        }
    }
    .padding()
}
