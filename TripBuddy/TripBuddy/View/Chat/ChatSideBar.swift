import SwiftUI

struct ChatSideBar: View {
    @Binding var isSidebarVisible: Bool
    @State private var sidebarOffset: CGFloat = UIScreen.main.bounds.width
    private let sidebarWidth: CGFloat = UIScreen.main.bounds.width * 0.7

    var body: some View {
        ZStack {
            // Main Content
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
                            .imageScale(.large)
                    }
                }
            }

            // Sidebar
            HStack {
                Spacer()
                VStack(alignment: .leading) {
                    Button("프로필1") {
                        // Handle option 1 action
                    }
                    .padding()

                    Button("프로필2") {
                        // Handle option 2 action
                    }
                    .padding()

                    Spacer()
                }
                .frame(width: sidebarWidth)
                .background(Color.white)
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
