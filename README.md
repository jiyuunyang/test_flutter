# test_flutter

A new Flutter project.
fvm version : 3.13.7

## 브랜치별 설명
### main, test_flexible_fontSize : LayoutBuilder, MediaQuery, screen_util 사용한 스크린 별 실험
- main.dart에서 특정 스크린 별 return 처리 (비활성화된 화면은 주석 처리)
- LayoutBuilderScreen

  https://github.com/jiyuunyang/test_flutter/assets/91522788/ff652df3-1a38-4a54-ba9e-a6533ed83dd6

- MediaQueryScreen

  https://github.com/jiyuunyang/test_flutter/assets/91522788/1c957aa0-2f62-4308-95c0-ff961bc8ffa9

- ScreenUtilScreen

  https://github.com/jiyuunyang/test_flutter/assets/91522788/a148b120-01d7-4711-ae96-c31a6e072cfb


### test_widgetbook : Widgetbook 테스트 브랜치 
- 위젯북이란 ? 플러터에서 사용하는 일종의 스토리북
- [관련 문서](https://docs.widgetbook.io/)
- `widgetbook.dart`를 실행
- 위젯북 자동 생성
  - `flutter pub run build_runner build`
  - `flutter pub run build_runner watch`

### test_bloc : Bloc 패턴 연습
- lib/bloc 폴더 내부
  - test.dart : BlocObserver, BlocListener Test
  - test_repository.dart : Consumer, Repository Test
  - test_cubit.dart : Cubit Test
