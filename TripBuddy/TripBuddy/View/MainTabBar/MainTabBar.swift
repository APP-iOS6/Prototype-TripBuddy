//
//  MainTabBar.swift
//  TripBuddy
//
//  Created by 김동경 on 9/24/24.
//

import SwiftUI

enum MainTabType {
    case home
    case post
    case chat
}

struct MainTabBar: View {
    @State private var isVisiblePosting: Bool = false
    @State private var selectedTab: MainTabType = .home
    
    var body: some View {
        NavigationStack {
            TabView(selection: $selectedTab) {
                HomeView()
                    .tabItem {
                        Label {
                            Text("Home")
                        } icon: {
                            Image(systemName: "house")
                        }
                    }
                    .tag(MainTabType.home)
                
                Text("post")
                    .tabItem {
                        Label {
                            Text("Post")
                        } icon: {
                            Image(systemName: "plus.app")
                        }
                    }
                    .onChange(of: selectedTab, { oldValue, newValue in
                        if newValue == .post {
                            isVisiblePosting.toggle()
                            selectedTab = .home
                        }
                    })
                    .tag(MainTabType.post)
                
                ChatView()
                    .tabItem {
                        Label {
                            Text("Chat")
                        } icon: {
                            Image(systemName: "bubble.fill")
                        }
                    }
                    .tag(MainTabType.chat)
                
            }
            .fullScreenCover(isPresented: $isVisiblePosting) {
                PostingContainerView()
            }
        }
    }
}

#Preview {
    MainTabBar()
}
