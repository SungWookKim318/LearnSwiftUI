//
//  NotificationView.swift
//  LSUWatch WatchKit Extension
//
//  Created by 김성욱 on 2022/08/25.
//

import SwiftUI

struct NotificationView: View {
    var title: String?
    var message: String?
    var landmark: LandmarkModel?
    
    var body: some View {
        VStack {
            if let landmark = landmark {
                CircleImageView(circleImage: landmark.image.resizable())
                    .scaledToFit()
            }
            
            Text(title ?? "Unknown Landmark")
                .font(.headline)
            
            Divider()
            
            Text(message ?? "You are within 5 miles of one of your favorite landmarks.")
                .font(.caption)
        }
        .lineLimit(0)
    }
}

struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationView()
        NotificationView(title: "Turtle Rock",
                         message: "You are within 5 miles of Turtle Rock.",
                         landmark: ModelData().landmarks[0])
    }
}
