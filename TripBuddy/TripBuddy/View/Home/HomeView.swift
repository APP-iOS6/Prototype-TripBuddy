//
//  HomeView.swift
//  TripBuddy
//
//  Created by 김효정 on 9/24/24.
//

import SwiftUI

struct HomeView: View {
    @State private var navigateToDetail: Bool = false
    @State private var isShowingFilterView: Bool = false // 필터뷰 띄우기
    
    var body: some View {

            ScrollView {
                VStack(alignment: .leading) {
                    NavigationLink(destination: FilterView()) {
                        CustomButton()
                    }
                    .padding(.top, 5)
                    
                    Text("요시 님, 마음 맞는 동행과 \n여행의 첫걸음을 내딛어 보세요.")
                        .font(.custom("Pretendard-Bold", size: 20))
                        .padding(.top, 16)
                    
                    ScrollView(.horizontal) {
                        HStack {
                            NavigationLink(destination: HomeThemeListView()) {
                                Image(.hanokTravel)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 240, height: 300)
                                    .cornerRadius(20)
                                    .overlay {
                                        VStack(alignment: .leading, spacing: 8) {
                                            Spacer()
                                            
                                            Text("고즈넉한 여행")
                                                .font(.custom("Pretendard-Bold", size: 24))
                                                .foregroundStyle(.white)
                                            
                                            Text("가을을 품은 전통 가옥의 아름다움")
                                                .font(.custom("Pretendard-Bold", size: 14))
                                                .foregroundStyle(.white)
                                        }
                                        .padding(.leading, -30) // 글자들 왼쪽으로 붙게
                                        .padding(.bottom, 15)
                                    }
                            }
                            
                            Button {
                                // 관련 동행 리스트로 이동
                            } label: {
                                Image(.nightTravel)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 240, height: 300)
                                    .cornerRadius(20)
                                    .overlay {
                                        VStack(alignment: .leading, spacing: 8) {
                                            Spacer()
                                            
                                            Text("화려한 밤의 여행")
                                                .font(.custom("Pretendard-Bold", size: 24))
                                                .foregroundStyle(.white)
                                            
                                            Text("도시의 불빛이 반짝이는 야경의 매력")
                                                .font(.custom("Pretendard-Bold", size: 14))
                                                .foregroundStyle(.white)
                                        }
                                        .padding(.leading, -20) // 글자들 왼쪽으로 붙게
                                        .padding(.bottom, 15)
                                    }
                            }
                            
                            Button {
                                // 관련 동행 리스트로 이동
                            } label: {
                                Image(.oceanTravel)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 240, height: 300)
                                    .cornerRadius(20)
                                    .overlay {
                                        VStack(alignment: .leading, spacing: 8) {
                                            Spacer()
                                            
                                            Text("끝없이 펼쳐진 바다")
                                                .font(.custom("Pretendard-Bold", size: 24))
                                                .foregroundStyle(.white)
                                            
                                            Text("바다와 하늘이 맞닿은 수평선의 매력")
                                                .font(.custom("Pretendard-Bold", size: 14))
                                                .foregroundStyle(.white)
                                        }
                                        .padding(.leading, -20) // 글자들 왼쪽으로 붙게
                                        .padding(.bottom, 15)
                                    }
                            }
                        }
                        .padding(.bottom, 10) // 스크롤 UI 안 겹치게
                    }
                    .padding(.bottom, 16)
                    
                    Text("발길을 사로잡는 곳")
                        .font(.custom("Pretendard-Bold", size: 20))
                        .padding(.bottom, 1)
                    
                    Text("지금 가장 인기 있는 여행지만 모았어요")
                        .font(.custom("Pretendard-Medium", size: 14))
                        .foregroundStyle(.gray)
                    
