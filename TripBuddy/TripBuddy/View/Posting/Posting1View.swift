//
//  Posting1View.swift
//  TripBuddy
//
//  Created by 김동경 on 9/24/24.
//

import SwiftUI

struct Posting1View: View {
    
    @EnvironmentObject private var viewModel: PostingViewModel
    @State private var isShowCityModal: Bool = false
    
    var body: some View {
        GeometryReader { proxy in
            VStack(alignment: .leading) {
                Text("여행 일정을 선택해 주세요")
                    .font(.custom("Pretendard-semiBold", size: 22))
                
                Spacer()
                    .frame(maxHeight: proxy.size.height * 0.05)
                
                HStack(alignment: .top) {
                    Text("도시")
                        .font(.custom("Pretendard-medium", size: 17))
                        .padding(.bottom, 12)
                    
                    Text("*")
                        .foregroundStyle(.red)
                }
                
                Button {
                    isShowCityModal.toggle()
                } label: {
                    Text(viewModel.selectedCity.isEmpty ? "도시를 선택해 주세요" : viewModel.selectedCity)
                        .modifier(ModalButtonModifier(selected: !viewModel.selectedCity.isEmpty))
                        .font(.custom("Pretendard-regular", size: 18))
                        
                }
                
                Spacer()
                    .frame(maxHeight: proxy.size.height * 0.08)
                
                HStack(alignment: .top) {
                Text("날짜")
                    .font(.custom("Pretendard-medium", size: 17))
                    .padding(.bottom, -12)
                
                    Text("*")
                        .foregroundStyle(.red)
                }
                
                DatePicker(
                    "시작",
                    selection: $viewModel.startDate,
                    displayedComponents: [.date]
                )
                .tint(.basic)
                .datePickerStyle(.compact)
                
                DatePicker(
                    "끝",
                    selection: $viewModel.endDate,
                    displayedComponents: [.date]
                )
                .tint(.basic)
                .datePickerStyle(.compact)
                
                Spacer()
                    .frame(maxHeight: proxy.size.height * 0.03)
                
                Button {
                    viewModel.step = .text
                } label: {
                    Text("다음")
                        .modifier(ButtonModifier(color: .basic, disabled: viewModel.selectedCity.isEmpty))
                        .font(.custom("Pretendard-regular", size: 18))
                }
                .disabled(viewModel.selectedCity.isEmpty)
            }
            .sheet(isPresented: $isShowCityModal, content: {
                CityModalView() { city in
                    viewModel.selectedCity = city
                }
                .interactiveDismissDisabled()
            })
            .padding(.horizontal, proxy.size.width * 0.07)
        }
    }
}

struct ButtonModifier: ViewModifier {
    let color: Color
    let disabled: Bool
    func body(content: Content) -> some View {
        content
            .padding()
            .bold()
            .foregroundStyle(.white)
            .frame(maxWidth: .infinity)
            .background(disabled ? Color(.systemGray5) : color)
            .clipShape(RoundedRectangle(cornerRadius: 15))
    }
}

struct ModalButtonModifier: ViewModifier {
    let selected: Bool
    func body(content: Content) -> some View {
        content
            .padding()
            .foregroundStyle(selected ? .basic : Color(.systemGray2))
            .frame(maxWidth: .infinity)
            .overlay {
                RoundedRectangle(cornerRadius: 15)
                    .stroke(selected ? .basic : Color(.systemGray3), lineWidth: 1)
                    .foregroundStyle(.clear)
                
            }
    }
}




#Preview {
    NavigationStack {
        Posting1View()
            .environmentObject(PostingViewModel())
    }
}
