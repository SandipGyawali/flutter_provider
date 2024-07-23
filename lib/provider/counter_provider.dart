import 'package:flutter/foundation.dart';

class CounterProvider with ChangeNotifier {
  int _count = 0;
  int get getCount => _count;
  void setCount() {
    _count++;
    notifyListeners();
  }
}
