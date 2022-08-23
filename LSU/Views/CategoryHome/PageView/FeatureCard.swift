//
//  FeatureCard.swift
//  LSU
//
//  Created by 김성욱 on 2022/08/23.
//

import SwiftUI

// MARK: - FeatureCard

struct FeatureCard: View {
    var landmark: LandmarkModel

    var body: some View {
        NavigationLink{
            LandmarkDetailView(landmark: landmark)
        } label: {
            landmark.featureImage?
                .resizable()
                .aspectRatio(3.0 / 2.0, contentMode: .fit)
                .overlay {
                    TextOverlay(landmark: landmark)
            }
        }
    }
}

// MARK: - TextOverlay

struct TextOverlay: View {
    var landmark: LandmarkModel

    var gradient: LinearGradient {
        .linearGradient(
            Gradient(colors: [.black.opacity(0.6), .black.opacity(0)]),
            startPoint: .bottom,
            endPoint: .center
        )
    }
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            gradient
            VStack(alignment: .leading) {
                Text(landmark.name)
                    .font(.title)
                    .bold()
                Text(landmark.park)
            }
            .padding()
        }
        .foregroundColor(.white)
    }
}

// MARK: - FeatureCard_Previews

struct FeatureCard_Previews: PreviewProvider {
    static var previews: some View {
        FeatureCard(landmark: ModelData().features[0])
    }
}
