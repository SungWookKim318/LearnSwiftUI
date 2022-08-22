//
//  ContentView.swift
//  LSU
//
//  Created by 김성욱 on 2022/08/19.
//

import SwiftUI

// MARK: - ContentView

struct ContentView: View {
    // MARK: Internal

    enum Tab {
        case featured
        case list
    }

    var body: some View {
        TabView(selection: $selection) {
            CategoryHome()
                .tabItem {
                    Label("Featured", systemImage: "star")
                }
                .tag(Tab.featured)

            LandmarkList()
                .tabItem {
                    Label("List", systemImage: "list.bullet")
                }
                .tag(Tab.list)
        }
    }

    // MARK: Private

    @State private var selection: Tab = .featured
}

// MARK: - ContentView_Previews

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
