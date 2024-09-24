//
//  FilterView.swift
//  TripBuddy
//
//  Created by 김동경 on 9/24/24.
//

import SwiftUI

enum SwipeDirection {
    case up
    case down
    case none
}

struct FilterView: View {
    
    @State private var date: Date = Date()
    @State private var query: String = ""
    @State private var cities: [String] = ["서울", "가평/양평", "강릉", "속초", "양양", "대전", "대구", "부산", "경주", "전주", "통영", "여수", "제주", "기타"]
    @State private var ages: [String] = ["10대", "20대", "30대", "40대", "50대 이상"]
    @State private var selectedAges: [String] = []
    @State private var selcetedCities: [String] = []
    @State private var selectedPerson: Person?
    
    
    @State private var headerHeight: CGFloat = 0
    @State private var headerOffset: CGFloat = 0
    @State private var lastHeaderOffset: CGFloat = 0
    @State private var direction: SwipeDirection = .none
    @State private var shiftOffset: CGFloat = 0
    
    
    var body: some View {
        VStack {
            HStack {
                Text("Trip Buddy")
                    .bold()
                    .font(.title)
                Spacer()
                Button {
                    //TODO: 마이페이지로 넘기기
                } label: {
                    Image(systemName: "person.crop.circle")
                        .font(.title)
                        .tint(.secondary)
                }
                
            }
            SearchBar(text: $query)
                .animation(.easeInOut, value: query) // SearchBar의 애니메이션 적용
            Spacer()
                .frame(height: 10)
            ScrollView() {
                VStack(alignment: .leading) {
                    Text("도시")
                        .font(.title2)
                    
                    FlowLayout {
                        ForEach(cities, id: \.self) { city in
                            let selected = selcetedCities.contains(where: { $0 == city })
                            Button {
                                cityTapped(city)
                            } label: {
                                Text(city)
                                    .modifier(FilterTagModifier(selected: selected))
                            }
                        }
                    }
                    
                    Spacer()
                        .frame(height: 30)
                    
                    Text("날짜")
                        .font(.title2)
                    
                    DatePicker(
                        "날짜",
                        selection: $date,
                        displayedComponents: [.date]
                    )
                    .tint(.basic)
                    .datePickerStyle(.graphical)
                    
                    
                    
                    Text("연령")
                        .font(.title2)
                    
                    FlowLayout {
                        ForEach(ages, id: \.self) { age in
                            let selected = selectedAges.contains(where: { $0 == age })
                            Button {
                                ageTapped(age)
                            } label: {
                                Text(age)
                                    .modifier(FilterTagModifier(selected: selected))
                            }
                        }
                    }
                    
                    Spacer()
                        .frame(height: 30)
                    
                    Text("성별")
                        .font(.title2)
                    
                    FlowLayout {
                        ForEach(Person.allCases, id:\.self) { person in
                            let selected = selectedPerson == person
                            Button {
                                selectedPerson = person
                            } label: {
                                Text(person.rawValue)
                                    .modifier(FilterTagModifier(selected: selected))
                            }
                        }
                    }
                    
                    
                }//VStack 끝
                
                
            }//스크롤뷰 끝
            
            Button {
                
            } label: {
                Text("적용하기")
                    .modifier(ButtonModifier(color: .basic, disabled: false))
            }
            
        }
        .padding(.horizontal)
    }
    
    
    
    
    
    
    private func cityTapped(_ city: String) {
        if selcetedCities.contains(where: { $0 == city }) {
            selcetedCities.removeAll(where: { $0 == city })
        } else {
            selcetedCities.append(city)
        }
    }
    
    private func ageTapped(_ age: String) {
        if selectedAges.contains(where: { $0 == age }) {
            selectedAges.removeAll(where: { $0 == age })
        } else {
            selectedAges.append(age)
        }
    }
}


struct FilterTagModifier: ViewModifier {
    let selected: Bool
    func body(content: Content) -> some View {
        content
            .padding(.horizontal, 14)
            .padding(.vertical, 6)
            .background(
                RoundedRectangle(cornerRadius: 18)
                    .fill(selected ? Color.basic : Color.white)
                    .overlay(
                        RoundedRectangle(cornerRadius: 18)
                            .stroke(selected ? Color.clear : Color.gray, lineWidth: 1)
                    )
            )
            .foregroundColor(selected ? Color.white : Color.black)
            .padding(.horizontal, 8)
            .padding(.vertical, 4)
    }
}

#Preview {
    NavigationStack {
        FilterView()
    }
}
