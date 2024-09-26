//
//  ChatView.swift
//  TripBuddy
//
//  Created by 김종혁 on 9/24/24.
//

import SwiftUI

enum SideOfTheForce: String, CaseIterable {
    case join = "참여 중"
    case recruit = "내가 모집 중"
}

struct ChatView: View {
    @State private var selectedSide: SideOfTheForce = .join
    @State private var searchText = ""
    
    // 세그먼트 2개로 나눌려고 일단 2개로 선언;
    
    var filteredChatRooms: [ChatRoom] {
        if searchText.isEmpty {
            return chatRooms
        } else {
            return chatRooms.filter { $0.tripName.contains(searchText) }
        }
    }
    
    var filteredChatRooms2: [ChatRoom] {
        if searchText.isEmpty {
            return chatRooms2
        } else {
            return chatRooms2.filter { $0.tripName.contains(searchText) }
        }
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                Picker("Chat Change", selection: $selectedSide) {
                    ForEach(SideOfTheForce.allCases, id: \.self) { side in
                        Text(side.rawValue)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding(.horizontal, 20)
                
                SearchFieldView(query: $searchText)
                
                switch selectedSide {
                    case .join:
                        ChatRoomListView(filteredChatRooms: .constant(filteredChatRooms))
                    case .recruit:
                        ChatRoomListView(filteredChatRooms: .constant(filteredChatRooms2))
                }
            }
            .navigationTitle("채팅")
        }
    }
}

#Preview {
    ChatView()
}
