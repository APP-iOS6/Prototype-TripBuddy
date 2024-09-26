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
    
    // 제주 관련 포스트 데이터 필터링
    let jejuPosts: [TravelPost] = posts.filter { post in
        post.title.contains("제주") || post.content.contains("제주")
    }
    
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
                                    .font(.custom("Pretendard-Bold", size: 30))
                                    .foregroundStyle(.white)
                                
                                Spacer()
                            }
                            .padding(.leading, -170) // 글자들 왼쪽으로 붙게
                            .padding(.top, 40)
                        }
                    
                    ScrollView {
                        VStack(spacing: 16) {
                            // 제주 관련 포스트를 표시
                            ForEach(jejuPosts) { post in
                                travelPostButton(post: post) {
                                    navigaToDetail.toggle()
                                }
                            }
                        }
                        .padding(.horizontal, 16) // 좌우 여백 추가
                    }
                }
                .navigationDestination(isPresented: $navigaToDetail)  {
                    DetailView()
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
