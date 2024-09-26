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
    @State private var query: String = ""
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading) {
                    HStack {
                        //홈뷰 서치바
                       SearchBar(text: $query)
                            .animation(.easeInOut, value: query) // SearchBar의 애니메이션 적용
                        
                        NavigationLink(destination: FilterView()) {
                            Image(systemName: "slider.horizontal.3")
                                .font(.title2)
                                .tint(.gray)
                        }
                    }
                    .tint(.basic)
                    .padding(.top, 5)
                    
                    if query.isEmpty {
                        // 기본 화면 표시
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
                            ForEach(posts) { post in
                                travelPostButton(post: post) {
                                    navigateToDetail.toggle()
                                }
                            }
                        }
                        
                    } else {
                        // 검색어에 맞는 포스트만 표시
                        VStack(spacing: 16) {
                            ForEach(filteredPosts, id: \.id) { post in
                                travelPostButton(post: post) {
                                    navigateToDetail.toggle()
                                }
                            }
                        }
                    }
                    
                }
                .navigationDestination(isPresented: $navigateToDetail, destination: {
                    DetailView()
                })
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
                .tint(.gray) // 네비게이션 아이템 색상 회색 설정
            }
            //여기로 변경
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer() // 오른쪽 정렬을 위해 Spacer 사용
                    Button {
                        hideKeyboard()
                    } label: {
                        Image(systemName: "keyboard.chevron.compact.down")
                    }
                }
            }
        }
        // 검색어에 맞게 필터링된 포스트 배열
        var filteredPosts: [TravelPost] {
            if query.isEmpty {
                return posts
            } else {
                return posts.filter { post in
                    post.title.contains(query) || post.content.contains(query)
                }
            }
        }
    }
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}



#Preview {
    NavigationStack {
        HomeView()
    }
}
