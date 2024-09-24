//
//  TripSchedule.swift
//  TripBuddy
//
//  Created by 배문성 on 9/24/24.
//

import SwiftUI
    
struct TripScheduleView: View {
    var body: some View {
        
        VStack {
            HStack(spacing: 10) {
                Text("여행일정")
                    .padding()
                    .font(.headline)
                    .padding(3)
                Spacer()
            }
            
            ZStack {
                VStack(spacing: 10) {
                    HStack(alignment: .center) {
                        Image(systemName: "calendar")
                        Text("24.09.24 ~ 24.09.27")
                            .padding(2)
                        Spacer()
                    }
                    
                    HStack(alignment: .center) {
                        Image(systemName: "location")
                        Text("부산 해운대")
                            .padding(2)
                        Spacer()
                    }
                }
                .padding()
                
                }
            }
        
            VStack(spacing: 20) { //간격 설정
                ForEach(0..<4) { index in
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Day \(index + 1)") // 동적 Day 표시
                                .font(.headline)
                            Text("부산 방문하기")
                        }
                        Spacer() //텍스트왼쪽정렬
                    }
                    .frame(width: 350, height: 80) // 프레임 설정
                    .padding(.leading, 10) // 왼쪽여백
                    .background(Color(red: 211/255, green: 211/255, blue: 211/255)) // 연한 회색
                    .cornerRadius(10) // 모서리 둥글게
                }
            }
            .padding(.bottom, 10) // Vstack의 아래쪽 여백
            Spacer()
    }
}
#Preview {
    TripScheduleView()
}
