//
//  Untitled.swift
//  TripBuddy
//
//  Created by 배문성 on 9/25/24.
//

import SwiftUI

class DetailMyPageViewModel: ObservableObject {
    @Published var nickname: String = "요시"
    @Published var introduction: String = ""
    @Published var instagramId: String = "eeeeg"
    @Published var birthdate: Date = Date()
    @Published var gender: Int = 0
    @Published var selectedTags: Set<String> = []
    @Published var buddyTemperature: Double = 35.4
}

struct DetailMyPageView: View {
    @ObservedObject var viewModel: DetailMyPageViewModel
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                Spacer()
                Button(action: {
                    dismiss()
                }) {
                    Image(systemName: "xmark")
                        .foregroundColor(.gray)
                        .font(.title2)
                }
            }
            .padding(.top)

            // Profile
            HStack {
                Image("profileImage")
                    .resizable()
                    .frame(width: 120, height: 120)
                    .clipShape(Circle())
                    .offset(x: 10, y: 0)
                    .padding(30)
                

                VStack(alignment: .leading, spacing: 20) {
                    HStack(alignment: .bottom) {
                        Text("\(viewModel.nickname) 님")
                            .font(.custom("Pretendard-Bold", size: 23))

                        Text("@\(viewModel.instagramId)")
                            .font(.custom("Pretendard-regular", size: 15))
                            .foregroundStyle(.gray)
                        Spacer()
                    }
                    
                    VStack(alignment: .leading) {
                        HStack {
                            TagView2(text: "20대")
                            TagView2(text: viewModel.gender == 0 ? "남성" : "여성")
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

                HStack(alignment: .bottom) {

                    Text("나의 버디 온도")
                        .font(.custom("Pretendard-regular", size: 15))
                    
                    Spacer()
                    

                    Text("\(viewModel.buddyTemperature, specifier: "%.1f")°C")
                        .font(.custom("Pretendard-regular", size: 13))
                        .foregroundStyle(.basic)
                }
                
                ProgressView(value: viewModel.buddyTemperature, total: 140)
                    .accentColor(.basic)

            }
            .padding(.top, -10)
                
            
            // Introduction
            Text(viewModel.introduction.isEmpty ? "자기소개를 입력하고 나만의 동행자를 찾아보세요!" : viewModel.introduction)
                .font(.custom("Pretendard-regular", size: 15))
                .foregroundStyle(viewModel.introduction.isEmpty ? .gray : .primary)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .padding(.top, -10)
            
            // Likes and Dislikes
            HStack(alignment: .top) {
                VStack(alignment: .leading) {
                    Text("좋아요")
                        .font(.custom("Pretendard-Medium", size: 16))
                    HStack {
                        ForEach(["술", "도시", "대중교통"], id: \.self) { tag in
                            Text(tag)
                                .font(.custom("Pretendard-regular", size: 14))
                                .padding(.horizontal, 8)
                                .padding(.vertical, 4)
                                .background(Color.green.opacity(0.2))
                                .cornerRadius(12)
                        }
                    }
                }
                
                Spacer()
                
                Rectangle()
                    .frame(width: 1, height: 50)
                    .foregroundColor(.gray)
                    .offset(x: -33)
                
                Spacer()
                
                VStack(alignment: .leading) {
                    Text("싫어요")
                        .font(.custom("Pretendard-Medium", size: 16))
                    HStack {
                        ForEach(["공연", "휴양"], id: \.self) { tag in
                            Text(tag)
                                .font(.custom("Pretendard-regular", size: 14))
                                .padding(.horizontal, 8)
                                .padding(.vertical, 4)
                                .background(Color.red.opacity(0.2))
                                .cornerRadius(12)
                        }
                    }
                }
                .offset(x: -73)
            }
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(12)
            .padding(.top, -10)
            
            Spacer()
        }
        .padding()
    }
}


struct ProfileView: View {
    let text: String
    
    var body: some View {
        Text(text)
            .font(.custom("Pretendard-regular", size: 14))
            .padding(.horizontal, 10)
            .padding(.vertical, 5)
            .background(Color(.systemGray6))
            .foregroundStyle(Color(.darkGray))
            .cornerRadius(15)
    }
}


#Preview {
    DetailMyPageView(viewModel: DetailMyPageViewModel())
}
