//
//  LSUApp.swift
//  LSU
//
//  Created by 김성욱 on 2022/08/19.
//

import SwiftUI

@main
struct LSUApp: App {
    @StateObject private var modelData = ModelData()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
