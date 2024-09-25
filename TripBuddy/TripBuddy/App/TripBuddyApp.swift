//
//  TripBuddyApp.swift
//  TripBuddy
//
//  Created by 김동경 on 9/24/24.
//

import SwiftUI

@main
struct TripBuddyApp: App {
    
    @State private var authviewModel: AuthViewModel = .init()
    var body: some Scene {
        WindowGroup {
            AuthCheckView()
                .environmentObject(authviewModel)
        }
    }
}
