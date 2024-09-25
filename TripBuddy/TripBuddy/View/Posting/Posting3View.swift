//
//  Posting3View.swift
//  TripBuddy
//
//  Created by 김동경 on 9/24/24.
//

import SwiftUI


enum Person: String, CaseIterable {
    case woman = "여성"
    case man = "남성"
    case none = "무관"
}

struct Posting3View: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @State private var tag: [String] = ["액티비티", "계획", "무계획", "관광", "핫플", "도시", "시골", "바다", "산", "조용", "휴양", "힐링", "운전 가능", "술", "수다"]
    @State private var age: [String] = ["무관", "10대","20대", "30대", "40대", "50대", "60대", "70대"]
    @EnvironmentObject private var viewModel: PostingViewModel
    
    @State private var showAllTags = false  // 더보기/접기 상태 관리
    
    var body: some View {
        GeometryReader { proxy in
            VStack(alignment: .leading) {
                
                HStack(alignment: .center) {
                    Text("인당 경비")
                        .font(.custom("Pretendard-medium", size: 17))
                    
                    Spacer()
                    
                    TextField("인당 경비", text: $viewModel.moneyText)
                        .keyboardType(.numberPad) // 숫자 키패드 표시
                        .onChange(of: viewModel.moneyText) { _, newValue in
                            // 숫자가 아닌 문자를 제거
                            let filtered = newValue.filter { "0123456789".contains($0) }
                            if filtered != newValue {
                                viewModel.moneyText = filtered
                            }
                        }
                        .modifier(TextFieldModifier(width: proxy.size.width * 0.4, height: proxy.size.height * 0.05))
                    
                    Text("원")
                        .font(.custom("Pretendard-regular", size: 17))
                }
                
                Spacer()
                    .frame(maxHeight: proxy.size.height * 0.06)
                
                Text("동행자 성별")
                    .font(.custom("Pretendard-medium", size: 17))
                
                Picker("성별", selection: $viewModel.selectedPerson) {
                    ForEach(Person.allCases, id: \.self) { person in
                        Text(person.rawValue).tag(person)
                    }
                }
                .pickerStyle(.segmented)
                
                Spacer()
                    .frame(maxHeight: proxy.size.height * 0.06)
                
                Text("동행자 나이대")
                    .font(.custom("Pretendard-medium", size: 17))
                
                FlowLayout {
                    ForEach(age, id: \.self) { age in
                        let selected = viewModel.selectedAge.contains(where: { $0 == age })
                        Button {
                            viewModel.ageTapped(age)
                        } label : {
                            Text(age)
                                .font(.custom("Pretendard-regular", size: 17))
                                .padding(.horizontal, 15)
                                .padding(.vertical, 6)
                                .background(selected ? .customgreen : Color(.systemGray6))
                                .foregroundColor(selected ? .white : Color(UIColor.darkGray))
                                .clipShape(RoundedRectangle(cornerRadius: 18))
                                .padding(.trailing, 10)
                                .padding(.bottom, 10)
                        }
                    }
                }
                
                Spacer()
                    .frame(maxHeight: proxy.size.height * 0.06)
                
                Text("여행 성향")
                    .font(.custom("Pretendard-medium", size: 17))
                
                // 성향 태그 (더보기/접기 로직 포함)
                FlowLayout {
                    let visibleTags = showAllTags ? tag : Array(tag.prefix(7)) // 시골까지 보이도록 제한
                    ForEach(visibleTags, id: \.self) { tag in
                        let selected = viewModel.selectedTag.contains(where: { $0 == tag })
                        Button {
                            viewModel.tagTapped(tag)
                        } label : {
                            Text(tag)
                                .font(.custom("Pretendard-regular", size: 17))
                                .padding(.horizontal, 15)
                                .padding(.vertical, 6)
                                .background(selected ? .customgreen : Color(.systemGray6))
                                .foregroundColor(selected ? .white : Color(UIColor.darkGray))
                                .clipShape(RoundedRectangle(cornerRadius: 18))
                                .padding(.trailing, 10)
                                .padding(.bottom, 10)
                        }
                    }
                    
                }
                
                // 더보기/접기 버튼
                Button {
                    withAnimation(nil) { // 애니메이션 없이 상태 변경
                        showAllTags.toggle()
                    }
                } label: {
                    Label(showAllTags ? "접기" : "더보기", systemImage: showAllTags ? "chevron.up" : "chevron.down")
                        .font(.custom("Pretendard-regular", size: 14))
                        .foregroundStyle(.basic)
                }
                .padding(.leading, 1)
                
                Spacer()
                    .frame(maxHeight: proxy.size.height * 0.06)
                
                Button {
                    dismiss()
                } label: {
                    Text("다음")
                        .modifier(ButtonModifier(color: .basic, disabled: viewModel.moneyText.isEmpty || viewModel.selectedTag.isEmpty || viewModel.selectedAge.isEmpty))
                }
                
                Spacer()
                    .frame(maxHeight: proxy.size.height * 0.02)
                
                Button {
                    dismiss()
                } label: {
                    Text("생략")
                        .modifier(ButtonModifier(color: .basic, disabled: false))
                }
            }
            .padding(.horizontal, proxy.size.width * 0.07)
        }
    }
}


#Preview {
    Posting3View()
        .environmentObject(PostingViewModel())
    
}
