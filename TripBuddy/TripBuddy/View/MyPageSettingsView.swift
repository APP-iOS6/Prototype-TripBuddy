//
//  MyPageSettingsView.swift
//  TripBuddy
//
//  Created by 이다영 on 9/24/24.
//

import SwiftUI

struct MyPageSettingsView: View {
    @ObservedObject var viewModel: UserProfileViewModel
    @Environment(\.presentationMode) var presentationMode
    
    let genderOptions = ["여성", "남성", "그 외", "비공개"]
    let tagOptions = ["술", "휴양", "파티", "웨이팅", "맛집", "음주", "도전", "관광", "경치", "자동차", "대중교통", "시골", "바다", "산", "새로운 시도 좋아요", "새로운 사람은 싫어요", "FLEX", "절약"]
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 20) {
                // 프로필 섹션
                VStack {
                    Image("profileImage")
                        .resizable()
                        .frame(width: 120, height: 120)
                        .clipShape(Circle())
                    
                    Button(action: {
//                        showingSettings = true
                    }) {
                        Image(systemName: "photo")
                            .foregroundColor(.white)
                            .padding(8)
                            .background(Color.gray)
                            .clipShape(Circle())
                    }
                    .offset(x: 40, y: -40)
                }
                .frame(maxWidth: .infinity)
                .padding(.top, 50)
                .multilineTextAlignment(.center)
                
                // 닉네임 필드
                VStack(alignment: .leading, spacing: 5) {
                    Text("닉네임")
                        .font(.caption)
                        .foregroundColor(.gray)
                    TextField("닉네임을 입력해주세요", text: $viewModel.nickname)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                .padding(.horizontal)
                
                // 소개글 필드
                VStack(alignment: .leading, spacing: 5) {
                    Text("소개글")
                        .font(.caption)
                        .foregroundColor(.gray)
                    TextField("소개글을 입력해주세요", text: $viewModel.introduction)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                .padding(.horizontal)
                
                // 인스타그램 아이디 필드
                VStack(alignment: .leading, spacing: 5) {
                    Text("@ Instagram")
                        .font(.caption)
                        .foregroundColor(.gray)
                    TextField("@id", text: $viewModel.instagramId)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                .padding(.horizontal)
                
                // 생년월일 입력 필드
                HStack(alignment: .center, spacing: 10) {
                    Text("생년월일")
                        .font(.caption)
                        .foregroundColor(.gray)
                    DatePicker("", selection: $viewModel.birthdate, displayedComponents: .date)
                }
                .padding(.horizontal)
                
                // 성별 선택 Picker
                Picker("성별", selection: $viewModel.gender) {
                    ForEach(0..<genderOptions.count) { index in
                        Text(genderOptions[index]).tag(index)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding(.horizontal)
                
                Spacer().frame(height: 0)
                
                // 태그 선택
                Text("나와 맞는 태그를 골라보세요! (다중 선택 가능)")
                    .font(.headline)
                    .padding(.horizontal)
                
                ScrollView {
                    FlowLayout {
                        ForEach(tagOptions, id: \.self) { tag in
                            TagToggle(tag: tag, isSelected: viewModel.selectedTags.contains(tag)) {
                                if viewModel.selectedTags.contains(tag) {
                                    viewModel.selectedTags.remove(tag)
                                } else {
                                    viewModel.selectedTags.insert(tag)
                                }
                            }
                        }
                    }
                    .padding(.horizontal)
                }
                .frame(height: 200)
                .padding(20)
                .background(Color.gray.opacity(0.05))
                .cornerRadius(15)
//                .padding(.horizontal)
            }
            .padding()
            .navigationBarItems(trailing: Button("저장") {
                presentationMode.wrappedValue.dismiss()
            })
        }
        .onAppear {
            //            viewModel.loadExistingData()
        }
    }
}

struct TagToggle: View {
    let tag: String
    var isSelected: Bool
    var toggleAction: () -> Void
    
    var body: some View {
        Text(tag)
            .padding(.horizontal, 16)
            .padding(.vertical, 5)
            .background(isSelected ? Color.green : Color.gray.opacity(0.1))
            .foregroundColor(.black)
            .cornerRadius(15)
            .onTapGesture {
                toggleAction()
            }
    }
}

// 태그 간격 배치
struct FlowLayout: Layout {
    
    let horizontalSpacing: CGFloat = 10  // 태그 간의 가로 간격
    let verticalSpacing: CGFloat = 10    // 태그 간의 세로 간격
    
    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        
        let sizes = subviews.map { $0.sizeThatFits(.unspecified) }
        
        var totalHeight: CGFloat = 0
        var totalWidth: CGFloat = 0
        
        var lineHeight: CGFloat = 0
        var lineWidth: CGFloat = 0
        
        for size in sizes {
            if lineWidth + size.width + horizontalSpacing > proposal.width ?? 0 {  // 가로 간격 추가
                totalHeight += lineHeight + verticalSpacing  // 세로 간격 추가
                lineWidth = size.width
                lineHeight = size.height
            } else {
                lineWidth += size.width + horizontalSpacing  // 가로 간격 추가
                lineHeight = max(lineHeight, size.height)
            }
            totalWidth = max(totalWidth, lineWidth)
        }
        totalHeight += lineHeight
        
        return .init(width: totalWidth, height: totalHeight)
    }
    
    
    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        let sizes = subviews.map { $0.sizeThatFits(.unspecified) }
        
        var lineX = bounds.minX
        var lineY = bounds.minY
        var lineHeight: CGFloat = 0
        
        for index in subviews.indices {
            if lineX + sizes[index].width + horizontalSpacing > (proposal.width ?? 0) {  // 가로 간격 추가
                lineY += lineHeight + verticalSpacing  // 세로 간격 추가
                lineHeight = 0
                lineX = bounds.minX
            }
            
            subviews[index].place(
                at: .init(
                    x: lineX + sizes[index].width / 2,
                    y: lineY + sizes[index].height / 2
                ),
                anchor: .center,
                proposal: ProposedViewSize(sizes[index])
            )
            
            lineHeight = max(lineHeight, sizes[index].height)
            lineX += sizes[index].width + horizontalSpacing  // 가로 간격 추가
        }
    }
}


#Preview {
    MyPageSettingsView(viewModel: UserProfileViewModel())
}
