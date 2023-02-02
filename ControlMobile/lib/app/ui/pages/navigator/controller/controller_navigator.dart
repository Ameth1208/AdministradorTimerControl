import 'package:flutter/material.dart';

///CONTROLLER ANDROID
class NavigatorController extends ChangeNotifier {
  PageController pageController = PageController();

  int _indicatorPage = 0;

  int get indicatorPage => _indicatorPage;
  set indicatorPage(int indicatorPage) {
    _indicatorPage = indicatorPage;
    notifyListeners();
  }

  void onPage(int i) {
    pageController.animateToPage(i,
        duration: const Duration(milliseconds: 300),
        curve: Curves.linearToEaseOut);
    indicatorPage = i;
    notifyListeners();
  }
}
