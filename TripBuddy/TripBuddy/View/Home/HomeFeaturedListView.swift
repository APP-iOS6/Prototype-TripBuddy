//
//  HomeFeaturedListView.swift
//  TripBuddy
//
//  Created by 김효정 on 9/24/24.
//

import SwiftUI

struct HomeFeaturedListView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var navigaToDetail: Bool = false
    var body: some View {
        ZStack {
            // 상단 이미지가 상단바까지 확장되도록 설정
            GeometryReader { geometry in
                VStack(spacing: -80) {
                    Image(.jeju)
                        .resizable()
                        .scaledToFill()
                        .frame(width: geometry.size.width, height: geometry.size.height / 3.5) // 이미지 높이를 조정
                        .clipped()
                        .ignoresSafeArea(edges: .top) // 상단바까지 이미지가 확장되도록 설정
                    
                        .overlay {
                            VStack(alignment: .leading, spacing: 8) {
                                Text("제주")
                                    .font(.custom("Pretendard-Bold", size: 40))
                                    .foregroundStyle(.white)
                                
                                Spacer()
                            }
                            .padding(.leading, -170) // 글자들 왼쪽으로 붙게
                            .padding(.top, 40)
                        }
                                            
                    ScrollView {
                        VStack(spacing: 16) {
                            
                            travelPostButton(
                                title: "스노클링 명소 다 찍어보실 분",
                                content: """
                                    안녕하세요 ~ ☺️ 스노클링을 워낙 좋아해서 많이 해봤는데
                                    이번에 제주도에 길게 있는 김에 명소들을 다 가보려고 합니다.
                                    어쩌구 저쩌구
                                    """,
                                dateRange: "9. 24 ~ 09. 27",
                                tags: ["20대", "남성"]
                            ) {
                                navigaToDetail.toggle()
                            }
                            
                            travelPostButton(
                                title: "플로깅 프로그램🪸 같이 체험해보실 분?",
                                content: """
                                    해양 쓰레기를 주우면서 바다를 정화하는 봉사 활동을 플로깅이라고 하는데요.
                                    이번에 제주도에서 플로깅 프로그램이 진행된다고 해서 같이 신청하실 분 구합니다.
                                    어쩌구 저쩌구
                                    """,
                                dateRange: "10. 01",
                                tags: ["30대", "여성"]
                            ) {
                                navigaToDetail.toggle()
                            }
                            
                            travelPostButton(
                                title: "플로깅 프로그램🪸 같이 체험해보실 분?",
                                content: """
                                    해양 쓰레기를 주우면서 바다를 정화하는 봉사 활동을 플로깅이라고 하는데요.
                                    이번에 제주도에서 플로깅 프로그램이 진행된다고 해서 같이 신청하실 분 구합니다.
                                    어쩌구 저쩌구
                                    """,
                                dateRange: "10. 01",
                                tags: ["30대", "여성"]
                            ) {
                                navigaToDetail.toggle()
                            }
                            
                            travelPostButton(
                                title: "제주 한달살기 하는 김에 같이 노실 분",
                                content: """
                                    안녕하세용 이번에 퇴사하고 힐링을 위해 제주 한달살기를 하려고 합니다.
                                    그김에 같이 노실 분 구해봐요.
                                    어쩌구 저쩌구
                                    """,
                                dateRange: "10. 02 ~ 10. 05",
                                tags: ["20대", "여성"]
                            ) {
                                navigaToDetail.toggle()
                            }
                            
                            travelPostButton(
                                title: "제주 한달살기 하는 김에 같이 노실 분",
                                content: """
                                    안녕하세용 이번에 퇴사하고 힐링을 위해 제주 한달살기를 하려고 합니다.
                                    그김에 같이 노실 분 구해봐요.
                                    어쩌구 저쩌구
                                    """,
                                dateRange: "10. 02 ~ 10. 05",
                                tags: ["20대", "여성"]
                            ) {
                                navigaToDetail.toggle()
                            }
                        }
                        .padding(.horizontal, 16) // 좌우 여백 추가
                    }
                }
                .navigationDestination(isPresented: $navigaToDetail, destination: {
                    DetailView()
                })
                .navigationBarBackButtonHidden(true)
            }
        }
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button {
                    dismiss() // 버튼을 누르면 이전 화면으로 이동
                } label: {
                    Image(systemName: "chevron.left") // 화살표 모양 아이콘
                        .font(.title2)
                }
            }
            
            ToolbarItem(placement: .topBarTrailing) {
                NavigationLink(destination: MyPageView(viewModel: UserProfileViewModel())) {
                    Image(systemName: "person.circle")
                        .font(.title2)
                }
            }
        }
        .tint(.white)
    }
}

#Preview {
    NavigationStack {
        HomeFeaturedListView()
    }
}
