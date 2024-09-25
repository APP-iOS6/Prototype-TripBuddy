//
//  View+extension.swift
//  TripBuddy
//
//  Created by 김효정 on 9/24/24.
//

import SwiftUI

// View Modifier 정의
struct TravelPostModifier: ViewModifier {
    let title: String
    let content: String
    let dateRange: String
    let tags: [String]
    
    func body(content: Content) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text(title)
                    .font(.custom("Pretendard-Bold", size: 16))
                
                Spacer()
                
                Text(dateRange)
                    .font(.custom("Pretendard-Regular", size: 12))
                    .foregroundStyle(.gray)
            }
            
            Text(self.content)
                .font(.custom("Pretendard-Regular", size: 14))
                .lineLimit(2) // 2줄로 제한
                .truncationMode(.tail) // 넘칠 때 '...' 처리
            
            HStack {
                ForEach(tags, id: \.self) { tag in
                    TagView(text: tag, size: 12)
                }
            }
        }
        .padding()
        .background(.white)
        .overlay {
            RoundedRectangle(cornerRadius: 15)
                .stroke(.gray.opacity(0.5), lineWidth: 0.5)
        }
    }
}

// ViewModifier를 간편하게 적용하는 함수 추가
extension View {
    func travelPostButton(title: String,
                          content: String,
                          dateRange: String,
                          tags: [String],
                          action: @escaping () -> Void) -> some View {
        Button(action: action) {
            self.modifier(TravelPostModifier(title: title,
                                             content: content,
                                             dateRange: dateRange,
                                             tags: tags))
        }
        .buttonStyle(PlainButtonStyle()) // 기본 버튼 스타일 제거
    }
}

struct TagView: View {
    let text: String
    let size: CGFloat
    
    var body: some View {
        Text(text)
            .font(.custom("Pretendard-Regular", size: size))
            .padding(.horizontal, 10)
            .padding(.vertical, 5)
            .background(Color(.systemGray6))
            .foregroundStyle(Color(UIColor.darkGray))
            .cornerRadius(15)
    }
}

struct TagButton: View {
    let text: String
    let size: CGFloat
    let action: () -> Void // 버튼 클릭 시 실행할 동작
    
    var body: some View {
        Button {
            action() // 버튼이 눌렸을 때 실행될 동작
        } label: {
            TagView(text: text, size: size)
        }
    }
}

struct CustomButton: View {
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
            
            Text("Search ...")
                .foregroundColor(.gray)
            Spacer() // 텍스트와 아이콘이 왼쪽에 붙도록 오른쪽에 여백을 추가
        }
        .padding(7)
        .background(Color(.systemGray6))
        .cornerRadius(8)
        .frame(maxWidth: .infinity) // 버튼의 가로를 화면 전체로 설정
        
    }
}
