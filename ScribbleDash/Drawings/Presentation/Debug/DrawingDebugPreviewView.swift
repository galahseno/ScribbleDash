//
//  DrawingDebugPreviewView.swift
//  ScribbleDash
//
//  Created by Galah Seno on 24/8/26.
//

import SwiftUI

struct DrawingDebugPreviewView: View {
    @State private var loader = DrawingLoader.shared
    @State private var index = 0

    var body: some View {
        VStack(spacing: 16) {
            switch loader.state {
            case .idle, .loading:
                ProgressView("Loading drawings…")

            case .failed(let error):
                VStack(spacing: 12) {
                    Text("Failed to load drawings").font(.headline)
                    Text(error.localizedDescription)
                        .font(.caption)
                        .foregroundStyle(.secondary)
                    Button("Retry") {
                        Task { await loader.loadIfNeeded() }
                    }
                }

            case .loaded where loader.drawings.isEmpty:
                Text("No drawings found").foregroundStyle(.secondary)

            case .loaded:
                let drawing = loader.drawings[index]

                Canvas { context, size in
                    let box = drawing.viewBox
                    let scale = min(size.width / box.width, size.height / box.height)
                    let dx = (size.width - box.width * scale) / 2
                    let dy = (size.height - box.height * scale) / 2

                    for segment in drawing.segments {
                        let scaled = segment.points.map {
                            CGPoint(x: ($0.x - box.minX) * scale + dx,
                                    y: ($0.y - box.minY) * scale + dy)
                        }
                        guard let first = scaled.first else { continue }
                        var path = Path()
                        path.move(to: first)
                        for p in scaled.dropFirst() { path.addLine(to: p) }
                        if segment.isClosed { path.closeSubpath() }
                        context.stroke(
                            path,
                            with: .color(.black),
                            style: StrokeStyle(lineWidth: 2, lineCap: .round, lineJoin: .round)
                        )
                    }
                }
                .aspectRatio(1, contentMode: .fit)
                .background(Color.white)
                .border(Color.gray)
                .padding()

                Text(drawing.name).font(.headline)
                Text("\(drawing.segments.count) segment(s), \(drawing.segments.reduce(0) { $0 + $1.points.count }) point(s)")
                    .font(.caption)
                    .foregroundStyle(.secondary)

                Stepper(
                    "Drawing \(index + 1) of \(loader.drawings.count)",
                    value: $index,
                    in: 0...(loader.drawings.count - 1)
                )
                .padding(.horizontal)

                Picker("Drawing", selection: $index) {
                    ForEach(Array(loader.drawings.enumerated()), id: \.offset) { offset, d in
                        Text(d.name).tag(offset)
                    }
                }
                .pickerStyle(.wheel)
            }
        }
        .padding()
        .task { await loader.loadIfNeeded() }
        .onChange(of: loader.drawings.count) { _, newCount in
            if index >= newCount { index = max(0, newCount - 1) }
        }
    }
}

#Preview {
    DrawingDebugPreviewView()
}
