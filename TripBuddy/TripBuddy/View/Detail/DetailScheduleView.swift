//
//  DetailScheduleView.swift
//  TripBuddy
//
//  Created by 김동경 on 9/25/24.
//

import SwiftUI
import MapKit
struct DetailScheduleView: View {
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        GeometryReader { proxy in
            ScrollView {
                VStack(alignment: .leading) {
                    HStack(alignment: .top) {
                        VStack(alignment: .leading, spacing: 8) {
                            Label("09.24 ~ 09.27", systemImage: "calendar")
                            
                            Label("부산 해운대", systemImage: "map")
                        }
                        
                        Spacer()
                        
                        Button {
                            //TODO: 일정 추가하기
                        } label: {
                            Label("일정 추가", systemImage: "plus")
                        }
                        .buttonStyle(.borderedProminent)
                    }
                    .font(.custom("Pretendard-regular", size: 16))
                    
                    Spacer()
                        .frame(height: 30)
                    
                    //Day 1
                    Text("Day 1")
                        .font(.custom("Pretendard-Bold", size: 23))
                        .padding(.bottom, 2)
                    
                    Text("- 부산 해운대 가서 돼지국밥 때리기\n- 바다 구경")
                        .font(.custom("Pretendard-regular", size: 16))
                    
                    MapView(title: "해운대 오복돼지국밥", coordinate: CLLocationCoordinate2D(latitude: 35.159328, longitude: 129.160384))
                        .frame(height: proxy.size.height * 0.25)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                    
                    Spacer()
                        .frame(height: 30)
                    
                    
                    Text("Day 2")
                        .font(.custom("Pretendard-Bold", size: 23))
                        .padding(.bottom, 2)
                    
                    Text("- 지스타 가서 게임 즐기기\n- 회에 소주 한잔")
                        .font(.custom("Pretendard-regular", size: 16))
                    
                    MapView(title: "부산 지스타", coordinate: CLLocationCoordinate2D(latitude: 35.169030, longitude: 129.136030))
                        .frame(height: proxy.size.height * 0.25)
                        .clipShape(RoundedRectangle(cornerRadius: 12))

                    Spacer()
                        .frame(height: 30)
                    
                    Text("Day 3")
                        .font(.custom("Pretendard-Bold", size: 23))
                        .padding(.bottom, 2)
                    
                    Text("- 자갈치 시장 구경\n- 회에 소주 한잔")
                        .font(.custom("Pretendard-regular", size: 16))
                    
                    MapView(title: "자갈치 시장", coordinate: CLLocationCoordinate2D(latitude: 35.096894, longitude: 129.030550))
                        .frame(height: proxy.size.height * 0.25)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                        .padding(.trailing)

                }
                .padding()
            }
            .navigationBarBackButtonHidden()
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                       dismiss()
                    } label: {
                        Image(systemName: "chevron.left")
                            .font(.title2)
                            .tint(.basic)
                    }
                }
            }
            .navigationTitle("여행 일정")
        }
    }
}

#Preview {
    NavigationStack {
        DetailScheduleView()
    }
}
