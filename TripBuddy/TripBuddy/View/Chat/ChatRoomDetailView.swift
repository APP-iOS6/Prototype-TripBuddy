//
//  ChatRoomDetailView.swift
//  TripBuddy
//
//  Created by 김종혁 on 9/24/24.
//

import SwiftUI

struct ChatRoomDetailView: View {
    let chatRoom: ChatRoom
    
    var body: some View {
        VStack {
            Text("채팅방 이름: \(chatRoom.name)")
            Text("마지막 메시지: \(chatRoom.lastMessage)")
            Text("타임스탬프: \(chatRoom.timestamp)")
        }
        .navigationTitle(chatRoom.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

//#Preview {
//    ChatRoomDetailView(chatRoom: <#ChatRoom#>)
//}
