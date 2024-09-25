//
//  MyPageView.swift
//  TripBuddy
//
//  Created by 이다영 on 9/24/24.
//

import SwiftUI

class UserProfileViewModel: ObservableObject {
    @Published var nickname: String = "요시"
    @Published var introduction: String = ""
    @Published var instagramId: String = "eeeeg"
    @Published var birthdate: Date = Date()
    @Published var gender: Int = 0
    @Published var selectedTags: Set<String> = []
    @Published var buddyTemperature: Double = 35.4
}

struct MyPageView: View {
    @ObservedObject var viewModel: UserProfileViewModel
    @State private var selectedTab = 0
    @State private var showingSettings = false
    @Namespace private var tabAnimation
    
    var body: some View {
        let genderOptions = ["남성", "여성", "기타"]
        
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                // 프로필
                HStack {
                    Image("profileImage")
                        .resizable()
                        .frame(width: 120, height: 120)
                        .clipShape(Circle())
                        .offset(x: 20, y: 0)
                    
                    Button(action: {
                        showingSettings = true
                    }) {
                        Image(systemName: "gearshape")
                            .foregroundColor(.white)
                            .padding(8)
                            .background(Color.gray)
                            .clipShape(Circle())
                    }
                    .offset(x: -20, y: 50)
                    
                    VStack(alignment: .leading, spacing: 20) {
                        HStack {
                            Text("\(viewModel.nickname) 님")
                                .font(.custom("Pretendard-Bold", size: 23))
                                .bold()
                            Text("@\(viewModel.instagramId)")
                                .font(.custom("Pretendard-regular", size: 13))
                                .foregroundStyle(.gray)
                            Spacer()
                        }
                        
                        VStack(alignment: .leading) {
                            HStack {
                                TagView2(text: "20대")
                                TagView2(text: genderOptions[viewModel.gender])
                            }
                            HStack {
                                TagView2(text: "경기도")
                                TagView2(text: "INTP")
                            }
                        }
                    }
                }
                
                // 버디온도
                VStack(alignment: .leading) {
                    Text("나의 버디 온도")
                        .font(.custom("Pretendard-regular", size: 15))
                    ProgressView(value: viewModel.buddyTemperature, total: 100)
                        .accentColor(.green)
                    Text("\(viewModel.buddyTemperature, specifier: "%.1f")")
                        .font(.custom("Pretendard-regular", size: 12))
                }
                
                // 자기소개
                Text(viewModel.introduction.isEmpty ? "자기소개를 입력하고 나만의 동행자를 찾아보세요!" : viewModel.introduction)
                    .font(.custom("Pretendard-regular", size: 15))
                    .padding()
                    .frame(maxWidth: .infinity)
                    .padding(.horizontal, 16)
                    .frame(minHeight: 60)
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(10)
                
                // 좋아요/싫어요
                HStack(alignment: .top) {
                    VStack(alignment: .leading) {
                        Text("좋아요")
                            .font(.custom("Pretendard-regular", size: 15))
                        HStack {
                            ForEach(["술", "도시", "대중교통"], id: \.self) { tag in
                                Text(tag)
                                    .font(.custom("Pretendard-regular", size: 12))
                                    .padding(.horizontal, 8)
                                    .padding(.vertical, 4)
                                    .background(Color.green.opacity(0.2))
                                    .cornerRadius(12)
                            }
                        }
                    }
                    
                    Spacer()
                    
                    Rectangle()
                        .frame(width: 1, height: 60)
                        .foregroundColor(.gray)
                        .offset(x: -26)
                    
                    Spacer()
                    
                    VStack(alignment: .leading) {
                        Text("싫어요")
                            .font(.custom("Pretendard-regular", size: 15))
                            .offset(x: -73)
                        HStack {
                            ForEach(["공연", "휴양"], id: \.self) { tag in
                                Text(tag)
                                    .font(.custom("Pretendard-regular", size: 12))
                                    .padding(.horizontal, 8)
                                    .padding(.vertical, 4)
                                    .background(Color.red.opacity(0.2))
                                    .cornerRadius(12)
                            }
                        }
                        .offset(x: -73)
                    }
                }
                .padding(15)
                .background(Color.gray.opacity(0.1))
                .cornerRadius(12)
                
                // 채팅룸
                let tabs = ["참여 중", "대기 중", "히스토리"]
                VStack(alignment: .leading, spacing: 30) {
                    // 탭 버튼
                    HStack {
                        ForEach(Array(tabs.enumerated()), id: \.element) { index, tab in
                            Spacer()
                            Button(action: {
                                selectedTab = index
                            }) {
                                VStack {
                                    Text(tabs[index])
                                        .foregroundColor(selectedTab == index ? .black : .gray)
                                        .frame(maxWidth: .infinity)
                                    
                                    if selectedTab == index {
                                        Rectangle()
                                            .fill(Color.black)
                                            .frame(width: 60, height: 2)
                                            .matchedGeometryEffect(id: "underline", in: tabAnimation)
                                    } else {
                                        Rectangle()
                                            .fill(Color.clear)
                                            .frame(width: 60, height: 2)
                                    }
                                }
                            }
                            Spacer()
                        }
                    }
                    .font(.custom("Pretendard-bold", size: 17))
                    
                    // 채팅방리스트
                    VStack(spacing: 15) {
                        ForEach(["부산 여행 갈사람~", "수원 행궁동 갈래요", "인천 여행 갈사람~"], id: \.self) { chat in
                            HStack {
                                VStack(alignment: .leading, spacing: 5) {
                                    Text(chat)
                                        .font(.custom("Pretendard-regular", size: 17))
                                    Text("9. 24 ~ 09. 27")
                                        .font(.custom("Pretendard-regular", size: 12))
                                        .foregroundColor(.gray)
                                }
                                Spacer()
                                Circle()
                                    .fill(Color.red)
                                    .frame(width: 10, height: 10)
                            }
                            .padding()
                            .background(Color.white)
                            .cornerRadius(10)
                            .shadow(color: .gray.opacity(0.2), radius: 5, x: 0, y: 2)
                        }
                    }
                }
                .padding(20)
                .padding(.bottom, 20)
                .background(Color.gray.opacity(0.1))
                .cornerRadius(12)
            }
            .padding()
        }
        .sheet(isPresented: $showingSettings) {
            MyPageSettingsView(viewModel: viewModel)
        }
    }
}

struct TagView2: View {
    let text: String
    
    var body: some View {
        Text(text)
            .font(.custom("Pretendard-regular", size: 13))
            .padding(.horizontal, 10)
            .padding(.vertical, 5)
            .background(Color.gray.opacity(0.1))
            .foregroundColor(.black)
            .cornerRadius(15)
    }
}

#Preview {
    MyPageView(viewModel: UserProfileViewModel())
}
