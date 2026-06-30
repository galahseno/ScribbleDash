//
//  DrawViewModel.swift
//  ScribbleDash
//
//  Created by Galah Seno on 29/6/26.
//

import Observation
import CoreGraphics

@Observable
@MainActor
final class DrawViewModel {
    private let maxRedoStackSize = 5

    private(set) var paths: [DrawingPath] = []
    private(set) var currentPoints: [CGPoint] = []
    private(set) var undone: [DrawingPath] = []

    var canUndo: Bool { !paths.isEmpty }
    var canRedo: Bool { !undone.isEmpty }
    var canClear: Bool { canUndo || canRedo }

    func appendPoint(_ point: CGPoint) {
        if currentPoints.isEmpty {
            undone.removeAll()
        }
        currentPoints.append(point)
    }

    func endStroke() {
        guard !currentPoints.isEmpty else { return }
        paths.append(DrawingPath(points: currentPoints))
        currentPoints = []
    }

    func undo() {
        guard let last = paths.popLast() else { return }
        undone.append(last)
        if undone.count > maxRedoStackSize {
            undone.removeFirst()
        }
    }

    func redo() {
        guard let next = undone.popLast() else { return }
        paths.append(next)
    }

    func clear() {
        paths.removeAll()
        undone.removeAll()
        currentPoints.removeAll()
    }
}
