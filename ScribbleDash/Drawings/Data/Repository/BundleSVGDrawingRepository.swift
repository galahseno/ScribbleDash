//
//  BundleSVGDrawingRepository.swift
//  ScribbleDash
//
//  Created by Galah Seno on 24/8/26.
//

import Foundation
import CoreGraphics
import PocketSVG

enum DrawingRepositoryError: Error {
    case noDrawingsFound
}

nonisolated struct BundleSVGDrawingRepository: DrawingRepository {
    func loadAll() async throws -> [ReferenceDrawing] {
        let urls = Bundle.main.urls(forResourcesWithExtension: "svg", subdirectory: nil) ?? []
        guard !urls.isEmpty else {
            throw DrawingRepositoryError.noDrawingsFound
        }
        return urls
            .sorted { $0.lastPathComponent < $1.lastPathComponent }
            .compactMap { parseDrawing(at: $0) }
    }

    private func parseDrawing(at url: URL) -> ReferenceDrawing? {
        let bezierPaths = SVGBezierPath.pathsFromSVG(at: url)
        guard !bezierPaths.isEmpty else {
            print("[DrawingLoader] \(url.lastPathComponent) produced zero shapes, skipping")
            return nil
        }

        let viewBox = bezierPaths.first(where: { $0.viewBox != .null })?.viewBox
            ?? SVGBoundingRectForPaths(bezierPaths)

        let segments = bezierPaths
            .flatMap { CGPathFlattener.segments(from: $0.cgPath) }
            .map { DrawingSegment(points: $0.points, isClosed: $0.isClosed) }

        let base = (url.lastPathComponent as NSString).deletingPathExtension
        let displayName = base.replacingOccurrences(of: "_", with: " ").capitalized
        return ReferenceDrawing(id: base, name: displayName, viewBox: viewBox, segments: segments)
    }
}
