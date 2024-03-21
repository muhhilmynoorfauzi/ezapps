import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Counter with ChangeNotifier, DiagnosticableTreeMixin {
  int _pageIndex = 0;

  int get pageIndex => _pageIndex;

  void goTo({int index = 0}) {
    _pageIndex = index;
    notifyListeners();
  }

//-------------------------------------------------
  int _categories = 0;

  int get categories => _categories;

  void goCategories({int index = 0}) {
    _categories = index;
    notifyListeners();
  }

//-------------------------------------------------
  int _sizeCup = 1;

  int get sizeCup => _sizeCup;

  void setSizeCup({int index = 0}) {
    _sizeCup = index;
    notifyListeners();
  }

//-------------------------------------------------
  bool _lading = false;

  bool get loading => _lading;

  void setLoading(bool value) {
    _lading = value;
    notifyListeners();
  }
}
