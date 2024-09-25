import SwiftUI

struct ChatSideBar: View {
    @Binding var isSidebarVisible: Bool
    @State private var sidebarOffset: CGFloat = UIScreen.main.bounds.width
    private let sidebarWidth: CGFloat = UIScreen.main.bounds.width * 0.7

    var body: some View {
        ZStack {

            VStack {
                Spacer()
            }
            .zIndex(1)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        withAnimation {
                            toggleSidebar()
                        }
                    }) {
                        Image(systemName: "line.3.horizontal")
                            .foregroundStyle(.tint)
                            .font(.title3)
                    }
                }
            }

            // Sidebar
            HStack {
                Spacer()
                VStack(alignment: .leading) {
                    ChatMemberList()
                }
                .frame(width: sidebarWidth)
                .background(Color(UIColor.systemGray5)) // 연한 회색 배경
                .offset(x: sidebarOffset)
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            if sidebarOffset + value.translation.width > 0 {
                                sidebarOffset = min(sidebarWidth, sidebarOffset + value.translation.width * 0.5)
                            }
                        }
                        .onEnded { value in
                            if value.translation.width > 100 {
                                withAnimation {
                                    closeSidebar()
                                }
                            } else {
                                withAnimation {
                                    openSidebar()
                                }
                            }
                        }
                )
                .onAppear {
                    sidebarOffset = isSidebarVisible ? 0 : sidebarWidth
                }
                .zIndex(2)
            }
        }
        .navigationBarHidden(isSidebarVisible) // 슬라이드가 열렸을 때만 네비게이션 바 숨기기
    }

    private func toggleSidebar() {
        isSidebarVisible.toggle()
        sidebarOffset = isSidebarVisible ? 0 : sidebarWidth
    }

    private func openSidebar() {
        isSidebarVisible = true
        sidebarOffset = 0
    }

    private func closeSidebar() {
        isSidebarVisible = false
        sidebarOffset = sidebarWidth
    }
}

struct ChatSideBar_Previews: PreviewProvider {
    static var previews: some View {
        ChatSideBar(isSidebarVisible: .constant(true))
    }
}

struct ChatMemberList: View {
    @State private var isBellBool: Bool = true
    @State private var showAlert: Bool = false
    @Environment(\.presentationMode) var presentationMode // 뒤로 가기 버튼을 위해 추가

    var body: some View {
        VStack(alignment: .leading) {
            Text("대화상대")
                .font(.custom("Pretendard-Bold", size: 25))
                .foregroundColor(.black)
                .padding(.top, 70)
                .padding(.leading, 20)
            
            ForEach(chatRooms) { member in
                HStack {
                    Image(member.imageName)
                        .resizable()
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                        .overlay {
                            Circle().stroke(Color.gray, lineWidth: 0.1)
                        }
                    
                    Text(member.name)
                        .font(.custom("Pretendard-Medium", size: 18))
                        .foregroundColor(.black)
                }
                .padding()
            }
            Spacer()
            
            HStack {
                // 채팅방 나가기
                Button(action: {
                    showAlert = true
                }) {
                    Image(systemName: "rectangle.portrait.and.arrow.right")
                }
                .padding()
                .alert(isPresented: $showAlert) {
                    Alert(
                        title: Text("채팅방 나가기"),
                        message: Text("정말로 채팅방에서 나가시겠습니까?"),
                        primaryButton: .destructive(Text("나가기")) {
                            presentationMode.wrappedValue.dismiss()
                        },
                        secondaryButton: .cancel(Text("취소"))
                    )
                }
                
                Spacer()
                
                Button(action: {
                    isBellBool.toggle()
                }) {
                    if isBellBool {
                        Image(systemName: "bell.fill")
                    } else {
                        Image(systemName: "bell.slash")
                    }
                }
                
                Button(action: {
                    // 설정 버튼 동작 추가
                }) {
                    Image(systemName: "gearshape.fill")
                }
                .padding()
            }
            .font(.title)
        }
    }
}
