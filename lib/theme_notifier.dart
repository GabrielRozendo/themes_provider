import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:themes_provider/themes.dart';
import 'package:themes_provider/utils/stack_list.dart';

class ThemeNotifier with ChangeNotifier {
  StackList<int> _stackList = StackList<int>();
  int get _currentIndex => _stackList.top;
  ThemeData _themeData;

  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  ThemeNotifier(this._themeData) {
    int index =
        Themes.themesList.indexWhere((element) => element == _themeData);
    _stackList = StackList<int>(init: index);
    _prefs.then((prefs) {
      index = prefs.getInt('themeIndex') ?? 0;
      _stackList = StackList<int>(init: index);
      setTheme();
    });
  }

  ThemeData get getTheme => _themeData;

  Future setTheme() async {
    _themeData = Themes.themesList[_currentIndex];
    final prefs = await _prefs;
    prefs.setInt('themeIndex', _currentIndex);
    notifyListeners();
  }

  Future nextTheme() async {
    final newIndex =
        _currentIndex + 1 >= Themes.themesList.length ? 0 : _currentIndex + 1;
    _stackList.push(newIndex);

    await setTheme();
    return Themes.themesList[_currentIndex].toString();
  }

  Future revertTheme() async {
    _stackList.pop();
    await setTheme();
  }
}
