//
//  MainTabBar.swift
//  TripBuddy
//
//  Created by 김동경 on 9/24/24.
//

import SwiftUI

struct MainTabBar: View {
    var body: some View {
        TabView {
            Text("HomeView")
                .tabItem {
                    Label {
                        Text("Home")
                    } icon: {
                        Image(systemName: "house")
                    }
                }
            
            Text("Post")
                .tabItem {
                    Label {
                        Text("Post")
                    } icon: {
                        Image(systemName: "plus.app")
                    }
                }
            
            ChatView()
                .tabItem {
                    Label {
                        Text("Chat")
                    } icon: {
                        Image(systemName: "bubble.fill")
                    }
                }
        }
    }
}

#Preview {
    MainTabBar()
}
