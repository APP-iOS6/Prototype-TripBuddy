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
                        .font(.title)
                }
            }
            .padding(.top)

            // Profile
            HStack {
                Image("profileImage")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .clipShape(Circle())
                
                VStack(alignment: .leading, spacing: 10) {
                    HStack {
                        Text("\(viewModel.nickname) 님")
                            .font(.title2)
                            .bold()
                        Text("@\(viewModel.instagramId)")
                            .font(.subheadline)
                            .foregroundStyle(.gray)
                    }
                    
                    HStack {
                        ProfileView(text: "20대")
                        ProfileView(text: viewModel.gender == 0 ? "남성" : "여성")
                        ProfileView(text: "경기도")
                    }
                }
            }
            
            // Buddy Temperature
            VStack(alignment: .leading) {
                Text("나의 버디 온도")
                    .font(.subheadline)
                ProgressView(value: viewModel.buddyTemperature, total: 100)
                    .accentColor(.green)
                Text("\(viewModel.buddyTemperature, specifier: "%.1f")")
                    .font(.caption)
            }
            
            // Introduction
            Text(viewModel.introduction.isEmpty ? "자기소개를 입력하고 나만의 동행자를 찾아보세요!" : viewModel.introduction)
                .font(.subheadline)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.gray.opacity(0.1))
                .cornerRadius(10)
            
            // Likes and Dislikes
            HStack(alignment: .top) {
                VStack(alignment: .leading) {
                    Text("좋아요")
                        .font(.subheadline)
                    HStack {
                        ForEach(["술", "도시", "대중교통"], id: \.self) { tag in
                            Text(tag)
                                .font(.caption)
                                .padding(.horizontal, 8)
                                .padding(.vertical, 4)
                                .background(Color.green.opacity(0.2))
                                .cornerRadius(12)
                        }
                    }
                }
                
                Spacer()
                
                VStack(alignment: .leading) {
                    Text("싫어요")
                        .font(.subheadline)
                    HStack {
                        ForEach(["공연", "휴양"], id: \.self) { tag in
                            Text(tag)
                                .font(.caption)
                                .padding(.horizontal, 8)
                                .padding(.vertical, 4)
                                .background(Color.red.opacity(0.2))
                                .cornerRadius(12)
                        }
                    }
                }
            }
            .padding()
            .background(Color.gray.opacity(0.1))
            .cornerRadius(12)
            
            Spacer()
        }
        .padding()
    }
}

struct ProfileView: View {
    let text: String
    
    var body: some View {
        Text(text)
            .padding(.horizontal, 10)
            .padding(.vertical, 5)
            .background(Color.gray.opacity(0.1))
            .foregroundColor(.black)
            .cornerRadius(15)
    }
}

#Preview {
    DetailMyPageView(viewModel: DetailMyPageViewModel())
}
