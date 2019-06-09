// Flutter code sample for material.Scaffold.1

// This example shows a [Scaffold] with an [AppBar], a [BottomAppBar] and a
// [FloatingActionButton]. The [body] is a [Text] placed in a [Center] in order
// to center the text within the [Scaffold] and the [FloatingActionButton] is
// centered and docked within the [BottomAppBar] using
// [FloatingActionButtonLocation.centerDocked]. The [FloatingActionButton] is
// connected to a callback that increments a counter.

import 'package:flutter/material.dart';

import 'bloc/counter_bloc.dart';

void main() => runApp(MyApp());

final counterBloc = CounterBloc();

/// This Widget is the main application widget.
class MyApp extends StatelessWidget {
  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sample Code'),
      ),
      body: Center(
        child: StreamBuilder<int>(
            stream: counterBloc.count$, //관찰하고 있다가 이 값이 변경될 때마다 가져와서 아래의 함수를 수
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text('${snapshot.data}', style: TextStyle(fontSize: 100));
              } else {
                return CircularProgressIndicator(); //로딩
              }
            }),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 50.0,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() {
              counterBloc.addCounter(); //버튼을 클릭하면 addCounter 함수 호출
            }),
        tooltip: 'Increment Counter',
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
