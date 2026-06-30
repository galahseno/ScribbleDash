//
//  Draw.View.swift
//  ScribbleDash
//
//  Created by Ismael Cordón Domínguez on 25/6/26.
//

import SwiftUI

struct DrawView: View {
    let difficulty: Difficulty

    @State private var viewModel = DrawViewModel()

    var body: some View {
        ZStack(alignment: .topTrailing) {
            AppGradients.backgroundGradient
                .ignoresSafeArea()

            VStack(spacing: 0) {
                Text("Time to draw!")
                    .typography(.displayMedium)
                    .foregroundStyle(.onBackground)
                    .padding(.bottom, 32)

                CanvasView(viewModel: viewModel)
                    .padding(.horizontal, 16)

                Spacer()

                bottomBar
                    .padding(.horizontal, 16)
                    .padding(.bottom, 16)
            }
        }
        .toolbarColorScheme(.light, for: .navigationBar)
    }

    private var bottomBar: some View {
        HStack(spacing: 16) {
            ControlButtonView(image: .reply, enabled: viewModel.canUndo) {
                viewModel.undo()
            }

            ControlButtonView(image: .forward, enabled: viewModel.canRedo) {
                viewModel.redo()
            }

            Spacer()

            AppButtonView(text: "CLEAR CANVAS", enabled: viewModel.canClear, fillColor: .success) {
                viewModel.clear()
            }
        }
    }
}

#Preview {
    DrawView(difficulty: .beginner)
}
