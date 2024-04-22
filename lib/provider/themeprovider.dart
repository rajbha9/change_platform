import 'package:flutter/cupertino.dart';

class ThemeChangeAppProvider extends ChangeNotifier {
  bool isAndroid = false;

  void changePlatform() {
    isAndroid = !isAndroid;
    notifyListeners();
  }
}
