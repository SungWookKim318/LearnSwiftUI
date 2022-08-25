//
//  LandmarkDetailView.swift
//  LSUWatch WatchKit Extension
//
//  Created by 김성욱 on 2022/08/25.
//

import SwiftUI

struct LandmarkDetailView: View {
    @EnvironmentObject var modelData: ModelData
    var landmark: LandmarkModel
    
    var landmarkIndex: Int {
        modelData.landmarks.firstIndex { $0.id == landmark.id }!
    }
    
    var body: some View {
        
        ScrollView {
            VStack {
                CircleImageView(circleImage: landmark.image.resizable())
                    .scaledToFit()
                
                Text(landmark.name)
                    .font(.headline)
                    .lineLimit(0)
                
                Toggle(isOn: $modelData.landmarks[landmarkIndex].isFavorite) {
                    Text("Favorite")
                }
                
                Divider()
                
                Text(landmark.park)
                    .font(.caption)
                    .bold()
                    .lineLimit(0)
                
                Text(landmark.state)
                    .font(.caption)
                
                Divider()
                
                MapView(coordinate: landmark.locationCoordinate)
                    .scaledToFit()
            }
            .padding(16)
        }
        .navigationTitle("Landmarks")
    }
}

struct LandmarkDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let modelData = ModelData()
        return LandmarkDetailView(landmark: modelData.landmarks[0])
            .environmentObject(modelData)
    }
}
