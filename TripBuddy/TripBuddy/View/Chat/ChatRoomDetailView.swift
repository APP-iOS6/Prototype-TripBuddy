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
    
    @Environment(\.presentationMode) var presentationMode // 뒤로 가기 버튼을 위해 추가
    
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
                            .cornerRadius(10)
                            .font(.system(size: 18))
                            .frame(height: 50)
                            .padding(.leading, 30)
                        
                        Button(action: sendMessage) {
                            Text("전송")
                                .font(.custom("Pretendard-Light", size: 20))
                                .frame(width: 65, height: 45)
                                .background(Color.orange)
                                .foregroundStyle(.white)
                                .cornerRadius(10)
                                .padding(.trailing, 20)
                        }
                        .disabled(newMessage.isEmpty) // 입력이 없으면 버튼 비활성화
                    }
                    
                    
                    
                }
                .navigationTitle(chatRoom.tripName)
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarBackButtonHidden(true)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button(action: {
                            presentationMode.wrappedValue.dismiss()
                        }) {
                            Image(systemName: "chevron.left")
                                .foregroundStyle(.tint)
                                .font(.title3)
                        }
                    }
                }
                
            }
            
            // 사이드바 추가
            ChatSideBar(isSidebarVisible: $isSidebarVisible)
                .animation(.easeInOut, value: isSidebarVisible) 
        }
        .gesture(
            // 화면을 터치했을 때 키보드를 내리는 제스처 추가
            TapGesture()
                .onEnded {
                    hideKeyboard()
                }
        )
    }
    
    // 키보드 숨기기
    private func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
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
                
                messageView(text: "프로젝트 힘내야해", isColor: true)
                    .font(.custom("Pretendard-Light", size: 17))
                messageView(text: "배고프다", isColor: true)
                    .font(.custom("Pretendard-Light", size: 17))
                messageView(text: messages, isColor: true)
                    .font(.custom("Pretendard-Light", size: 17))
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
                        messageView(text: message, isColor: false)
                            .font(.custom("Pretendard-Light", size: 17))
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
    let isColor: Bool
    
    var body: some View {
        Text(text)
            .padding(.horizontal, 10)
            .padding(.vertical, 5)
            .background(isColor ? Color.gray.opacity(0.2) : Color.green.opacity(0.7))
            .foregroundColor(isColor ? .black : .white)
            .cornerRadius(15)
    }
}

// 상단바 여행지 상세 정보 이동
struct TripNavigationView: View {
    var body: some View {
        NavigationLink(destination: DetailScheduleView()) {
            ZStack {
                Image("Busan") // 배경 이미지
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 120)
                    .cornerRadius(10)
                    .padding(10)
                
                HStack {
                    VStack(alignment: .leading, spacing: 10) {
                        HStack {
                            Text("경상북도")
                                .font(.custom("Pretendard-Bold", size: 24))
                                .foregroundColor(.white)
                                .padding(.leading, 10)
                            
                            Text("부산")
                                .font(.custom("Pretendard-Bold", size: 19))
                                .foregroundColor(.white)
                        }
                        Text("부산의 대한 설명")
                            .font(.custom("Pretendard-Medium", size: 16))
                            .foregroundColor(.white)
                            .padding(.leading, 10)
                        
                        Text("09.10 ~ 09.27")
                            .font(.custom("Pretendard-Light", size: 14))
                            .foregroundColor(.white)
                            .padding(.leading, 10)
                    }
                    .frame(width: 380, height: 120, alignment: .leading)
                    .background(Color.black.opacity(0.4))
                    .cornerRadius(10)
                    .padding(10)
                    
                }
                
            }
            .overlay(alignment: .trailing) {
                Image(systemName: "chevron.right")
                    .font(.system(size: 60))
                    .foregroundStyle(.white.opacity(0.5))
                    .padding()
            }
        }
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}


