//
//  AuthCheckView.swift
//  TripBuddy
//
//  Created by 김동경 on 9/24/24.
//

import SwiftUI

struct AuthCheckView: View {
    
    @EnvironmentObject private var authViewModel: AuthViewModel
    
    var body: some View {
        VStack {
            switch authViewModel.authState {
            case .unauth:
                LoginView()
                    .transition(.opacity)
            case .auth:
                MainTabBar()
                    .transition(.opacity)
            }
        }
        .animation(.smooth, value: authViewModel.authState)
    }
}

#Preview {
    AuthCheckView()
        .environmentObject(AuthViewModel())
}



enum AuthState {
    case unauth
    case auth
}

class AuthViewModel: ObservableObject {
    @Published var authState: AuthState = .unauth
}
