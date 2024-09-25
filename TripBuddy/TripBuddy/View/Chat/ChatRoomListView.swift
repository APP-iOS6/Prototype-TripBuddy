//
//  ChatRoom.swift
//  TripBuddy
//
//  Created by 김종혁 on 9/24/24.
//

import SwiftUI

struct ChatRoomListView: View {
    @Binding var filteredChatRooms: [ChatRoom]

    var body: some View {
        List {
            ForEach(filteredChatRooms) { chatRoom in
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
                                    .font(.custom("Pretendard-Light", size: 12))
                                    .foregroundColor(.gray)
                                
                                Text(chatRoom.tripName)
                                    .padding(.vertical, 5)
                                    .font(.custom("Pretendard-SemiBold", size: 16))
                                
                                Text("\(chatRoom.memberCount)")
                                    .font(.custom("Pretendard-Light", size: 12))
                                    .foregroundColor(.gray)
                                
                                Spacer()
                                
                                Text(chatRoom.timestamp)
                                    .font(.custom("Pretendard-Light", size: 11))
                                    .foregroundColor(.gray)
                            }
                            
                            HStack {
                                Text(chatRoom.lastMessage)
                                    .font(.custom("Pretendard-Light", size: 16))
                                    .foregroundColor(Color(.darkGray))
                                
                                Spacer()
                                
                                TagsView(text: chatRoom.chatCount, isBool: false)
                                    .font(.system(size: 11))
                            }
                        }
                    }
                    .padding(.vertical, 5)
                }
            }
            .onDelete(perform: deleteChatRoom)
        }
        .listStyle(.plain)
        .background(Color.white)
    }
    
    private func deleteChatRoom(at offsets: IndexSet) {
        filteredChatRooms.remove(atOffsets: offsets)
    }
}

#Preview {
    ChatRoomListView(filteredChatRooms: .constant(chatRooms))
}

struct TagsView: View {
    let text: String
    let isBool: Bool
    
    var body: some View {
        Text(text)
            .padding(.horizontal, 10)
            .padding(.vertical, 5)
            .background(isBool ? Color(.systemGray6) : .chatAlarm)
            .foregroundColor(isBool ? Color(.darkGray) : .white)
            .cornerRadius(15)
    }
}
