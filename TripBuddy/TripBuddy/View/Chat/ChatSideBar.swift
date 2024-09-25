import SwiftUI

struct ChatSideBar: View {
    @Binding var isSidebarVisible: Bool
    @State private var sidebarOffset: CGFloat = UIScreen.main.bounds.width
    private let sidebarWidth: CGFloat = UIScreen.main.bounds.width * 0.7

    var body: some View {
        ZStack {
//
//            VStack {
//                Spacer()
//            }
//            .zIndex(1)
//            .toolbar {
//                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        withAnimation {
                            toggleSidebar()
                        }
                    }) {
                        Image(systemName: "line.3.horizontal")
                            .foregroundStyle(.tint)
                            .font(.title3)
                    }
//                }
//            }

            // Sidebar
            HStack {
                Spacer()
                VStack(alignment: .leading) {
                    
                    chatMemberList()
                    
                    Spacer()
                }
                .frame(width: sidebarWidth)
                .background(Color.gray)
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
                .zIndex(2)
            }
        }
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


struct chatMemberList: View {
    var body: some View {
        Spacer()
        Text("대화상대")
            .font(.title)
            .foregroundStyle(Color.white)

        ForEach(chatRooms) { member in
            HStack {
                Image(member.imageName)
                    .resizable()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                    .overlay {
                        Circle().stroke(.gray, lineWidth: 0.1)
                    }
                    .padding()
                
                Text("\(member.name)")
            }
        }
        Spacer()
    }
}
