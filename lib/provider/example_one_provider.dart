import "package:flutter/foundation.dart";

class ExampleOneProvider with ChangeNotifier {
  double _value = 0.8;
  double get value => _value;
  void setValue(var value) {
    _value = value;
    notifyListeners();
  }
}
