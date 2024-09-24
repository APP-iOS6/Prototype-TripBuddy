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
                VStack(alignment: .leading, spacing: 10) {
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
                        Spacer()
                    }
                    .padding(.horizontal)
                    
                    Text("게시글명")
                        .font(.title2)
                        .fontWeight(.bold)
                    
                    Text("본문")
                        .font(.body)
                        .padding(.top, 5)
                    
                    //여행일정
                    HStack {
                        Text("여행일정")
                            .font(.headline)
                            .padding(4)
                    }
                    
                    VStack(spacing: 10) {
                        HStack (alignment: .center) {
                            Image(systemName: "calendar") // 아이콘 추후변경
                            Text("24.09.24 ~ 24.09.27")
                                .padding(2)
                            Spacer()
                        }
                        
                        HStack (alignment: .center) {
                            Image(systemName: "location")
                            Text("부산 해운대")
                                .padding(2)
                            Spacer()
                        }
                        
                    }
                    .frame(width:340, height:60)
                    .padding()
                    .background(Color(red: 211/255, green: 211/255, blue: 211/255)) //연한회색
                    .cornerRadius(10)
                    
                    //여행조건
                    VStack(alignment: .leading) {
                        Text("여행 조건")
                            .font(.headline)
                            .padding(4)
                        
                        HStack {
                            Image(systemName: "person.2") // 아이콘 추후변경
                            Text("성별,연령")
                                .padding(2)
                        }
                        
                        HStack {
                            Image(systemName: "map") // 아이콘 추후변경
                            Text("여행지")
                                .padding(2)
                        }
                        
                        HStack {
                            Image(systemName: "creditcard") // 아이콘 추후변경
                            Text("예산")
                                .padding(2)
                        }
                    }
                    .padding(.top, 10)
                    
                    //참여중 동행자
                    VStack(alignment: .leading) {
                        Text("참여중 동행자")
                            .font(.headline)
                        
                        //동행중인 참여자 목록 예시
                        HStack {
                            Spacer().frame(width: 15)
                            ForEach(0..<3) { index in
                                Image(systemName: "person.circle.fill") // 아이콘 추후변경
                                    .resizable()
                                    .frame(width: 40, height: 40)
                                    .padding(.trailing, 2)
                                    
                            }
                            Spacer()
                        }
                        .frame(width: 380, height: 60)
                        .background(Color(red: 211/255, green: 211/255, blue: 211/255)) //연한회색
                        .cornerRadius(10)
                        Spacer()
                        
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
                        .frame(width: 360, height: 40)
                        .background(Color(red: 25/255, green: 191/255, blue: 132/255))
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
