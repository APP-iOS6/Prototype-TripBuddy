//
//  ChatRoom.swift
//  TripBuddy
//
//  Created by 김종혁 on 9/24/24.
//

import Foundation
import SwiftUICore


struct ChatRoom: Identifiable {
    let id = UUID()
    var imageName: String
    var name: String
    var memberCount: Int
    var lastMessage: String
    var timestamp: String
    
    var image: Image {
        Image(imageName)
    }
}

let chatRooms: [ChatRoom] = [
    ChatRoom(imageName: "YOSHI", name: "해운대 드가자", memberCount: 4, lastMessage: "일단 렌트 해", timestamp: "now"),
    ChatRoom(imageName: "JokeBear",name: "효정님 생일파티", memberCount: 3, lastMessage: "저녁 먹었니?", timestamp: "8:15"),
    ChatRoom(imageName: "JokeBear",name: "바다 가보자고", memberCount: 4, lastMessage: "어디 해변 가?", timestamp: "6:00")
]
