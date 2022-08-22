//
//  HikeModel.swift
//  LSU
//
//  Created by 김성욱 on 2022/08/22.
//

import Foundation

struct HikeModel: Codable, Hashable, Identifiable {
    struct Observation: Codable, Hashable {
        var distanceFromStart: Double
        var elevation: Range<Double>
        var pace: Range<Double>
        var heartRate: Range<Double>
    }

    static var formatter = LengthFormatter()

    var id: Int
    var name: String
    var distance: Double
    var difficulty: Int
    var observations: [Observation]

    var distanceText: String {
        HikeModel.formatter
            .string(fromValue: distance, unit: .kilometer)
    }
}
