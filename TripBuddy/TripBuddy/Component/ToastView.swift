//
//  ToastView.swift
//  TripBuddy
//
//  Created by 김동경 on 9/25/24.
//

import SwiftUI

struct ToastView: View {
    
    var message: String
    var width: CGFloat = .infinity
    var oncancelTap: () -> Void
    
    
    var body: some View {
        HStack(alignment: .center, spacing: 12) {
  
            Text(message)
                .colorInvert()
                .font(.headline)
                .foregroundColor(.black)
                
                
            
            Spacer(minLength: 10)
            
            Button {
                oncancelTap()
            } label: {
                Image(systemName: "xmark")
                    .foregroundColor(.white)
            }
        }
        .padding()
        .frame(minWidth: 0, maxWidth: width)
        .background(Color.toast.opacity(0.85))
        .clipShape(RoundedRectangle(cornerRadius: 8))
        .padding(.horizontal, 16)
    }
}
