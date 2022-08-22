/*
See LICENSE folder for this sample’s licensing information.

Abstract:
A view showing the details for a hike.
*/

import SwiftUI

struct HikeDetail: View {
    let hike: HikeModel
    @State var dataToShow = \HikeModel.Observation.elevation

    var buttons = [
        ("Elevation", \HikeModel.Observation.elevation),
        ("Heart Rate", \HikeModel.Observation.heartRate),
        ("Pace", \HikeModel.Observation.pace)
    ]

    var body: some View {
        VStack {
            HikeGraph(hike: hike, path: dataToShow)
                .frame(height: 200)

            HStack(spacing: 25) {
                ForEach(buttons, id: \.0) { value in
                    Button {
                        dataToShow = value.1
                    } label: {
                        Text(value.0)
                            .font(.system(size: 15))
                            .foregroundColor(value.1 == dataToShow
                                ? .gray
                                : .accentColor)
                            .animation(nil)
                    }
                }
            }
        }
    }
}

struct HikeDetail_Previews: PreviewProvider {
    static var previews: some View {
        HikeDetail(hike: ModelData().hikes[0])
    }
}
