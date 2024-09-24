//
//  HomeThemeListView.swift
//  TripBuddy
//
//  Created by 김효정 on 9/24/24.
//

import SwiftUI

struct HomeThemeListView: View {
    @Environment(\.dismiss) private var dismiss
    
    @State private var selectedTag: String? = nil
    
    var body: some View {
        ZStack {
            // 상단 이미지가 상단바까지 확장되도록 설정
            GeometryReader { geometry in
                VStack(spacing: -80) {
                    Image(.hanokTravel)
                        .resizable()
                        .scaledToFill()
                        .frame(width: geometry.size.width, height: geometry.size.height / 3) // 이미지 높이를 조정
                        .offset(y: -100)
                        .clipped()
                        .ignoresSafeArea(edges: .top) // 상단바까지 이미지가 확장되도록 설정
                    
                        .overlay {
                            VStack(alignment: .leading, spacing: 8) {
                                Text("고즈넉한 여행")
                                    .font(.custom("Pretendard-Bold", size: 30))
                                    .foregroundStyle(.white)
                                
                                Text("가을을 품은 전통 가옥의 아름다움")
                                    .font(.custom("Pretendard-Bold", size: 20))
                                    .foregroundStyle(.white)
                                
                                Spacer()
                            }
                            .padding(.leading, -100) // 글자들 왼쪽으로 붙게
                            .padding(.top, 40)
                        }
                                            
                    ScrollView {
                        VStack(spacing: 16) {
                            HStack() {
                                TagButton(text: "안동", size: 14) {
                                    selectedTag = "안동"
                                }
                                
                                TagButton(text: "경주", size: 14) {
                                    selectedTag = "경주"
                                }
                                
                                TagButton(text: "서울", size: 14) {
                                    selectedTag = "서울"
                                }
                                
                                Spacer()
                            }
                            
                            
                            travelPostButton(
                                title: "한옥에서 옥캉스 하실 분",
                                content: """
                                    요즘 옥캉스가 유행한다고 하던데
                                    안동 쪽에서 한옥 스테이 같이 하실 분 구합니다.
                                    어쩌구 저쩌구
                                    """,
                                dateRange: "9. 24 ~ 09. 27",
                                tags: ["20대", "남성"]
                            ) {
                                // 디테일 뷰 이동
                            }
                            
                            travelPostButton(
                                title: "경주에서 같이 한복 입고 사진 찍을 사람?",
                                content: """
                                    안녕하세용 🙂
                                    경주 황리단길에서 한복 체험 같이 하실 분 구해봐요!
                                    어쩌구 저쩌구
                                    """,
                                dateRange: "10. 01 ~ 10. 05",
                                tags: ["20대", "여성"]
                            ) {
                                // 디테일 뷰 이동
                            }
                            
                            travelPostButton(
                                title: "경주에서 같이 한복 입고 사진 찍을 사람?",
                                content: """
                                    안녕하세용 🙂
                                    경주 황리단길에서 한복 체험 같이 하실 분 구해봐요!
                                    어쩌구 저쩌구
                                    """,
                                dateRange: "10. 01 ~ 10. 05",
                                tags: ["20대", "여성"]
                            ) {
                                // 디테일 뷰 이동
                            }
                            
                            travelPostButton(
                                title: "북촌 한옥마을 가실 분!",
                                content: """
                                    북촌 한옥마을에서 같이 노실 분 있나요?
                                    락고재라고 괜찮은 곳이 있네요
                                    어쩌구 저쩌꾸
                                    """,
                                dateRange: "10. 20",
                                tags: ["20대", "성별 무관"]
                            ) {
                                // 디테일 뷰 이동
                            }
                            
                            travelPostButton(
                                title: "북촌 한옥마을 가실 분!",
                                content: """
                                    북촌 한옥마을에서 같이 노실 분 있나요?
                                    락고재라고 괜찮은 곳이 있네요
                                    어쩌구 저쩌꾸
                                    """,
                                dateRange: "10. 20",
                                tags: ["20대", "성별 무관"]
                            ) {
                                // 디테일 뷰 이동
                            }
                        }
                        .padding(.horizontal, 16) // 좌우 여백 추가
                    }
                }
                .navigationBarBackButtonHidden(true)
                
            }
        }
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button {
                    dismiss() // 버튼을 누르면 이전 화면으로 이동
                } label: {
                    Image(systemName: "chevron.left") // 화살표 모양 아이콘
                }
            }
            
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    // 마이페이지뷰 이동
                } label: {
                    Label("MyPage", systemImage: "person.circle")
                }
            }
        }
        .tint(.white)
    }
}

#Preview {
    NavigationStack {
        HomeThemeListView()
    }
}
