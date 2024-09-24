//
//  ChatRoom.swift
//  TripBuddy
//
//  Created by 김종혁 on 9/24/24.
//

import SwiftUI

struct ChatRoomListView: View {
    var filteredChatRooms: [ChatRoom]

    var body: some View {
        List(filteredChatRooms) { chatRoom in
            NavigationLink(destination: ChatRoomDetailView(chatRoom: chatRoom)) {
                HStack {
                    chatRoom.image
                        .resizable()
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                        .overlay {
                            Circle().stroke(.gray, lineWidth: 0.1)
                        }
                        .padding(.trailing, 10)
                    
                    VStack(alignment: .leading) {
                        HStack {
                            Text(chatRoom.name)
                                .font(.headline)
                                .padding(.vertical, 5)
                            
                            Text("\(chatRoom.memberCount)")
                                .font(.system(size: 12))
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                        Text(chatRoom.lastMessage)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    
                    Spacer()
                    
                    Text(chatRoom.timestamp)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                .padding(.vertical, 5)
            }
        }
        .listStyle(.plain)
        .background(Color.white)
    }
}
