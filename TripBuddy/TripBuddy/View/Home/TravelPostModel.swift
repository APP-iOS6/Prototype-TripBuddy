//
//  TravelPostModel.swift
//  TripBuddy
//
//  Created by 김효정 on 9/26/24.
//

import Foundation

struct TravelPost: Identifiable {
    let id = UUID()
    let title: String
    let content: String
    let dateRange: String
    let tags: [String]
}

let posts: [TravelPost] = [
    TravelPost(
        title: "부산 여행 같이 가실 분 ~",
        content: """
                안녕하세요
                부산 돼지 국밥 먹으러 가실 분 구해요~
                해운대도 같이 가서 바다 봐요
                현재 여자1, 남자1분 있습니다
                편하게 연락 주세요~
                """,
        dateRange: "9. 24 ~ 09. 27",
        tags: ["30대", "여성"]
    ),
    
    TravelPost(
        title: "강원도 양양 서핑 동행 모집!",
        content: """
                안녕하세여 👋
                이번 주말 양양에서 서핑 같이 하실 분 구해요~
                서핑 초보자도 환영합니다! 함께 즐거운 시간 보내요
                """,
        dateRange: "9. 30 ~ 10. 02",
        tags: ["30대", "성별 무관"]
    ),
    
    TravelPost(
        title: "가을 단풍 🍁 구경하러 설악산 가실 분!",
        content: """
                안녕하세요~
                가을 단풍이 예쁘게 물든 설악산에 같이 갈 분 구해요!
                등산보다는 가볍게 구경하고 올 예정입니다~
                """,
        dateRange: "10. 10 ~ 10. 11",
        tags: ["30대", "남성"]
    ),
    
    TravelPost(
        title: "스노클링 명소 다 찍어보실 분",
        content: """
                안녕하세요 ~ ☺️ 스노클링을 워낙 좋아해서 많이 해봤는데
                이번에 제주도에 길게 있는 김에 명소들을 다 가보려고 합니다.
                어쩌구 저쩌구
                """,
        dateRange: "9. 24 ~ 09. 27",
        tags: ["20대", "남성"]
    ),
    TravelPost(
        title: "플로깅 프로그램🪸 같이 체험해보실 분?",
        content: """
                해양 쓰레기를 주우면서 바다를 정화하는 봉사 활동을 플로깅이라고 하는데요.
                이번에 제주도에서 플로깅 프로그램이 진행된다고 해서 같이 신청하실 분 구합니다.
                어쩌구 저쩌구
                """,
        dateRange: "10. 01",
        tags: ["30대", "여성"]
    ),
    TravelPost(
        title: "제주 한달살기 하는 김에 같이 노실 분",
        content: """
                안녕하세용 이번에 퇴사하고 힐링을 위해 제주 한달살기를 하려고 합니다.
                그김에 같이 노실 분 구해봐요.
                어쩌구 저쩌구
                """,
        dateRange: "10. 02 ~ 10. 05",
        tags: ["20대", "여성"]
    ),
    TravelPost(
        title: "한옥에서 옥캉스 하실 분",
        content: """
                요즘 옥캉스가 유행한다고 하던데
                안동 쪽에서 한옥 스테이 같이 하실 분 구합니다.
                어쩌구 저쩌구
                """,
        dateRange: "9. 24 ~ 09. 27",
        tags: ["20대", "남성"]
    ),
    TravelPost(
        title: "경주에서 같이 한복 입고 사진 찍을 사람?",
        content: """
                안녕하세용 🙂
                경주 황리단길에서 한복 체험 같이 하실 분 구해봐요!
                어쩌구 저쩌구
                """,
        dateRange: "10. 01 ~ 10. 05",
        tags: ["20대", "여성"]
    ),
    TravelPost(
        title: "북촌 한옥마을 가실 분!",
        content: """
                북촌 한옥마을에서 같이 노실 분 있나요?
                락고재라고 괜찮은 곳이 있네요
                어쩌구 저쩌꾸
                """,
        dateRange: "10. 20",
        tags: ["20대", "성별 무관"]
    )
]
