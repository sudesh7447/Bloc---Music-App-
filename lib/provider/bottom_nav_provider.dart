import 'package:flutter/foundation.dart';

class BottomNavProvider extends ChangeNotifier {
  bool _isNav = true;

  bool get isNav => _isNav;

  void changeNavStatus(isOpen) {
    _isNav = !isOpen;

    notifyListeners();
  }
}
