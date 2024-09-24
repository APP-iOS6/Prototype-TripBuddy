//
//  LoginView.swift
//  TripBuddy
//
//  Created by 김동경 on 9/24/24.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject private var authviewModel: AuthViewModel
    @State private var navigateToHome: Bool = false
    var body: some View {
        GeometryReader { proxy in
            ZStack {
                Image("background")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                
                // 다른 UI 요소들
                VStack(spacing: 16) {
                    Spacer()
                        .frame(maxHeight: proxy.size.height * 0.4)
                    
                    SocialLoginButton(
                        loginText: "구글 로그인",
                        loginLogo: Image(.google),
                        maxWidth: proxy.size.width * 0.9,
                        maxHeight: proxy.size.height * 0.07,
                        textColor: .black,
                        backgroundColor: .white) {
                            authviewModel.authState = .auth
                        }
                    
                    SocialLoginButton(
                        loginText: "카카오 로그인",
                        loginLogo: Image(.kakao),
                        maxWidth: proxy.size.width * 0.9,
                        maxHeight: proxy.size.height * 0.07,
                        textColor: .black,
                        backgroundColor: .kakaocolor) {
                            authviewModel.authState = .auth
                        }
                    
                    SocialLoginButton(
                        loginText: "애플 로그인",
                        loginLogo: Image(.apple),
                        maxWidth: proxy.size.width * 0.9,
                        maxHeight: proxy.size.height * 0.07,
                        textColor: .white,
                        backgroundColor: .black) {
                            authviewModel.authState = .auth
                        }
                    
                    Button {
                        authviewModel.authState = .auth
                    } label: {
                        Text("로그인 없이 둘러보기")
                            .foregroundColor(.white)
                            .underline()
                            .padding(.top, 10)
                    }
                    
                }
            }
            .navigationDestination(isPresented: $navigateToHome, destination: {
                MainTabBar()
            })
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        
    }
}

#Preview {
    LoginView()
        .environmentObject(AuthViewModel())
}
