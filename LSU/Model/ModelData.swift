//
//  ModelData.swift
//  LSU
//
//  Created by 김성욱 on 2022/08/19.
//

import Foundation
import Combine

final class ModelData: ObservableObject {
    @Published var landmarks: [LandmarkModel] = load(bundleJsonFile: "landmarkData.json")
    var hikes: [HikeModel] = load(bundleJsonFile: "hikeData.json")
}

// MARK: - ErrorOfLoading

enum ErrorOfLoading: Error {
    case notFindFile
    case rejectOpen
    case failDeserialize
}

func loadWithThrows<T: Decodable>(bundleJsonFile filename: String) throws -> T {
    guard let fileURL = Bundle.main.url(forResource: filename, withExtension: nil) else { throw ErrorOfLoading.notFindFile
    }

    let data: Data
    do {
        data = try Data(contentsOf: fileURL)
    } catch {
        throw ErrorOfLoading.rejectOpen
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        throw ErrorOfLoading.failDeserialize
    }
}

func load<T: Decodable>(bundleJsonFile filename: String) -> T {
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil) else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }

    let data: Data
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
