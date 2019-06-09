import 'package:rxdart/rxdart.dart';

/**
 * Created by freelife1191.good@gmail.com on 2019-06-10
 * Blog : https://freedeveloper.tistory.com/
 * Github : https://github.com/freelife1191
 */
class CounterBloc {
  int _count = 0;
  
  final _countSubject = BehaviorSubject.seeded(0);

  /**
   * 값을 증가시키는 함수
   */
  void addCounter() {
    _count++;
    _countSubject.add(_count); //값이 증가가 되면 증가된 _count를 _countSubject에 추가함
  }
  
  //count Stream을 외부에서 달라고 하면 _countSubject에 있는 Stream을 준다
  Stream<int> get count$ => _countSubject.stream;
}