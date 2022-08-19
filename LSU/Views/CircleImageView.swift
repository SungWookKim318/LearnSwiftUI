//
//  CircleImageView.swift
//  LSU
//
//  Created by 김성욱 on 2022/08/19.
//

import SwiftUI

struct CircleImageView: View {
    var circleImage: Image
    var body: some View {
        circleImage
            .clipShape(Circle())
            .overlay {
                Circle().stroke(.white, lineWidth: 4.0)
            }
            .shadow(radius: 7.0)
    }
}

struct CircleImageView_Previews: PreviewProvider {
    static var previews: some View {
        CircleImageView(circleImage: Image("turtlerock"))
    }
}
