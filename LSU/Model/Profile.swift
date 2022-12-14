//
//  Profile.swift
//  LSU
//
//  Created by κΉμ±μ± on 2022/08/22.
//

import Foundation

struct Profile {
    var username: String
    var prefersNotifications = true
    var seasonalPhoto = Seanson.winter
    var goalDate = Date()
    
    static let `default` = Profile(username: "g_kumar")
    
    enum Seanson: String, CaseIterable, Identifiable {
        case spring = "π·"
        case summer = "π"
        case autumn = "π"
        case winter = "βοΈ"
        
        var id: String { rawValue }
    }
}
