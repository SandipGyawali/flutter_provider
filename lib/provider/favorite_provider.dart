import 'package:flutter/material.dart';

class FavoriteProvider with ChangeNotifier {
  final List<int> _selectedItems = [];

  void addItem(int index) {
    _selectedItems.add(index);
  }

  void removeItem(int index) {
    _selectedItems.remove(index);
  }

  List<int> getSelectedItems() {
    return _selectedItems;
  }
}
