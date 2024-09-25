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
    let name: String
    var imageName: String
    var tripName: String
    var memberCount: Int
    var lastMessage: String
    var timestamp: String
    
    var area: String
    var chatCount: String
    
    var image: Image {
        Image(imageName)
    }
}

let chatRooms: [ChatRoom] = [
    ChatRoom(name: "요시", imageName: "YOSHI", tripName: "해운대 드가자", memberCount: 4, lastMessage: "일단 렌트 해", timestamp: "now", area: "부산", chatCount: "5"),
    ChatRoom(name: "농담곰", imageName: "JokeBear",tripName: "효정님 생일파티", memberCount: 5, lastMessage: "저녁 먹었니?", timestamp: "8:15", area: "지구", chatCount: "100+"),
    ChatRoom(name: "동다르크", imageName: "JokeBear",tripName: "바다 가보자고", memberCount: 4, lastMessage: "어디 해변 가?", timestamp: "6:00", area: "제주", chatCount: "3")
]

let chatRooms2: [ChatRoom] = [
    ChatRoom(name: "요시", imageName: "YOSHI", tripName: "해운대 드가자", memberCount: 4, lastMessage: "일단 렌트 해", timestamp: "now", area: "부산", chatCount: "5"),
]
