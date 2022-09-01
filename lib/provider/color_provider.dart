import 'package:flutter/foundation.dart';

class ColorProvider with ChangeNotifier {
  double _value = 0.75;

  double get assignedValue => _value;

  void changeValue(double newValue) {
    _value = newValue;
    notifyListeners();
  }
}
