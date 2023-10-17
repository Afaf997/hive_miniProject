import 'package:flutter/material.dart';

class Mainprovider extends ChangeNotifier {
  SelectedIndex _selectedindex = SelectedIndex(index: 0);

 changeselectIndex(int index) {
    _selectedindex = SelectedIndex(index: index);
    notifyListeners();
  }
  SelectedIndex get selectedIndex =>_selectedindex;
}

class SelectedIndex {
  final int index;

  SelectedIndex({required this.index});
}