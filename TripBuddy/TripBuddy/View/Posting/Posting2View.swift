//
//  Posting2View.swift
//  TripBuddy
//
//  Created by 김동경 on 9/24/24.
//

import SwiftUI

struct Posting2View: View {
    
    @EnvironmentObject private var viewModel: PostingViewModel
    @State private var title = "" // 제목
    @State private var content = "" // 본문
    
    var body: some View {
        GeometryReader { proxy in
         
                VStack(alignment: .leading) {
                    
                    CustomTextField(
                        placeholder: "ex. 12월 제주 바다 보러갈 동행 3인 구해요.",
                        text: $viewModel.title,
                        characterLimit: 40,
                        subtitle: "(최소 5자 이상 / 최대 40자 이내)",
                        subtitleColor: .green,
                        isRequired: true
                    )
                    
                    Spacer()
                        .frame(maxHeight: proxy.size.height * 0.06)
                    
                    CustomTextEditor(
                        placeholder: "ex. 맛집 탐방을 좋아하는 20대 여성 동행을 찾아요! 걸어서 맛집 탐방을 하려고 합니다 :)",
                        text: $viewModel.text,
                        characterLimit: 1000,
                        subtitle: "(최소 20자 이상 / 최대 1000자 이내)",
                        subtitleColor: .green,
                        isRequired: true
                    )
                    //.frame(minHeight: 160)
                    
                    Spacer()
                        .frame(maxHeight: proxy.size.height * 0.06)
                    
                    HStack {
                        Text("모집 인원")
                            .font(.custom("Pretendard-medium", size: 17))
                        Spacer()
                        Text("\(Int(viewModel.count))")
                            .font(.custom("Pretendard-regular", size: 17))
                    }
                    
                    Slider(value: $viewModel.count, in: 1...10, step: 1.0)
                        .tint(.basic)
                    
                    Spacer()
                        .frame(maxHeight: proxy.size.height * 0.06)
                    
                    Button {
                        viewModel.step = .option
                    } label: {
                        Text("다음")
                            .modifier(ButtonModifier(color: .basic,
                                                     disabled: viewModel.title.count < 5 || viewModel.text.count < 20))
                            .font(.custom("Pretendard-regular", size: 18))
                    }
                    .disabled(viewModel.title.count < 5 || viewModel.text.count < 20)
                    
                    Spacer()
                        .frame(maxHeight: proxy.size.height * 0.06)
                    
                }
                .padding(.horizontal, proxy.size.width * 0.07)
            }
        
    }
}

struct TextFieldModifier: ViewModifier {
    let width: CGFloat
    let height: CGFloat?
    
    func body(content: Content) -> some View {
        content
            .padding()
            .frame(height: height)
            .frame(maxWidth: width)
            .overlay {
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color(.systemGray3), lineWidth: 0.5)
                    .foregroundStyle(.clear)
            }
    }
}

struct CustomTextField: View {
    var placeholder: String
    @Binding var text: String
    var characterLimit: Int
    var subtitle: String
    var subtitleColor: Color
    var isRequired: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text("제목")
                    .font(.custom("Pretendard-medium", size: 17))
                
                if isRequired {
                    Text("*")
                        .foregroundStyle(.red)
                }
                
                Spacer()
                
                Text("(\(text.count)/\(characterLimit))")
                    .font(.custom("Pretendard-Regular", size: 12))
                    .foregroundStyle(.gray)
            }
            
            ZStack(alignment: .leading) {
                if text.isEmpty {
                    Text(placeholder)
                        .foregroundStyle(.gray)
                        .font(.custom("Pretendard-Regular", size: 15))
                        .padding(.leading, 17)
                }
                
                TextField("", text: $text)
                // 입력된 글자 수가 제한을 넘지 않도록
                    .onSubmit {
                        hideKeyboard()
                    }
                    .onChange(of: text) { _, newValue in
                        if newValue.count > characterLimit {
                            text = String(newValue.prefix(characterLimit))
                        }
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(Color(.systemGray3), lineWidth: 0.5)
                    )
                    .frame(maxWidth: .infinity)
            }
            
            Text(subtitle)
                .font(.custom("Pretendard-Regular", size: 12))
                .foregroundStyle(.basic)
                .padding(.leading, 10)
        }
    }
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

struct CustomTextEditor: View {
    var placeholder: String
    @Binding var text: String
    var characterLimit: Int
    var subtitle: String
    var subtitleColor: Color
    var isRequired: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text("본문")
                    .font(.custom("Pretendard-medium", size: 17))
                
                if isRequired {
                    Text("*")
                        .foregroundStyle(.red)
                }
                
                Spacer()
                
                Text("(\(text.count)/\(characterLimit))")
                    .font(.custom("Pretendard-Regular", size: 12))
                    .foregroundStyle(.gray)
            }
            
            ZStack(alignment: .topLeading) {
                TextEditor(text: $text)
                    .onSubmit {
                        hideKeyboard()
                    }
                    .frame(height: 100)
                    .padding(4)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(Color(.systemGray3), lineWidth: 0.5)
                    )
                    .onChange(of: text) { _, newValue in
                        if newValue.count > characterLimit {
                            text = String(newValue.prefix(characterLimit)) // 글자 수 제한 적용
                        }
                    }
                
                if text.isEmpty {
                    Text(placeholder)
                        .foregroundStyle(.gray)
                        .font(.custom("Pretendard-Regular", size: 15))
                        .padding(.horizontal, 17)
                        .padding(.vertical, 15)
                }
            }
            
            Text(subtitle)
                .font(.custom("Pretendard-Regular", size: 12))
                .foregroundStyle(.basic)
                .padding(.leading, 10)
        }
    }
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

#Preview {
    Posting2View()
        .environmentObject(PostingViewModel())
    
}
