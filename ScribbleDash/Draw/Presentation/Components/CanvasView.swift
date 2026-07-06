//
//  CanvasView.swift
//  ScribbleDash
//
//  Created by Galah Seno on 29/6/26.
//

import SwiftUI

/// Renders the drawing canvas with a 3×3 grid overlay.
///
/// **Layout:** Two-layer container — an outer white rounded card (corner radius 36, drop shadow)
/// wraps a 12pt-padded inner drawing area (corner radius 24, 1pt border). The `Canvas` view
/// fills the inner area and is clipped so strokes never bleed outside the rounded rect.
///
/// **Input pipeline:** `DragGesture.onChanged` feeds raw points to `viewModel.appendPoint(_:)`,
/// which accumulates them into `currentPoints`. `onEnded` calls `viewModel.endStroke()`, which
/// commits `currentPoints` as a new `DrawingPath` in `viewModel.paths` and resets the buffer.
struct CanvasView: View {
    @Bindable var viewModel: DrawViewModel

    private let strokeColor: Color = .onSurface
    private let backgroundColor: Color = .background
    private let strokeWidth: CGFloat = 8
    private let gridColor: Color = Color(.onSurfaceVar)

    var body: some View {
        Canvas { context, size in
            drawGrid(in: context, size: size)

            for path in viewModel.paths {
                stroke(points: path.points, in: context)
            }
            stroke(points: viewModel.currentPoints, in: context)
        }
        .aspectRatio(55.0 / 56.0, contentMode: .fit)
        .background(backgroundColor)
        .clipShape(RoundedRectangle(cornerRadius: 24))
        .overlay(
            RoundedRectangle(cornerRadius: 24)
                .stroke(gridColor, lineWidth: 1)
        )
        .overlay(
            Color.clear
                .contentShape(Rectangle())
                .gesture(
                    DragGesture(minimumDistance: 0)
                        .onChanged { value in
                            viewModel.appendPoint(value.location)
                        }
                        .onEnded { _ in
                            viewModel.endStroke()
                        }
                )
        )
        .padding(12)
        .background(
            RoundedRectangle(cornerRadius: 36)
                .fill(backgroundColor)
        )
        .shadow(color: Color(hexARGB: 0x1F726558), radius: 12, x: 0, y: 8)
    }

    /// Draws two vertical and two horizontal lines, dividing the canvas into a 3×3 grid.
    private func drawGrid(in context: GraphicsContext, size: CGSize) {
        var grid = Path()
        for slice in 1...2 {
            let x = size.width * CGFloat(slice) / 3
            grid.move(to: CGPoint(x: x, y: 0))
            grid.addLine(to: CGPoint(x: x, y: size.height))

            let y = size.height * CGFloat(slice) / 3
            grid.move(to: CGPoint(x: 0, y: y))
            grid.addLine(to: CGPoint(x: size.width, y: y))
        }
        context.stroke(grid, with: .color(gridColor), lineWidth: 1)
    }

    /// Renders a single stroke. A lone point (tap) becomes a filled dot; multiple points
    /// become a rounded-cap, rounded-join polyline at `strokeWidth`.
    private func stroke(points: [CGPoint], in context: GraphicsContext) {
        guard let first = points.first else { return }

        if points.count == 1 {
            let dot = CGRect(
                x: first.x - strokeWidth / 2,
                y: first.y - strokeWidth / 2,
                width: strokeWidth,
                height: strokeWidth
            )
            context.fill(Path(ellipseIn: dot), with: .color(strokeColor))
            return
        }

        var path = Path()
        path.move(to: first)
        for point in points.dropFirst() {
            path.addLine(to: point)
        }
        context.stroke(
            path,
            with: .color(strokeColor),
            style: StrokeStyle(lineWidth: strokeWidth, lineCap: .round, lineJoin: .round)
        )
    }
}

#Preview {
    CanvasView(viewModel: DrawViewModel())
        .padding()
}
