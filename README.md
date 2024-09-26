# 마음 맞는 여행 동행을 찾아주는 'TripBuddy'

## ✔️ ADS

여행 관점(경비, 음식 취향, 일정의 강도 등)이 비슷한 사람들끼리 함께 여행할 수 있도록 동행을 찾는 앱

## 👀 팀원 소개
| 👑 이다영 | 김동경 | 김효정 | 김종혁 | 배문성 |
| :---: | :---: | :---: | :---: | :---: |
| ![1](https://github.com/user-attachments/assets/dcd9f6ed-0814-4872-b8e1-ce8112b4a14f) | ![2](https://github.com/user-attachments/assets/dfa9636e-e1c9-4280-a40b-09cbbac75d22) | ![3](https://github.com/user-attachments/assets/77106385-002d-49b6-83b4-65fbd4b01ff1) | ![4](https://github.com/user-attachments/assets/f3251417-d5af-48de-b03a-3532e522857d) | ![5](https://github.com/user-attachments/assets/2e4f82b2-e019-4cfa-9218-ce16e592f9a0) |
| My Page | Post | Home | Chat | Detail |
| [GitHub](https://github.com/dardardardardar) | [GitHub](https://github.com/dongykung) | [GitHub](https://github.com/71myo) | [GitHub](https://github.com/bbell428) | [GitHub](https://github.com/ActDine) |
  
## 👩🏻‍💼 페르소나
### 홍길동경(22세, 학생)

배경: 학생이며 여행을 즐겨함

목표: 나이와 상관 없이 여행 취향이 같은 사람들과 여행을 즐기고 싶습니다.

동기: 나와 여행 취향이 맞는 사람들을 찾고 같이 여행 가는 것

필요: 여행 취향(MBTI, 목표, 추구 등) 필터링, 여행 인원 구직 기능  

### 이종혁(32세, 회사원)

배경: 직장을 다니며 여행으로 스트레스를 품

목표: 계획없는 직장인들끼리 인생 얘기를 하며 여행을 하고 싶습니다.

동기: 다른 사람들과의 커뮤니티, 같은 성향 친구 사귀기

필요: 여행 취향 및 관심사 필터링 

## 💭 시나리오
![image](https://github.com/user-attachments/assets/821fa706-2161-46ab-9bff-6638f534b0c1)


## 📱 주요 기능
- **Login**
  
    - 소셜 로그인(버튼만 구현)
      
    - 로그인 없이 둘러보기 가능
    
- **Home**
  
    - 검색창을 통해 검색 및 필터 적용 가능
      
    - 여행 테마(예: 한옥, 바다) 배너 버튼을 통해 관련 포스트를 보여줌
      
        - 해당 테마에 맞는 지역이 다양할 수 있으니 배너 클릭 시 나오는 리스트에 관련 지역의 필터 버튼 추가
          
        - 필터 버튼 클릭 시 해당 지역 리스트만 보여줌
     
    - 지역 배너 버튼을 통해 관련 포스트를 보여줌
 
    - 최근 동행 포스트 리스트 구현

- **Post**

    - 세 가지 단계로 나누어 포스트 작성 가능
 
    - 마지막 단계인 조건 부분은 필수가 아니라 생략 가능

- **Chat**

    - 본인이 참여 중인 동행과 본인이 모집 중인 동행의 채팅방을 나눠서 보여줌
 
    - 채팅방 내 지역 버튼 클릭 시 여행 일정 확인 가능
 
    - 채팅방 내 사이드 바를 통해 나가기 Alert, 알림 On/Off 구현

- **MyPage**

    - 동행 참여 기록을 참여 중, 참여 대기중, 히스토리 세 가지로 분리하여 리스트업
 
    - 프로필 사진 내 Setting 버튼을 통해 본인의 정보 수정 가능

- **Detail**

    - 동행 포스팅 내 여행 일정 버튼 클릭 시 일정 확인 가능
        - 해당 기능은 보안상의 이유로 참여 유저에게만 노출되며, 미참여 유저에겐 참여 유저에게만 보인다는 알림 전달
     
        - 일정 내 MapKit을 통해 지도 구현
     
    - 동행 참여하기 버튼 클릭 시 관련 채팅방으로 이동


## 질문
1. 뷰 넘어감이 자연스러운지 (신청하기 눌렀을 때 바로 채팅방으로 가는 것 괜찮나요?)

2. 추가적인 기능 어떤 것이 좋은지

3. 동행을 구하는 컨셉 전달이 확실한지

4. 상세 필터링에 있으면 좋겠는 추가 태그 옵션은?


## 피드백 ⁄ 개선사항
1.
2.
3.
4.

## 작동환경
- Xcode: 16.0

- iOS: 18.0

## 라이선스
Licensed under the [MIT](LICENSE) license.
