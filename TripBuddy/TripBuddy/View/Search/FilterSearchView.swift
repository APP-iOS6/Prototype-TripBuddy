//
//  FilterSearchView.swift
//  TripBuddy
//
//  Created by 김효정 on 9/25/24.
//

import SwiftUI

struct FilterSearchView: View {
    @EnvironmentObject private var viewModel: PostingViewModel
    @Environment(\.dismiss) private var dismiss
    
    @State private var navigaToDetail: Bool = false
    @State private var cities: [String] = ["안동", "경주", "서울"]
    @State private var selectedCities: [String] = []
    
    var body: some View {
        NavigationStack {
            VStack(spacing: -80) {
                ScrollView {
                    VStack(alignment: .leading, spacing: 16) {
                        FlowLayout {
                            ForEach(cities, id: \.self) { city in
                                let selected = selectedCities.contains(where: { $0 == city })
                                Button {
                                    cityTapped(city)
                                } label : {
                                    Text(city)
                                        .font(.custom("Pretendard-regular", size: 15))
                                        .padding(.horizontal, 15)
                                        .padding(.vertical, 6)
                                        .background(selected ? .customgreen : Color(.systemGray6))
                                        .foregroundColor(selected ? .white : Color(UIColor.darkGray))
                                        .clipShape(RoundedRectangle(cornerRadius: 18))
                                        .padding(.trailing, 10)
                                        .padding(.top, 10)
                                }
                            }
                        }
                        
                        // 도시 필터에 따라 관련된 버튼만 보여줌
                        if shouldShowPost(for: "안동") {
                            ForEach(posts.filter { post in
                                post.title.contains("안동") || post.content.contains("안동")
                            }) { post in
                                travelPostButton(post: post) {
                                    navigaToDetail.toggle()
                                }
                            }
                        }
                        
                        if shouldShowPost(for: "경주") {
                            ForEach(posts.filter { post in
                                post.title.contains("경주") || post.content.contains("경주")
                            }) { post in
                                travelPostButton(post: post) {
                                    navigaToDetail.toggle()
                                }
                            }
                        }

                        if shouldShowPost(for: "서울") {
                            ForEach(posts.filter { post in
                                post.title.contains("북촌") || post.content.contains("북촌")
                            }) { post in
                                travelPostButton(post: post) {
                                    navigaToDetail.toggle()
                                }
                            }
                        }
                    }
                    .padding(.horizontal, 16) // 좌우 여백 추가
                }
            }
            .navigationBarBackButtonHidden(true)
            .navigationDestination(isPresented: $navigaToDetail) {
                DetailView()
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
            .tint(.gray)
        }
    }
    
    // 선택된 도시에 따라 관련 포스트 버튼을 보여줄지 결정
    private func shouldShowPost(for city: String) -> Bool {
        return selectedCities.isEmpty || selectedCities.contains(city)
    }
    
    private func cityTapped(_ city: String) {
        if selectedCities.contains(where: { $0 == city }) {
            selectedCities.removeAll(where: { $0 == city })
        } else {
            selectedCities.append(city)
        }
    }
}

#Preview {
    FilterSearchView()
}
