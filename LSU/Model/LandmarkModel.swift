//
//  LandmarkModelData.swift
//  LSU
//
//  Created by 김성욱 on 2022/08/19.
//

import CoreLocation
import Foundation
import SwiftUI

public struct LandmarkModel: Hashable, Codable, Identifiable {
    // MARK: Public

    public struct Coordinates: Hashable, Codable {
        var latitude: Double
        var longitude: Double
    }

    public var id: Int

    public static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.id == rhs.id
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    // MARK: Internal

    enum Category: String, CaseIterable, Codable {
        case lakes = "Lakes"
        case rivers = "Rivers"
        case mountains = "Mountains"
    }

    var name: String
    var park: String
    var state: String
    var description: String
    var isFavorite: Bool
    var isFeatured: Bool
    var category: Category

    var image: Image {
        Image(imageName)
    }

    var locationCoordinate: CLLocationCoordinate2D {
        .init(latitude: coordinates.latitude, longitude: coordinates.longitude)
    }

    // MARK: Private

    private var imageName: String
    private var coordinates: Coordinates
}
