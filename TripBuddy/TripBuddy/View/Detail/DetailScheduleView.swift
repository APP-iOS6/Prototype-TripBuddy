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
                    
                    HStack {
                        VStack(alignment: .leading) {
                            Label("09.24 ~ 09.27", systemImage: "calendar")
                            Label("부산 해운대", systemImage: "map")
                           
                        }
                        Spacer()
                        Button {
                            //TODO: 일정 추가하기
                        } label: {
                            Label("일정 추가", systemImage: "plus")
                        }
                        .padding(.trailing)
                       
                    }
                    
                    Spacer()
                        .frame(height: 30)
                    
                    //Day 1
                    Text("Day1")
                        .bold()
                        .font(.title2)
                        .padding(.bottom, 2)
                    Text("부산 해운대 가서 돼지국밥 때리고\n바다 구경 할 예정")
                    MapView(title: "해운대 오복돼지국밥", coordinate: CLLocationCoordinate2D(latitude: 35.159328, longitude: 129.160384))
                        .frame(height: proxy.size.height * 0.25)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                        .padding(.trailing)
                    
                    Spacer()
                        .frame(height: 30)
                    
                    
                    Text("Day2")
                        .bold()
                        .padding(.bottom, 2)
                        .font(.title2)
                    Text("지스타 가서 게임 즐기기\n회에 소주 한잔")
                    MapView(title: "부산 지스타", coordinate: CLLocationCoordinate2D(latitude: 35.169030, longitude: 129.136030))
                        .frame(height: proxy.size.height * 0.25)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                        .padding(.trailing)

                    Spacer()
                        .frame(height: 30)
                    
                    
                    Text("Day3")
                        .bold()
                        .padding(.bottom, 2)
                        .font(.title2)
                    Text("자갈치 시장 구경\n회에 소주 한잔")
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
