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
    
    private var cancel: () -> Void
    private var posting: () -> Void
    
    init(cancel: @escaping () -> Void, posting: @escaping () -> Void) {
        self.cancel = cancel
        self.posting = posting
    }
    
    var body: some View {
        VStack {
            HStack(alignment: .center) {
                if viewModel.step != .date {
                    Button {
                        handleback()
                    } label: {
                        Image(systemName: "chevron.left")
                            .tint(.primary)
                    }
                } else {
                    Button {
                        handleback()
                    } label: {
                        Image(systemName: "xmark")
                            .tint(.primary)
                    }
                }
                
                Spacer()
                
                Text("동행 작성")
                    .font(.custom("Pretendard-medium", size: 18))
                    .font(.title2)
                
                Spacer()
                
            }
            .padding()
            
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
                    Posting3View() {
                        viewModel.reset()
                        posting()
                    }
                }
            }.environmentObject(viewModel)
        }
        .alert("작성 중인 내용은 모두 사라집니다", isPresented: $viewModel.isVisibleAlert) {
            Button("취소", role: .cancel) {}
            Button("삭제", role: .destructive) {
                viewModel.reset()
                cancel()
            }
        }
        .animation(.smooth, value: viewModel.step)
    }
    
    func handleback() {
        switch viewModel.step {
        case .date:
            if viewModel.selectedCity.isEmpty {
                cancel()
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
    NavigationStack {
        PostingContainerView() {
        } posting: {
            
        }
        .environmentObject(PostingViewModel())
        
    }
}
