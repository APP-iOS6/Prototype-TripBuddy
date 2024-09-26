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
    @State private var navigateToDetail: Bool = false
    @State private var isVisiblePosting: Bool = false
    @State private var selectedTab: MainTabType = .home
    
    @State private var partnerManager: PartnerCheckManager = .init() //일정을 동행자만 볼수있게? 생각중(아직 사용 안함)
    
    var body: some View {
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
            
            
            NavigationStack {
                PostingContainerView {
                    selectedTab = .home
                } posting: {
                    //TODO: 글 작성 완료되고 홈 탭 이동 -> 디테일뷰로 이동되게??
                    selectedTab = .home
                }
                
            }
            .tabItem {
                Label {
                    Text("Post")
                } icon: {
                    Image(systemName: "plus.app")
                }
            }
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
        .environmentObject(partnerManager)
    }
}

#Preview {
    MainTabBar()
}
