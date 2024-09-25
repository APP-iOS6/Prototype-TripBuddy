//
//  ChatRoomDetailView.swift
//  TripBuddy
//
//  Created by 김종혁 on 9/24/24.
//

import SwiftUI

struct ChatRoomDetailView: View {
    let chatRoom: ChatRoom
    
    @State private var newMessage: String = ""
    @State private var messages: [String] = []
    @State private var isSidebarVisible: Bool = false // 사이드바 상태 관리
    
    var body: some View {
        ZStack {
            NavigationStack {
                VStack {
                    TripNavigationView()
                    
                    ScrollView {
                        HStack {
                            profileView(profileImg: chatRoom.image, name: chatRoom.name, messages: chatRoom.lastMessage)
                                .padding(.leading, 20)
                            Spacer()
                        }
                        HStack {
                            Spacer()
                            meView(profileImg: chatRoom.image, name: chatRoom.name, messages: messages)
                                .padding(.trailing, 10)
                        }
                    }
                    
                    Spacer()
                    
                    HStack {
                        TextField("메시지를 입력하세요...", text: $newMessage)
                            .padding(10)
                            .background(Color.gray.opacity(0.1))
                            .cornerRadius(0)
                            .font(.system(size: 18))
                            .frame(height: 50)
                        
                        Button(action: sendMessage) {
                            Text("전송")
                                .frame(width: 45, height: 45)
                                .background(Color.orange)
                                .foregroundStyle(.white)
                                .cornerRadius(10)
                                .padding(.horizontal)
                        }
                        .disabled(newMessage.isEmpty) // 입력이 없으면 버튼 비활성화
                    }
                    .padding(.horizontal)
                    
                }
                .navigationTitle(chatRoom.tripName)
                .navigationBarTitleDisplayMode(.inline)
                
            }
            
            // 사이드바 추가
            ChatSideBar(isSidebarVisible: $isSidebarVisible)
                .animation(.easeInOut, value: isSidebarVisible) // 애니메이션 추가
        }
        .gesture(
            // 사이드바를 여는 제스처 추가
            DragGesture()
                .onChanged { value in
                    if value.translation.width > 100 {
                        withAnimation {
                            isSidebarVisible = true
                        }
                    }
                }
        )
    }
    
    // 메시지 전송
    private func sendMessage() {
        if !newMessage.isEmpty {
            messages.append(newMessage)
            newMessage = ""
        }
    }
}

#Preview {
    ChatRoomDetailView(chatRoom: ChatRoom(name: "농담곰", imageName: "JokeBear", tripName: "부산", memberCount: 5, lastMessage: "저녁 먹었니?", timestamp: "8:15", area: "지구", chatCount: "100+"))
}

// 상대 프로필 채팅
struct profileView: View {
    let profileImg: Image
    let name: String
    let messages: String
    
    var body: some View {
        HStack(alignment: .top) {
            profileImg
                .resizable()
                .frame(width: 50, height: 50)
                .clipShape(Circle())
                .overlay {
                    Circle().stroke(.gray, lineWidth: 0.1)
                }
                .padding(.trailing, 10)
            
            VStack(alignment: .leading) {
                Text(name)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                
                messageView(text: "프로젝트 힘내야해")
                messageView(text: "배고프다")
                messageView(text: messages)
            }
        }
        .padding(.vertical, 10) // 전체 프로필 뷰에 수직 패딩 추가
    }
}

// 내 프로필 채팅
struct meView: View {
    let profileImg: Image
    let name: String
    let messages: [String] // 메시지를 배열로 받음
    
    var body: some View {
        let displayImg = (profileImg == Image("JokeBear")) ? Image("YOSHI") : Image("JokeBear")
        let displayName = (name == "요시") ? "농담곰" : "요시"
        
        HStack(alignment: .top) {
            VStack(alignment: .trailing) {
                Text(displayName)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                
                ForEach(messages, id: \.self) { message in
                    HStack {
                        Spacer()
                        messageView(text: message)
                    }
                }
            }
            
            displayImg
                .resizable()
                .frame(width: 50, height: 50)
                .clipShape(Circle())
                .overlay {
                    Circle().stroke(.gray, lineWidth: 0.1)
                }
                .padding(.leading, 10)
        }
    }
}

// 메세지 모양
struct messageView: View {
    let text: String
    
    var body: some View {
        Text(text)
            .padding(.horizontal, 10)
            .padding(.vertical, 5)
            .background(Color.gray.opacity(0.2))
            .foregroundColor(.black)
            .cornerRadius(15)
    }
}

// 상단바 여행지 상세 정보 이동
struct TripNavigationView: View {
    var body: some View {
        NavigationLink(destination: TripDetailView()) {
            ZStack {
                Image("Busan") // 배경 이미지
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 120)
                    .cornerRadius(10)
                    .padding(10)
                
                VStack(alignment: .leading, spacing: 10) {
                    HStack {
                        Text("경상북도")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.leading, 10)
                        
                        Text("부산")
                            .font(.title3)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                    }
                    Text("부산의 대한 설명")
                        .font(.subheadline)
                        .foregroundColor(.white)
                        .padding(.leading, 10)
                    
                    Text("09.10 ~ 09.27")
                        .font(.subheadline)
                        .foregroundColor(.white)
                        .padding(.leading, 10)
                }
                .frame(width: 380, height: 120, alignment: .leading)
                .background(Color.black.opacity(0.4))
                .cornerRadius(10)
                .padding(10)
            }
        }
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}

// 여행지 임시 뷰
struct TripDetailView: View {
    var body: some View {
        Text("여행지 상세 정보")
            .font(.largeTitle)
    }
}
