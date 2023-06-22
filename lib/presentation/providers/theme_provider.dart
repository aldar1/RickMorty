import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {

  bool _isDarkTheme = false;

  bool get isdarktheme => _isDarkTheme;

  set isdarktheme(bool _){
    _isDarkTheme = _;
    notifyListeners();
  }
  

  

}