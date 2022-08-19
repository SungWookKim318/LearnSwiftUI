//
//  LandmarkModelData.swift
//  LSU
//
//  Created by 김성욱 on 2022/08/19.
//

import CoreLocation
import Foundation
import SwiftUI

public struct LandmarkModel: Hashable, Codable {
    // MARK: Public

    public struct Coordinates: Hashable, Codable {
        var latitude: Double
        var longitude: Double
    }

    public static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.id == rhs.id
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    // MARK: Internal

    var id: Int
    var name: String
    var park: String
    var state: String
    var description: String

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
