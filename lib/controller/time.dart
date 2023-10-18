import 'package:flutter/foundation.dart';

class ViewModeProvider with ChangeNotifier {
  bool _isGridView = false;

  bool get isGridView => _isGridView;

  void toggleViewMode() {
    _isGridView = !_isGridView;
    notifyListeners();
  }
}