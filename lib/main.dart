import 'package:flutter/material.dart';
// 앱 디자인 스타일 지정 - 위젯 라이브러리 불러옴
// material : 구글 안드로이드
// cupertino : 애플 IOS

// 플러터앱 실행 시작점
void main() {
  runApp(const MyApp());
  // MyApp이라는 위젯을 최상위 위젯으로 설정하고 호출
  // MyApp은 const로 선언했으면 불변 객체임을 의미 - 성능최적화 목적
}

// StatelessWidget : 상태를 가지지 않는 위젯
// 한번 앱에 표시(렌더링)되면, 절대 변경되지 않는 UI들로 구성
// 상태가 없는 위젯 -  고정적인 UI 요소 - 앱 UI 구성에 사용하는 위젯
// 생성자 호출 - build 함수 실행 - build 함수에 의해 반환된 위젯들이 화면에 렌더링
// 위젯들은 불변 특성을 가짐 - 생성후에는 속성변경 불가
// 한번 출력되면 그 자체로서 시각적인 정보를 주기 위해 존재 - 외형적인 변화는 없음

// 위젯 (태그+css+js)
// UI를 구성하는 기본요소이자 단위
// 눈에 보이는 요소 뿐 아니라 눈에 보이지 않음에도 레이아웃이나
// 그외 특수한 기능을 담당하는 것도 위젯에 포함
// 독립적이고 재사용 가능하며, 수많은 위젯을 조합해서 다양한 UI 구성가능
// 두 위젯을 결합하거나, 위젯이 다른 위젯을 포함 - 부모/자식 관계
// 위젯을 결합해서 어떤 UI를 만든 경우, 위젯간 계층구조 생김 - 트리구조

// 상태state
// 사용자가 일상에서 사용하는 앱은 사용자가 원하는 정보를 보여줘야 함
// 플러터에서 이런 정보를 실시간으로 보여주는 요소 역시 위젯임
// 상태는 어떤 대상이나 개체가 현재 가지고 있는 상황, 속성을 의미
// 위젯의 상태는 말 그대로 UI 요소의 현재 상황을 의미
// 따라서, UI가 언제라도 변경되도록 영향을 미치는 데이터
// ex) bmw앱 - 연료량 상태에 따른 주행 가능 거리 표시
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  // build : 플러터앱의 위젯에서 모든 UI를 정의하는 메서드
  // 핫 리로드 : 위젯의 디자인 속성을 바꾸고 재적용시 디자인 상태가 바로 변경
  // 실행하는 앱의 종류에 따라 상태가 그대로 유지되기도 함 (android vs chrome)
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,  // debug 배너 제거
      title: '플러터 카운터 앱',  // 제목 문자열 정의 (고정값)
      theme: ThemeData(
         colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true, // Material3을 사용하도록 설정
      ),
      home: const MyHomePage(title: '플러터 카운터'),
    );
  }
}

// StatefulWidget
// 상태가 있는 위젯 - 가변 특성을 가짐 - UI의 상태에 따라 상황이 바뀌는 위젯
// 즉, 상태가 변경되면 UI를 다시 렌더링할 수 있음 - build 다시 호출함 
// 위젯 내부에서 build 함수 재실행해야 할 필요가 있을때 사용

// stateful
// 어떻게 보이게 할지에 영향을 미치는 필드를 포함하는 state 객체를 의미
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // 상태를 유지해야 할 필요가 있는 위젯은 final로 선언해야 함
  final String title;

  @override
  // 상태가 있는 위젯을 생성하기 위해 createState 호출
  State<MyHomePage> createState() => _MyHomePageState();
}

// 플러터앱의 상태 관리와 UI 구현에 대한 내용 정의
class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;  // 상태변수 정의

  void _incrementCounter() {
    // 상태를 변화시키는 메서드 정의
    setState(() {
      // setState를 이용해서 플러터에게 상태 변화가 생김을 알림
      // 이를 통해 변경된 state를 UI에 반영하기 위해 build 메서드 재실행함
      // setState 호출없이 _counter 변수의 상태를 변경하는 경우에는
      // build 메서드가 재실행하지 않음
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  @override
  // state에 따라 위젯의 UI를 렌더링 하는 메서드
  Widget build(BuildContext context) {
    // build : setState가 호출되었을때 재실행되는 메서드
    // 위의 예에서는 _incrementCounter가 호출되어 상태 변화가 생겼을때 build 재실행
    // 플러터는 이러한 build를 재실행하는데 최적화되어 있음
    // 즉, 상태 변화에 영향을 받는 위젯만 재빠르게 렌더링한다는 의미
    return Scaffold(
      // Scaffold
      // 앱의 구조를 지원하거나 기능을 구현할 수 있도록 도와주는 틀
      // 앱 화면에 다양한 위젯을 배치하고 렌더링할 수 있도록 도와주는 틀
      appBar: AppBar(
        // AppBar의 색상을 Colors.amber로 변경하고 핫 리로드 테스트
        backgroundColor: Colors.red,
        // MyHomePage 객체에 정의된 title 값을 가져와서 AppBar 제목을 설정함
        title: Text(widget.title),
      ),
      body: Center(
        // Center는 레이아웃 위젯 - 자식요소 받아 중앙에 배치
        child: Column(
          // Column도 레이아웃 위젯 - 자식요소 받아 수직으로 배치
          // Column 위젯에는 다양한 속성 존재
          // 각 위젯의 와이어프레임을 볼려면 콘솔에서 p를 입력
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              '당신이 버튼을 클릭한 횟수:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        // 버튼들은 화면 끝에 배치
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: _incrementCounter,
            tooltip: '카운트 증가',
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: _decrementCounter,
            tooltip: '카운트 감소',
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
