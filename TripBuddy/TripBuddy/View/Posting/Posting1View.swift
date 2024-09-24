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
                Text("여행 일정을 입력해 주세요")
                    .font(.title)
                
                Spacer()
                    .frame(maxHeight: proxy.size.height * 0.05)
                
                Text("도시")
                    .foregroundStyle(.secondary)
                    .padding(.bottom, 12)
                
                Button {
                    isShowCityModal.toggle()
                } label: {
                    Text(viewModel.selectedCity.isEmpty ? "도시를 선택해 주세요" : viewModel.selectedCity)
                        .modifier(ModalButtonModifier(selected: !viewModel.selectedCity.isEmpty))
                        
                }
                
                Spacer()
                    .frame(maxHeight: proxy.size.height * 0.08)
                
                
                Text("날짜")
                    .foregroundStyle(.secondary)
                
                
                DatePicker(
                    "날짜",
                    selection: $viewModel.date,
                    displayedComponents: [.date]
                )
                .tint(.basic)
                .datePickerStyle(.graphical)
                
                Spacer()
                    .frame(maxHeight: proxy.size.height * 0.03)
                
                Button {
                    viewModel.step = .text
                } label: {
                    Text("다음")
                        .modifier(ButtonModifier(color: .basic, disabled: viewModel.selectedCity.isEmpty))
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
            .background(disabled ? .secondary : color)
            .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}



struct ModalButtonModifier: ViewModifier {
    let selected: Bool
    func body(content: Content) -> some View {
        content
            .padding()
            .foregroundStyle(selected ? .basic : .secondary)
            .frame(maxWidth: .infinity)
            .overlay {
                RoundedRectangle(cornerRadius: 12)
                    .stroke(.gray, lineWidth: 1)
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
