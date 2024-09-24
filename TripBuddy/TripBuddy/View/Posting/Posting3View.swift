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
    
    
    @State private var tag: [String] = ["액티비티", "계획", "무계획", "관광","핫플", "자연", "FLEX", "도시", "시골", "바다", "산", "조용", "휴양", "힐링", "운전가능", "술", "수다"]
    @State private var age: [String] = ["무관", "10대"," 20대", "30대", "40대", "50대", "60대", "70대"]
    @EnvironmentObject private var viewModel: PostingViewModel
    
    
    var body: some View {
        GeometryReader { proxy in
            VStack(alignment: .leading) {
                
                HStack(alignment: .center) {
                    Text("인당 경비")
                        .font(.title2)
                    
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
                        .modifier(TextFieldModifier(width: proxy.size.width * 0.3))
                    
                    Text("원")
                }
                
                Spacer()
                    .frame(maxHeight: proxy.size.height * 0.06)
                
                Text("함께하고 싶은 성별")
                    .font(.title2)
                
                Picker("성별", selection: $viewModel.selectedPerson) {
                    ForEach(Person.allCases, id: \.self) { person in
                        Text(person.rawValue).tag(person)
                    }
                }
                .pickerStyle(.segmented)
                
                Spacer()
                    .frame(maxHeight: proxy.size.height * 0.06)
                
                Text("성향")
                    .font(.title2)
                
                FlowLayout {
                    ForEach(tag, id: \.self) { tag in
                        let selected = viewModel.selectedTag.contains(where: { $0 == tag })
                        Button {
                            viewModel.tagTapped(tag)
                        } label : {
                            Text(tag)
                                .padding(.horizontal, 10)
                                .padding(.vertical, 5)
                                .background(selected ? .customgreen : .customgray)
                                .foregroundColor(selected ? .white : .black)
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                                .padding(.horizontal, 6)
                                .padding(.vertical, 6)
                        }
                    }
                }
                
                
                Spacer()
                    .frame(maxHeight: proxy.size.height * 0.06)
                
                Text("함께하고 싶은 나이대")
                    .font(.title2)
                
                FlowLayout {
                    ForEach(age, id: \.self) { age in
                        let selected = viewModel.selectedAge.contains(where: { $0 == age })
                        Button {
                            viewModel.ageTapped(age)
                        } label : {
                            Text(age)
                                .padding(.horizontal, 10)
                                .padding(.vertical, 5)
                                .background(selected ? .customgreen : .customgray)
                                .foregroundColor(selected ? .white : .black)
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                                .padding(.horizontal, 6)
                                .padding(.vertical, 6)
                        }
                    }
                }
                
                Spacer()
                    .frame(maxHeight: proxy.size.height * 0.05)
                
                Button {
                    //TODO: 글 포스팅 완료 action
                } label: {
                    Text("다음")
                        .modifier(ButtonModifier(color: .basic, disabled: viewModel.moneyText.isEmpty || viewModel.selectedTag.isEmpty || viewModel.selectedAge.isEmpty))
                }
                
                Spacer()
                    .frame(maxHeight: proxy.size.height * 0.02)
                
                Button {
                    //TODO: 글 포스팅 완료 action
                } label: {
                    Text("생략")
                        .modifier(ButtonModifier(color: .secondary, disabled: true))
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
