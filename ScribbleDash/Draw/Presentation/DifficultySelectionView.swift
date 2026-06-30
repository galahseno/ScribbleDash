//
//  DifficultySelectionView.swift
//  ScribbleDash
//
//  Created by Ismael Cordón Domínguez on 24/6/26.
//

import SwiftUI

struct DifficultySelectionView: View {
    @State private var selectedDifficulty: Difficulty? = nil
    let gameMode: GameMode
    
    var body: some View {
        VStack {
            Text("Start drawing!")
                .typography(.headlineLarge)
                .foregroundStyle(.onBackground)
            
            Text("Choose a difficulty setting")
                .typography(.bodyMedium)
                .foregroundStyle(.onBackground)
            
            HStack {
                ForEach(Difficulty.allCases, id: \.self) { difficulty in
                    DifficultyOptionView(
                        difficulty: difficulty,
                        onClick: {
                            selectedDifficulty = difficulty
                        }
                    )
                    .offset(y: difficulty.yOffset)
                }
            }
            .padding(.top, 60)
            .navigationDestination(item: $selectedDifficulty) { difficulty in
                DrawView(difficulty: difficulty)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(.horizontal, 24)
        .padding(.top, 16)
        .background(Color.background)
        .toolbar(.hidden, for: .tabBar)
        .toolbarColorScheme(.light, for: .navigationBar)
    }
}

#Preview {
    DifficultySelectionView(
        gameMode: GameMode.oneRoundWonder
    )
}
