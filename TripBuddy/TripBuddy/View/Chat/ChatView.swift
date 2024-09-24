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
    
    var filteredChatRooms: [ChatRoom] {
        if searchText.isEmpty {
            return chatRooms
        } else {
            return chatRooms.filter { $0.name.contains(searchText) }
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

                SearchFieldView(query: $searchText)
                ChatRoomListView(filteredChatRooms: filteredChatRooms)
            }
            .navigationTitle("채팅")
        }
    }
}

#Preview {
    ChatView()
}
