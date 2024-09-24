//
//  Posting2View.swift
//  TripBuddy
//
//  Created by 김동경 on 9/24/24.
//

import SwiftUI

struct Posting2View: View {
    
    @EnvironmentObject private var viewModel: PostingViewModel
    
    var body: some View {
        GeometryReader { proxy in
            VStack(alignment: .leading) {
                
                Text("제목")
                    .font(.title2)
                
                TextField("제목을 입력해 주세요.", text: $viewModel.title)
                    .modifier(TextFieldModifier(width: .infinity))
                
                Spacer()
                    .frame(maxHeight: proxy.size.height * 0.04)
                
                Text("본문")
                    .font(.title2)
                
                TextEditor(text: $viewModel.text)
                    .modifier(TextFieldModifier(width: .infinity))
                    .frame(maxHeight: proxy.size.height * 0.3)
                    .overlay(alignment: .topLeading) {
                        if viewModel.text.isEmpty {
                            Text("글 본문을 입력해 주세요.")
                                .foregroundStyle(.secondary)
                                .offset(x:20, y: 20)
                        }
                    }
                
                Spacer()
                    .frame(maxHeight: proxy.size.height * 0.06)
                
                HStack {
                    Text("모집 인원")
                    Spacer()
                    Text("\(Int(viewModel.count))")
                }
                .font(.title2)
                
                Slider(value: $viewModel.count, in: 1...10, step: 1.0)
                    .tint(.basic)
                
                Spacer()
                    .frame(maxHeight: proxy.size.height * 0.05)

                Button {
                    viewModel.step = .option
                } label: {
                    Text("다음")
                        .modifier(ButtomModifier(color: .basic, disabled: viewModel.title.isEmpty || viewModel.text.isEmpty))
                }
                
            }
            .padding(.horizontal, proxy.size.width * 0.07)
        }
    }
}



struct TextFieldModifier: ViewModifier {
    let width: CGFloat
    func body(content: Content) -> some View {
        content
            .padding()
            .frame(maxWidth: width)
            .overlay {
                RoundedRectangle(cornerRadius: 12)
                    .stroke(.gray, lineWidth: 1)
                    .foregroundStyle(.clear)
                
            }
    }
}

#Preview {
    Posting2View()
        .environmentObject(PostingViewModel())

}
