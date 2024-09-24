//
//  SocialLoginBUtton.swift
//  TripBuddy
//
//  Created by 김동경 on 9/24/24.
//

import SwiftUI

struct SocialLoginButton: View {
    
    private var loginText: LocalizedStringKey
    private var loginLogo: Image
    private var maxWidth: CGFloat
    private var maxHeight: CGFloat
    private var textColor: Color
    private var backgroundColor: Color
    private var loginAction: () -> Void
    
    init(loginText: LocalizedStringKey,
         loginLogo: Image,
         maxWidth: CGFloat,
         maxHeight: CGFloat,
         textColor: Color,
         backgroundColor: Color,
         loginAction: @escaping () -> Void) {
        self.loginText = loginText
        self.loginLogo = loginLogo
        self.maxWidth = maxWidth
        self.maxHeight = maxHeight
        self.textColor = textColor
        self.backgroundColor = backgroundColor
        self.loginAction = loginAction
    }
    
    
    var body: some View {
        Button {
            loginAction()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundStyle(backgroundColor)
                    .frame(maxWidth: maxWidth,
                           maxHeight:maxHeight)
                
                // 텍스트는 중앙에 배치
                Text(loginText)
                    .foregroundStyle(textColor)
                    .font(.title2)
                    .frame(maxWidth: maxWidth, maxHeight: maxHeight, alignment: .center)
                    .padding()
                HStack {
                    loginLogo
                        .resizable()
                        .scaledToFit()
                        .frame(width: maxHeight * 0.7)
                        .padding(.horizontal, 12)
                    
                    Spacer()
                }
                .padding()
            }
            .frame(maxWidth: maxWidth,
                   maxHeight:maxHeight)
        }
    }
}
