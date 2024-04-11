import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppLanguage extends ChangeNotifier {
  Locale _appLocale = const Locale('en');

  Locale get appLocale => _appLocale;
  fetchLocale() async {
    var prefs = await SharedPreferences.getInstance();
    if (prefs.getString('language_code') == null) {
      _appLocale = const Locale('bs');
      return Null;
    }
    _appLocale = Locale(prefs.getString('language_code')!);
    return Null;
  }

  void changeLanguage(Locale type) async {
    var prefs = await SharedPreferences.getInstance();

    _appLocale = type;
    await prefs.setString('language_code', type.languageCode);

    notifyListeners();
  }

  String fetchLanguage() {
    if (_appLocale.languageCode.contains('bs')) {
      return 'Bosanski';
    } else {
      return 'English';
    }
  }
}
