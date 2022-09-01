import 'package:flutter/foundation.dart';

class FavoriteProvider with ChangeNotifier {
  List<int> _selectedItem = [];

  List<int> get favList => _selectedItem;

  void selectItem(int value) {
    if (_selectedItem.contains(value)) {
      _selectedItem.remove(value);
    } else {
      _selectedItem.add(value);
    }
    notifyListeners();
  }
}
