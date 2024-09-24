//
//  Untitled.swift
//  TripBuddy
//
//  Created by 배문성 on 9/24/24.
//
import SwiftUI

struct DetailView: View {
    
    @State private var isTripScheduleActive = false

    var body: some View {
        NavigationStack {
            ZStack(alignment: .top) {
                Image("Busan1")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 300)
                    .ignoresSafeArea(edges: .top)
                
                    ScrollView {
                        VStack {

                            RoundedRectangle(cornerRadius: 30)
                                .fill(Color.white)
                                .frame(height: 0)
                                .id("contentStart")
                            
                            // 스크롤 뷰 내용 시작
                            VStack(alignment: .leading, spacing: 15) {
                                HStack {
                                    Image(systemName: "person.circle") // 프로필 이미지
                                        .resizable()
                                        .frame(width: 40, height: 40)
                                    
                                    VStack(alignment: .leading ) {
                                        Text("달달구리") // 프로필 네임
                                            .font(.headline)
                                        Text("24세 | 여성") // 성별
                                            .font(.subheadline)
                                            .foregroundColor(.gray)
                                    }
                                    Spacer()
                                }
                                .padding(.horizontal)
                                
                                Text("부산 여행 같이 가실 분 ~")
                                    .font(.title2)
                                    .fontWeight(.bold)
                                
                                Text("""
                                안녕하세요
                                부산 돼지 국밥 먹으러 같이 가실분 구해요~
                                해운대도 같이가서 바다봐요
                                현재 여성 1분, 남성 1분 있습니다.
                                편하게 연락 주세요~
                                """)
                                    .font(.body)
                                    .padding(.top, 5)
                                
                                // 여행일정
                                HStack {
                                    Text("여행일정")
                                        .font(.headline)
                                        .padding(4)
                                }
                                
                                ZStack {
                                    VStack(spacing: 10) {
                                        HStack (alignment: .center) {
                                            Image(systemName: "calendar")
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
                                    .padding()
                                    
                                    // 꺽쇠 기호 삽입
                                    HStack {
                                        Spacer()
                                        Button(action: {
                                            isTripScheduleActive = true
                                        }) {
                                            Image(systemName: "chevron.right")
                                                .foregroundStyle(.black)
                                                .padding()
                                        }
                                        .padding(.trailing)
                                    }
                                }
                                .frame(width: 380, height: 80)
                                .background(Color(red: 211/255, green: 211/255, blue: 211/255)) // 연한 회색
                                .cornerRadius(10)
                                .padding(.bottom)
                                .navigationDestination(isPresented: $isTripScheduleActive) {
                                    TripScheduleView()
                                }
                                
                                // 여행 조건
                                VStack(alignment: .leading) {
                                    Text("여행 조건")
                                        .font(.headline)
                                        .padding(4)
                                    
                                    HStack {
                                        Image(systemName: "person") // 아이콘 추후 변경
                                        Text("남녀무관, 20대")
                                            .padding(2)
                                    }
                                    
                                    HStack {
                                        Image(systemName: "smiley") // 아이콘 추후 변경
                                        Text("활발, 긍정, 텐션")
                                            .padding(2)
                                    }
                                    
                                    HStack {
                                        Image(systemName: "dollarsign") // 아이콘 추후 변경
                                        Text(" 인당 80,000원")
                                            .padding(2)
                                    }
                                }
                                .padding(.top, 10)
                                
                                // 참여 중 동행자
                                VStack(alignment: .leading) {
                                    Text("참여 중인 동행 3/4 ")
                                        .font(.headline)
                                    // 동행 중인 참여자 목록
                                    HStack {
                                        Spacer().frame(width: 15)
                                        ForEach(0..<3) { index in
                                            Image(systemName: "person.circle.fill") // 아이콘 추후 변경
                                                .resizable()
                                                .frame(width: 40, height: 40)
                                                .padding(.trailing, 2)
                                        }
                                        Spacer()
                                    }
                                    .frame(width: 380, height: 60)
                                    .background(Color(red: 211/255, green: 211/255, blue: 211/255)) // 연한 회색
                                    .cornerRadius(10)
                                    Spacer()
                                }
                                .padding(.top, 10)
                            }
                            .padding()
                            
                            Spacer()
                            
                            // 동행 신청 버튼
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
                            }
                            .padding(.bottom, 30)
                        }
                        .navigationTitle("") // 제목을 없앰
                        .navigationBarTitleDisplayMode(.inline)
                        .background(Color.white.cornerRadius(30))
                        .padding(.horizontal)
                    }
                    }
                }
            }


#Preview {
    DetailView()
}
