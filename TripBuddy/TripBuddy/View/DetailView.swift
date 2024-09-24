//
//  Untitled.swift
//  TripBuddy
//
//  Created by 배문성 on 9/24/24.
//

import SwiftUI

struct DetailView:View {
    var body: some View {
        ScrollView {
            VStack {
                Image("Busan1") //상단이미지
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                //여행정보
                VStack(alignment: .leading, spacing: 15) {
                    HStack {
                        Image(systemName: "person.circle") //프로필 이미지
                            .resizable()
                            .frame(width: 40, height: 40)
                        
                        VStack(alignment: .leading ) {
                            Text("사용자명") // 프로필 네임
                                .font(.headline)
                            Text("게시시간") // 게시시간
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                    }
                    
                    Text("게시글명")
                        .font(.title2)
                        .fontWeight(.bold)
                    
                    Text("본문")
                        .font(.body)
                        .padding(.top, 5)
                    
                    //여행일정
                    HStack {
                        Image(systemName: "calendar")
                        Text("여행일정")
                    }
                    .padding(.vertical, 5)
                    
                    //여행조건
                    VStack(alignment: .leading) {
                        Text("여행 조건")
                            .font(.headline)
                        
                        HStack {
                            Image(systemName: "person.2")
                            Text("성별,연령")
                        }
                        
                        HStack {
                            Image(systemName: "map")
                            Text("여행지")
                        }
                        
                        HStack {
                            Image(systemName: "creditcard")
                            Text("예산")
                        }
                    }
                    .padding(.top, 10)
                    
                    //참여중 동행자
                    VStack(alignment: .leading) {
                        Text("참여중 동행자")
                            .font(.headline)
                        
                        //동행중인 참여자 목록 예시
                        HStack {
                            ForEach(0..<3) { index in
                                Image(systemName: "person.circle.fill")
                                    .resizable()
                                    .frame(width: 40, height: 40)
                            }
                        }
                    }
                    .padding(.top, 10)
                    
                }
                .padding()
                
                Spacer()
                
                // 동행신청 버튼
                Button(action: {
                    print("완료")
                }) {
                    Text("동행 신청")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 300, height: 50)
                        .background(Color.green)
                        .cornerRadius(10)
                }
                .padding(.bottom, 30)
            }
            .navigationTitle("Detail View")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
#Preview {
    DetailView()
}
