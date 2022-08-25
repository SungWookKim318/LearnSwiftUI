//
//  ContentView.swift
//  LSUWatch WatchKit Extension
//
//  Created by 김성욱 on 2022/08/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        LandmarkList()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
