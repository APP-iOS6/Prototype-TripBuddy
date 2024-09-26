//
//  CityModalView.swift
//  TripBuddy
//
//  Created by 김동경 on 9/24/24.
//

import SwiftUI

struct CityModalView: View {
    
    @Environment(\.dismiss) private var dismiss
    @State private var query: String = ""
    @State private var cities: [String] = ["서울", "대구", "부산", "대전", "이천", "울산", "광주", "용인", "고양", "김포", "의정부", "파주", "세종", "김해", "서산", "군포", "의왕", "안양", "기타"]
    
    var queryList: [String] {
        if query.isEmpty {
            return cities
        } else {
            return cities.filter { $0.contains(query) }
        }
    }
    private let action: (String) -> Void
    
    init(action: @escaping (String) -> Void) {
        self.action = action
    }
    
    
    var body: some View {
        VStack {
            HStack {
                Button {
                    dismiss() // 뒤로 가기 동작
                } label: {
                    Image(systemName: "chevron.backward")
                        .font(.title2)
                        .tint(.gray)
                }
                
                //TODO: 검색바 넣어야 됨
                SearchBar(text: $query)
                    .animation(.easeInOut, value: query)
            }
            .padding(.horizontal, 18)
            .padding(.top, 20)
            
            List {
                ForEach(queryList, id: \.self) { city in
                    Button {
                        action(city)
                        dismiss()
                    } label: {
                        Text(city)
                            .font(.custom("Pretendard-regular", size: 17))
                    }
                }
            }
            .listStyle(.plain)
        }
    }
}

struct SearchBar: View {
    
    @Binding var text: String
    
    private var isEditing: Bool {
        text.isEmpty
    }
    
    var body: some View {
        HStack {
            TextField("Search ...", text: $text)
                .padding(7)
                .padding(.horizontal, 25)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .padding(.horizontal, 10)
                .overlay {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 16)
                }
                .keyboardType(.default)
                .toolbar {
                    // 키보드 위에 닫기 버튼 추가
                    ToolbarItemGroup(placement: .keyboard) {
                        Spacer()  // 오른쪽 정렬
                        Button {
                            hideKeyboard()
                        } label: {
                            Image(systemName: "keyboard.chevron.compact.down")
                        }
                    }
                }
            
            if !text.isEmpty {
                if !text.isEmpty {
                    Button {
                        withAnimation {
                            text = ""
                        }
                    } label: {
                        Text("Cancel")
                            .font(.custom("Pretendard-Regular", size: 17))
                    }
                }
            }
        }
    }
    
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

#Preview {
    NavigationStack {
        CityModalView(action: {_ in})
    }
}

#Preview {
    SearchBar(text: .constant("test"))
}
