## NHBank Open API 예금주조회 서비스 활용 Application

### 1. Application 실행 영상
* 해당 화면에서 나온 계좌번호는 실제 계좌번호가 아닌, Open API 테스트를 위해서 임의로 발급된 계좌번호임을 알립니다.

![img](https://user-images.githubusercontent.com/77099686/129606826-71d46753-cdc1-4768-945c-21f71884ec94.gif)

### 2. NHBankFundManagement 프로젝트 Hierarchy(MVVM)
<pre>
  .
  ├── NHBankFundManagement 
  │      └── Assets.xcassets
  │      └── Info.plist
  │      └── Delegates
  │      │      └── AppDelegate.swift
  │             └── SceneDelegate.swift
  │      └── Models
  │      │      └── InquireDepositorModel.swift
  │             └── GifLogoModel.swift
  │      └── Services
  │      │      └── InquireDepositorService.swift
  │             └── GifLogoService.swift
  │      └── Storyboards
  │      │      └── Main.storyboard
  │             └── LaunchScreen.storyboard
  │      └── ViewControllers
  │      │      └── InquireDepositorViewController.swift
  │             └── GifLogoView.swift
  │      └── ViewModels
  │      │      └── InquireDepositorViewModel.swift
  │             └── GifLogoViewModel.swift
  ├── NHBankFundManagementTests
  ├── NHBankFundManagementUITests
  ├── Products            
  ├── Pods
  ├── Frameworks
</pre>

### 3. 참고
<pre><a href = "https://youngjaelee-dev.tistory.com/entry/NHBank-OpenAPI-%EC%98%88%EA%B8%88%EC%A3%BC-%EC%A1%B0%ED%9A%8C-%EC%84%9C%EB%B9%84%EC%8A%A4-Application?category=914361">I. 프로젝트 설명 링크</a></pre>





