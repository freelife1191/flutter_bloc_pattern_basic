import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
          appBar: AppBar(
            title: Text('카운'),
          ),
          body: Counter()),
    );
  }
}

class Counter extends StatefulWidget {
  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  final counterSubject = BehaviorSubject<int>(); //마지막 값을 가지고 있고 얻게 해줌
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RaisedButton(
            child: Text('add'),
            onPressed: () {// 버튼 클릭시 카운터 증가하고 counterSubject에 넣어 줌
              counterSubject.add(++counter);
            },
          ),
          StreamBuilder<int>(
            stream: counterSubject.stream, //counterSubject에 들어간 값들이 연결이 됨
              initialData: 0, // 아무 값이 들어있지 않으므로 초기값 지정
            builder: (context, snapshot) {
              if (snapshot.hasData){
                return Text(
                  '${snapshot.data}',
                  style: TextStyle(fontSize: 30),
                );
              }
            }
          )
        ],
      ),
    );
  }
}
