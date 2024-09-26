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
    
    @FocusState var isFocus: Bool
    @State private var showAllTags = false  // 더보기/접기 상태 관리
    @State private var isKeyboardVisible: Bool = false // 키보드 표시 상태 추적    private var action: () -> Void
    
    private var action: () -> Void
    init(action: @escaping () -> Void ) {
        self.action = action
    }
    
    var body: some View {
        GeometryReader { proxy in
            ScrollView {
                VStack(alignment: .leading) {
                    HStack(alignment: .center) {
                        Text("인당 경비")
                            .font(.custom("Pretendard-medium", size: 17))
                        
                        Spacer()
                        
                        TextField("인당 경비", text: $viewModel.moneyText)
                            .keyboardType(.numberPad) // 숫자 키패드 표시
                            .multilineTextAlignment(.trailing) // 텍스트 오른쪽 정렬
                            .onChange(of: viewModel.moneyText) { _, newValue in
                                let filtered = newValue.filter { "0123456789".contains($0) }
                                
                                // 필터링된 값이 기존 값과 다를 경우 업데이트
                                if filtered != newValue {
                                    viewModel.moneyText = filtered
                                }
                                
                                // 숫자 형식으로 포맷팅
                                if let number = Int(filtered) {
                                    viewModel.moneyText = formatNumber(number)
                                } else {
                                    viewModel.moneyText = ""
                                }
                            }
                            .toolbar {
                                ToolbarItemGroup(placement: .keyboard) {
                                    Spacer() // 오른쪽 정렬을 위해 Spacer 사용
                                    Button("완료") {
                                        hideKeyboard()
                                    }
                                }
                            }
                            .modifier(TextFieldModifier(width: proxy.size.width * 0.4, height: proxy.size.height * 0.05))
                        
                        Text("원")
                            .font(.custom("Pretendard-regular", size: 17))
                    }
                    .padding(.bottom, 30)
                    .padding(.top, 10)
                    
                    Text("동행자 성별")
                        .font(.custom("Pretendard-medium", size: 17))
                    
                    Picker("성별", selection: $viewModel.selectedPerson) {
                        ForEach(Person.allCases, id: \.self) { person in
                            Text(person.rawValue).tag(person)
                        }
                    }
                    .pickerStyle(.segmented)
    
                    
                    Spacer()
                        .frame(height: proxy.size.height * 0.06)
                    
                    Text("동행자 나이대")
                        .font(.custom("Pretendard-medium", size: 17))
                    
                    FlowLayout {
                        ForEach(age, id: \.self) { age in
                            let selected = viewModel.selectedAge.contains(where: { $0 == age })
                            Button {
                                viewModel.ageTapped(age)
                            } label : {
                                Text(age)
                                    .font(.custom("Pretendard-regular", size: 16))
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
                        .frame(height: proxy.size.height * 0.06)
                    
                    Text("여행 성향")
                        .font(.custom("Pretendard-medium", size: 17))
                    
                    // 성향 태그 (더보기/접기 로직 포함)
                    FlowLayout {
                        let visibleTags = showAllTags ? tag : Array(tag.prefix(8)) // 시골까지 보이도록 제한
                        ForEach(visibleTags, id: \.self) { tag in
                            let selected = viewModel.selectedTag.contains(where: { $0 == tag })
                            Button {
                                viewModel.tagTapped(tag)
                            } label : {
                                Text(tag)
                                    .font(.custom("Pretendard-regular", size: 16))
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
                        withAnimation() { // 애니메이션 없이 상태 변경
                            showAllTags.toggle()
                        }
                    } label: {
                        Label(showAllTags ? "접기" : "더보기", systemImage: showAllTags ? "chevron.up" : "chevron.down")
                            .font(.custom("Pretendard-regular", size: 14))
                            .foregroundStyle(.basic)
                    }
                    .padding(.leading, 1)
                    
                    Spacer()
                        .frame(height: proxy.size.height * 0.06)
                    
                    Button {
                        action()
                    } label: {
                        Text("다음")
                            .modifier(ButtonModifier(color: .basic, disabled: viewModel.moneyText.isEmpty || viewModel.selectedTag.isEmpty || viewModel.selectedAge.isEmpty))
                    }
                    
                    Spacer()
                        .frame(height: proxy.size.height * 0.06)
                    
                    Button {
                        action()
                    } label: {
                        Text("생략")
                            .padding()
                            .bold()
                            .foregroundStyle(.basic)
                            .frame(maxWidth: .infinity)
                            .background(.white)
                            .overlay(
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(.basic, lineWidth: 1)
                            )
                        
                    }
                    
                }
                .padding(.horizontal)
                .padding(.bottom, proxy.safeAreaInsets.bottom)
            }
        }
        .ignoresSafeArea(edges: .bottom)
    }
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    func formatNumber(_ number: Int) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.locale = Locale(identifier: "ko_KR") // 한국어 로케일 설정
        return formatter.string(from: NSNumber(value: number)) ?? ""
    }
}


#Preview {
    Posting3View() {
        
    }
    .environmentObject(PostingViewModel())
    
}
