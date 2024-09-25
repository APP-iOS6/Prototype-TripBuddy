//
//  PostingContainerView.swift
//  TripBuddy
//
//  Created by 김동경 on 9/24/24.
//

import SwiftUI

enum PostingStep: Int {
    case date = 1
    case text = 2
    case option = 3
}

struct PostingContainerView: View {
    
    
    @StateObject private var viewModel: PostingViewModel = .init()
    @Environment(\.dismiss) private var dismiss
    
    
    var body: some View {
        VStack {

            ZStack {
                // 중앙에 배치될 텍스트
                Text("동행 작성")
                    .font(.custom("Pretendard-medium", size: 18))
                    .frame(maxWidth: .infinity, alignment: .center) // 텍스트를 중앙에 정렬

                // 왼쪽 버튼
                HStack {
                    if viewModel.step != .date {
                        Button {
                            handleback()
                        } label: {
                            Image(systemName: "chevron.backward")
                                .tint(.primary)
                        }
                    } else {
                        Button {
                            dismiss()
                        } label: {
                            Image(systemName: "xmark")
                                .tint(.primary)
                        }

            
            HStack(alignment: .center) {
                if viewModel.step != .date {
                    Button {
                        handleback()
                    } label: {
                        Image(systemName: "arrow.backward")
                            .tint(.primary)
                    }
                } else {
                    Button {
                        handleback()
                    } label: {
                        Image(systemName: "xmark")
                            .tint(.primary)

                    }
                    Spacer() // 오른쪽에 Spacer를 두어 버튼은 왼쪽에, 텍스트는 중앙에 유지
                }
            }
            .padding(.vertical, 5)
            .padding(.horizontal, 22)
            
            ProgressView(value: viewModel.progress, total: 1.0)
                .progressViewStyle(.linear)
                .padding(.horizontal, 24)
                .padding(.bottom, 12)
                .tint(.basic)
                .animation(.easeInOut, value: viewModel.progress)
            
            VStack {
                switch viewModel.step {
                case .date:
                    Posting1View()
                        .transition(.opacity)
                case .text:
                    Posting2View()
                        .transition(.opacity)
                case .option:
                    Posting3View()
                }
            }.environmentObject(viewModel)
        }
        .alert("동행 모집을 취소하시겟습니까?", isPresented: $viewModel.isVisibleAlert) {
            Button("아니요", role: .cancel) {}
            Button("예", role: .destructive) {
                dismiss()
            }
        }
        .animation(.smooth, value: viewModel.step)
    }
    
    func handleback() {
        switch viewModel.step {
        case .date:
            if viewModel.selectedCity.isEmpty {
                dismiss()
            } else {
                viewModel.isVisibleAlert.toggle()
            }
        case .text:
            viewModel.step = .date
        case .option:
            viewModel.step = .text
        }
    }
}

#Preview {
    PostingContainerView()
        .environmentObject(PostingViewModel())
}
