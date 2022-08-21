//
//  LandmarkList.swift
//  LSU
//
//  Created by 김성욱 on 2022/08/19.
//

import SwiftUI

// MARK: - LandmarkList

struct LandmarkList: View {
    // MARK: Internal

    var filteredLandmarks: [LandmarkModel] {
        modelData.landmarks.filter { landmark in
            !showFavoritesOnly || landmark.isFavorite
        }
    }

    var body: some View {
        NavigationView {
            List {
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites only")
                }
                ForEach(filteredLandmarks) { landmark in
                    NavigationLink {
                        LandmarkDetailView(landmark: landmark)
                    } label: {
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
            .navigationTitle("Landmarks")
        }
    }

    // MARK: Private
    @EnvironmentObject var modelData: ModelData
    @State private var showFavoritesOnly = false
}

// MARK: - LandmarkList_Previews

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
    }
}