                    ScrollView(.horizontal) {
                        HStack {
                            NavigationLink(destination: HomeFeaturedListView()) {
                                // 관련 동행 리스트로 이동
                                Image(.jeju)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 148, height: 90)
                                    .cornerRadius(16)
                                    .overlay {
                                        VStack {
                                            Spacer()
                                            
                                            HStack {
                                                Text("제주")
                                                    .font(.custom("Pretendard-Bold", size: 18))
                                                    .foregroundStyle(.white)
                                                
                                                Spacer()
                                            }
                                            .padding(.leading, 10)
                                        }
                                        .padding(.bottom, 10)
                                    }
                            }
                            
                            Button {
                                // 관련 동행 리스트로 이동
                            } label: {
                                Image(.yangyang)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 148, height: 90)
                                    .cornerRadius(16)
                                    .overlay {
                                        VStack {
                                            Spacer()
                                            
                                            HStack {
                                                Text("양양")
                                                    .font(.custom("Pretendard-Bold", size: 18))
                                                    .foregroundStyle(.white)
                                                
                                                Spacer()
                                            }
                                            .padding(.leading, 10)
                                        }
                                        .padding(.bottom, 10)
                                    }
                            }
                            
                            Button {
                                // 관련 동행 리스트로 이동
                            } label: {
                                Image(.daejeon)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 148, height: 90)
                                    .cornerRadius(16)
                                    .overlay {
                                        VStack {
                                            Spacer()
                                            
                                            HStack {
                                                Text("대전")
                                                    .font(.custom("Pretendard-Bold", size: 18))
                                                    .foregroundStyle(.white)
                                                
                                                Spacer()
                                            }
                                            .padding(.leading, 10)
                                        }
                                        .padding(.bottom, 10)
                                    }
                            }
                        }
                        .padding(.bottom, 10) // 스크롤 UI 안 겹치게
                    }
                    .padding(.bottom, 16)
                    
                    Text("함께하는 여정")
                        .font(.custom("Pretendard-Bold", size: 20))
                        .padding(.bottom, 1)
                    
                    Text("여행을 함께할 동행자를 찾고 있어요")
                        .font(.custom("Pretendard-Medium", size: 14))
                        .foregroundStyle(.gray)
                    
                    VStack(spacing: 16) {
                        travelPostButton(
                            title: "부산 여행 같이 가실 분 ~",
                            content: """
                                        안녕하세요
                                        부산 돼지 국밥 먹으러 가실 분 구해요~
                                        해운대도 같이 가서 바다 봐요
                                        현재 여자1, 남자1분 있습니다
                                        편하게 연락 주세요~
                                        """,
                            dateRange: "9. 24 ~ 09. 27",
                            tags: ["30대", "여성"]
                        ) {
                            navigateToDetail.toggle()
                        }
                        
                        travelPostButton(
                            title: "강원도 양양 서핑 동행 모집!",
                            content: """
                                        안녕하세여 👋
                                        이번 주말 양양에서 서핑 같이 하실 분 구해요~
                                        서핑 초보자도 환영합니다! 함께 즐거운 시간 보내요
                                        """,
                            dateRange: "9. 30 ~ 10. 02",
                            tags: ["30대", "성별 무관"]
                        ) {
                            navigateToDetail.toggle()
                        }
                        
                        travelPostButton(
                            title: "가을 단풍 🍁 구경하러 설악산 가실 분!",
                            content: """
                                        안녕하세요~
                                        가을 단풍이 예쁘게 물든 설악산에 같이 갈 분 구해요!
                                        등산보다는 가볍게 구경하고 올 예정입니다~
                                        """,
                            dateRange: "10. 10 ~ 10. 11",
                            tags: ["30대", "남성"]
                        ) {
                            navigateToDetail.toggle()
                        }
                    }
                    
                }
                .padding(.horizontal, 16) // 좌우 여백 추가
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        Text("Trip Buddy")
                            .font(.custom("YClover-Bold", size: 20))
                    }
                    
                    ToolbarItem(placement: .topBarTrailing) {
                        NavigationLink(destination: MyPageView(viewModel: UserProfileViewModel())) {
                            Image(systemName: "person.circle")
                                .font(.title2)
                        }
                    }
                }
                .navigationDestination(isPresented: $navigateToDetail, destination: {
                    DetailView()
                })
                .tint(.gray) // 네비게이션 아이템 색상 회색 설정
            }
        }
    }


#Preview {
    NavigationStack {
        HomeView()
    }
}
