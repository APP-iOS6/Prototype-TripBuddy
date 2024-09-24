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
                            TagsView(text: chatRoom.area, isBool: true)
                                .font(.system(size: 10))
                                .font(.subheadline)
                                .foregroundColor(.gray)
                            
                            Text(chatRoom.tripName)
                                .font(.headline)
                                .padding(.vertical, 5)
                            
                            Text("\(chatRoom.memberCount)")
                                .font(.system(size: 12))
                                .font(.subheadline)
                                .foregroundColor(.gray)
                            
                            Spacer()
                            
                            Text(chatRoom.timestamp)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                            
                            
                        }
                        HStack {
                            Text(chatRoom.lastMessage)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                            Spacer()
                            
                            TagsView(text: chatRoom.timestamp, isBool: false)
                                .font(.system(size: 10))
                        }
                    }
                }
                .padding(.vertical, 5)
            }
    
        }
        .listStyle(.plain)
        .background(Color.white)
    }
}

#Preview {
    ChatRoomListView(filteredChatRooms: chatRooms)
}


struct TagsView: View {
    let text: String
    let isBool: Bool
    
    var body: some View {
        Text(text)
            .padding(.horizontal, 10)
            .padding(.vertical, 5)
            .background(isBool ? Color.gray.opacity(0.1) : Color.red)
            .foregroundColor(isBool ? .black : .white)
            .cornerRadius(15)
    }
}

