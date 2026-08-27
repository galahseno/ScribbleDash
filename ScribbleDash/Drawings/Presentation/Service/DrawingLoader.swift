//
//  DrawingLoader.swift
//  ScribbleDash
//
//  Created by Galah Seno on 24/8/26.
//

import Observation
import OSLog

private let logger = Logger(subsystem: "com.icdgh.scribbledash", category: "DrawingLoader")

enum DrawingLoadState {
    case idle
    case loading
    case loaded
    case failed(Error)
}

@Observable
@MainActor
final class DrawingLoader {
    static let shared = DrawingLoader()

    private(set) var state: DrawingLoadState = .idle
    private(set) var drawings: [ReferenceDrawing] = []

    private let repository: DrawingRepository
    private var loadTask: Task<Void, Never>?

    private init(repository: DrawingRepository? = nil) {
        self.repository = repository ?? BundleSVGDrawingRepository()
    }

    func loadIfNeeded() async {
        if case .loaded = state { return }
        if let loadTask {
            await loadTask.value
            return
        }

        let repository = repository
        state = .loading
        let task = Task<Void, Never> { [weak self] in
            do {
                let drawings = try await Task.detached {
                    try await repository.loadAll()
                }.value
                await MainActor.run {
                    self?.drawings = drawings
                    self?.state = .loaded
                }
            } catch {
                logger.error("Failed to load drawings: \(String(describing: error))")
                await MainActor.run {
                    self?.state = .failed(error)
                }
            }
        }
        loadTask = task
        await task.value
        loadTask = nil
    }
}
