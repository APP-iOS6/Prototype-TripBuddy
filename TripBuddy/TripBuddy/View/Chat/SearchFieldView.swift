//
//  SearchFieldView.swift
//  TripBuddy
//
//  Created by 김종혁 on 9/24/24.

import SwiftUI

struct SearchFieldView: View {
    @Binding var query: String
    @FocusState private var isFocused: Bool // 텍스트 필드 포커스 상태

    var body: some View {
        HStack {
            ZStack(alignment: .leading) {
                TextField("채팅방 검색", text: $query)
                    .padding(10)
                    .padding(.leading, 30) 
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                    .focused($isFocused) // 텍스트 필드에 포커스 상태 연결
                
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
                    .padding(.leading, 8)
            }
            
            if isFocused {
                Button(action: {
                    query = ""
                    isFocused = false
                }) {
                    Text("Cancel")
                        .foregroundColor(.green)
                }
                .padding(.leading, 5)
            }
        }
        .padding(.top, 10)
        .padding(.leading, 20)
        .padding(.trailing, 20)
    }
}

#Preview {
    SearchFieldView(query: .constant(""))
}



