//
//  DifficultyOptionView.swift
//  ScribbleDash
//
//  Created by Ismael Cordón Domínguez on 24/6/26.
//

import SwiftUI

struct DifficultyOptionView: View {
    let difficulty: Difficulty
    let onClick: () -> Void
    
    var body: some View {
        VStack(spacing: 12) {
            Image(difficulty.imageName)
                .resizable()
                .scaledToFit()
                .shadow(
                    color: .black.opacity(0.15),
                    radius: 8, x: 0, y: 4
                )
                .onTapGesture {
                    onClick()
                }
            
            Text(difficulty.title)
                .typography(.labelMedium)
        }
    }
}

#Preview {
    DifficultyOptionView(
        difficulty: Difficulty.beginner,
        onClick: {},
    )
}
