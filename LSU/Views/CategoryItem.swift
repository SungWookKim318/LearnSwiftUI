//
//  CategoryItem.swift
//  LSU
//
//  Created by 김성욱 on 2022/08/22.
//

import SwiftUI

struct CategoryItem: View {
    var landmark: LandmarkModel
    var body: some View {
        VStack {
            landmark.image
                .resizable()
                .frame(width: 155, height: 155)
                .cornerRadius(5)
            Text(landmark.name)
                .font(.caption)
        }
        .padding(.leading, 15)
    }
}

struct CategoryItem_Previews: PreviewProvider {
    static var previews: some View {
        CategoryItem(landmark: ModelData().landmarks[0])
    }
}
