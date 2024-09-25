//
//  DetailView.swift
//  TripBuddy
//
//  Created by 김동경 on 9/24/24.
//

import SwiftUI

extension View {
    func offsetY(completion: @escaping (CGFloat, CGFloat) -> Void) -> some View {
        self
            .modifier(OffsetHelper(onChange: completion))
    }
}


struct OffsetHelper: ViewModifier {
    
    
    var onChange: (CGFloat, CGFloat) -> Void
    @State var currentOffset: CGFloat = 0
    @State var previousOffset: CGFloat = 0
    
    func body(content: Content) -> some View {
        content
            .overlay {
                GeometryReader { geometry in
                    let minY = geometry.frame(in: .named("SCROLL")).minY
                    Color.clear
                        .preference(key: OffsetKey.self, value: minY)
                        .onPreferenceChange(OffsetKey.self) { value  in
                            previousOffset = currentOffset
                            currentOffset = value
                            onChange(previousOffset, currentOffset)
                        }
                }
            }
        
    }
}


struct OffsetKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
    
}

struct DetailView: View {
    
    @State private var partnerManager: PartnerCheckManager = .init() //일정을 동행자만 볼수있게? 생각중(아직 사용 안함)
    @State private var scrollOffsetValue: CGFloat = 0 //스크롤 값
    @State private var isVisibleAlert: Bool = false //신고하기 버튼 액션얼럿
    @State private var isDeclarationAlert: Bool = false
    @State private var isHeart: Bool = false//좋아요
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        GeometryReader { proxy in
            ZStack(alignment: .top) {
                Image(.busan2)
                    .resizable()
                    .frame(width: proxy.size.width, height: proxy.size.height * 0.35)
                    .allowsHitTesting(false) // 이미지 자체는 터치 이벤트를 받지 않음
                    .ignoresSafeArea()
                    
 
                ScrollView {
                    VStack(alignment: .leading) {
                        //유저 프로필
                        UserProfileSection()
                        
                        Spacer()
                            .frame(height: 20)
                        
                        //제목 및 본문
                        TextSection()
                        
                        //여행 일정
                        ScheduleSection()
                        
                        //여행 조건
                        ContidionSection()
                        
                        //참여중인 동행
                        ParticipantSection()
                        
                        Spacer()
                            
                        
                        NavigationLink {
                            ChatRoomListView(filteredChatRooms: .constant(chatRooms))
                        } label: {
                            Text("동행 참여하기")
                                .modifier(ButtonModifier(color: .basic, disabled: false))
                        }
                        .padding(.top)
                        
                        Spacer()
                            .frame(height: proxy.size.height * 0.25)
                    }
                    .padding(.horizontal)
                    .background(Color.white)
                    .clipShape(UnevenRoundedRectangle(topLeadingRadius: 42, topTrailingRadius: 42))
                    .shadow(radius: 2) //그림자를 넣어야 하나 말아야 하나..
                    .offset(y: proxy.size.height * 0.18)
                    .offsetY { previous, current in
                        //기기마다 스크롤 값이 다른가? current = 스크롤 offsetY 값
                        print(current)
                        withAnimation {
                            scrollOffsetValue = current
                        }
                    }
                }//스크롤 끝
                .coordinateSpace(name: "SCROLL")
               
                if scrollOffsetValue > -120 {
                    TopBarIcons()
                        .transition(.opacity)
                }
                
            }
            .navigationBarBackButtonHidden()
            .alert("이 게시물을 정말 신고 하시겠습니까?", isPresented: $isDeclarationAlert, actions: {
                Button("취소", role: .cancel){}
                Button("신고", role: .destructive){}
            })
            .confirmationDialog("신고", isPresented: $isVisibleAlert, actions: {
                Button("신고", role: .destructive) {
                    isDeclarationAlert.toggle()
                }
            })
            .frame(maxWidth: proxy.size.width, maxHeight: proxy.size.height)
        }
    }
    
    @ViewBuilder
    func TopBarIcons() -> some View {
        HStack {
            Button {
                dismiss()
            } label: {
                Image(systemName: "chevron.left")
                    .font(.title)
                    .tint(.white)
            }
            
            Spacer()
            
            Button {
                isVisibleAlert.toggle()
            } label: {
                Image(systemName: "info.circle")
                    .font(.title)
                    .tint(.white)
            }
        }
        .bold()
        .padding()
    }
    
    @ViewBuilder
    func TextSection() -> some View {
        
        Text("부산 여행 같이 가실 분~")
            .bold()
            .font(.title2)
            .padding(.bottom)
        
        Text("안녕하세요\n부산 돼지 국밥 먹으러 가실 분 구해요~\n해운대도 같이 가서 바다 봐요\n현재 여자1, 남자1분 있습니다\n편하게 연락 주세요~")
            .padding(.bottom, 24)
    }
    
    @ViewBuilder
    func UserProfileSection() -> some View {
        HStack(alignment: .center) {
            Image(.guri)
                .resizable()
                .scaledToFit()
                .frame(maxWidth: 50)
            
            
            VStack(alignment:.leading) {
                Text("달달구리")
                Text("24세 | 여자")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
            
            Spacer()
            Button {
                isHeart.toggle()
            } label: {
                Image(systemName: isHeart ? "heart.fill" : "heart")
                    .tint(isHeart ? .red : .primary)
            }
        }
        .padding(.top, 20)
    }
    
    @ViewBuilder
    func ScheduleSection() -> some View {
        Text("여행 일정")
            .font(.title3)
            .bold()
        
        NavigationLink {
            DetailScheduleView()
        } label: {
            HStack(alignment: .center) {
                VStack(alignment: .leading) {
                    HStack {
                        Image(systemName: "calendar")
                            .tint(.gray)
                        Text("09.24 ~ 09.27")
                            .foregroundStyle(.black)
                        
                    }
                    .padding(.horizontal)
                    .padding(.top, 12)
                    .padding(.bottom, 3)
                    HStack {
                        Image(systemName: "map")
                            .tint(.gray)
                        Text("gps 아이콘 어딨누..")
                            .foregroundStyle(.black)
                    }
                    .padding(.horizontal)
                    .padding(.top, 3)
                    .padding(.bottom, 12)
                    
                }
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .font(.title)
                    .tint(.gray)
                    .padding()
            }
            .background(.detailcontainer)
            .clipShape(RoundedRectangle(cornerRadius: 18))
            
        }
    }
    
    @ViewBuilder
    func ContidionSection() -> some View {
        Text("여행 조건")
            .font(.title3)
            .bold()
            .padding(.top, 32)
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: "person")
                    .frame(maxWidth: 35)
                Text("남녀무관, 20대")
            }
            .padding(.horizontal, 3)
            
            
            HStack {
                Image(systemName: "number")
                    .frame(maxWidth: 35)
                
                Text("활발, 긍정, 텐션")
            }
            .padding(.horizontal, 3)
            HStack {
                Image(systemName: "dollarsign")
                    .frame(maxWidth: 35)
                
                Text("인당 80.000원")
            }
            .padding(.horizontal, 3)
        }
        .padding(.vertical, 1)
    }
    
    @ViewBuilder
    func ParticipantSection() -> some View {
        HStack {
            Text("참여 중인 동행")
                .font(.title3)
                .bold()
            
            Text("3/4")
                .foregroundStyle(.secondary)
        }
        .padding(.top, 32)
        
        HStack(alignment: .center) {
            VStack(alignment: .center) {
                Button {
                    
                } label: {
                    Image(.guri)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: 40)
                }
                Text("달달구리")
            }
            .padding(.vertical)
            .padding(.horizontal, 8)
            
            VStack(alignment: .center) {
                Button {
                    
                } label: {
                    Image(.bear)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: 40)
                }
                Text("빼꼼")
            }
            .padding(.vertical)
            .padding(.horizontal, 8)
            
            VStack(alignment: .center) {
                Button {
                    
                } label: {
                    Image(.pepe)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: 40)
                }
                Text("페페")
            }
            .padding(.vertical)
            .padding(.horizontal, 8)
            
            Spacer()
        }
        .background(.detailcontainer)
        .clipShape(RoundedRectangle(cornerRadius: 18))
    }
}

#Preview {
    NavigationStack {
        DetailView()
    }
}
