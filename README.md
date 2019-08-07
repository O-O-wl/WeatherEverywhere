# WeatherEverywhere

------

`powered by Dark-Sky`

------

## Todo 🎯

- search location by using Mapkit
- save location to app bundle
- get weatherInfo by using weather API
- parse data to model using in app
- request data parallely



### Question 🧐❓

- `@escaping 클로저`는 주입하는 스레드 기준으로 실행되는가?
- 여러 씬에서 사용되고, 앱과 생명주기를 같이하는 모델을 `AppDelegate`에 두는 게 옳을까?
- JSONData를 파싱하여 바로 사용할 것인가? 앱에서 사용할 별도 모델을 만들까? `후자`
- `Api` 키를 어떻게 숨길까?



### RetroRespective 💬

- iOS 컴포넌트를 세세히 보자 , Xcode의 속성들을 하나하나 익혀보자
  - tableview footer , searchBarController
- MVVM 채용에 대해서 생각을 해봐야겠다. Observer를 체인해볼까?



### Play 🎥

- **`UserDefault`를 이용한 정보 저장**

- **`앱 사용 정보 저장`**

![userDefault](https://user-images.githubusercontent.com/39197978/62603451-e6027400-b930-11e9-896c-2382f3bbb76b.gif)

- **`기상예측 정보 예측`**

  ![디테일화면](https://user-images.githubusercontent.com/39197978/62604027-1f87af00-b932-11e9-944f-c6ab71314860.gif)

- **`사용자 지정 로컬 탐색, 사용자 지정 로컬 삭제`**

![로컬추가삭제](https://user-images.githubusercontent.com/39197978/62604028-1f87af00-b932-11e9-967c-f160c94d7cc6.gif)

- **`Temperature 모델의 값 변환`**

![모델내의 데이터 변환](https://user-images.githubusercontent.com/39197978/62604029-1f87af00-b932-11e9-8a34-ce8ce4507df9.gif)

- **`타이머를 이용한 주기적인 요청과 업데이트`**

![Timer업데이트](https://user-images.githubusercontent.com/39197978/62604030-20204580-b932-11e9-9995-578f464df6c1.gif)

