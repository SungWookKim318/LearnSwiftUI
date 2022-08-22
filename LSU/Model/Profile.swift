//
//  Profile.swift
//  LSU
//
//  Created by 김성욱 on 2022/08/22.
//

import Foundation

struct Profile {
    var username: String
    var prefersNotifications = true
    var seasonalPhoto = Seanson.winter
    var goalDate = Date()
    
    static let `default` = Profile(username: "g_kumar")
    
    enum Seanson: String, CaseIterable, Identifiable {
        case spring = "🌷"
        case summer = "🌞"
        case autumn = "🍂"
        case winter = "☃️"
        
        var id: String { rawValue }
    }
}
