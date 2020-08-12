import 'package:flutter/foundation.dart';

class Animations extends ChangeNotifier {
  bool _isScrolling;
  double _padding;
  Animations(this._isScrolling, [this._padding = 8.0]);

  get isScrolling => _isScrolling;
  get padding => _padding;

  set padding(double pad) {
    _padding = pad;
    notifyListeners();
  }

  set isScrolling(bool scrollStatus) {
    _isScrolling = scrollStatus;
    notifyListeners();
    if (!_isScrolling) {
      _padding = 8.0;
    } else {
      _padding = 24.0;
    }
    notifyListeners();
  }
}