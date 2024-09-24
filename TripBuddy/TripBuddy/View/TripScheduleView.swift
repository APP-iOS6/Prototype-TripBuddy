//
//  TripSchedule.swift
//  TripBuddy
//
//  Created by 배문성 on 9/24/24.
//

import SwiftUI
    
struct TripScheduleView: View {
    var body: some View {
        
        HStack {
            Text("여행일정")
                .font(.headline)
                .padding(4)
            Spacer()
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
    }
}

#Preview {
    TripScheduleView()
}

