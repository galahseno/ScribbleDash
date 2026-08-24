//
//  DrawingRepository.swift
//  ScribbleDash
//
//  Created by Galah Seno on 24/8/26.
//

nonisolated protocol DrawingRepository {
    func loadAll() async throws -> [ReferenceDrawing]
}
