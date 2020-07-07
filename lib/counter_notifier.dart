import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CounterNotifier with ChangeNotifier {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  static const _prefName = 'count';

  int _value = 0;
  int get value => _value;

  void _changeValue(int newValue) {
    if (newValue.isNegative) return;
    _prefs.then((prefs) => prefs.setInt(_prefName, newValue));
    _value = newValue;
    notifyListeners();
  }

  CounterNotifier() {
    _prefs.then((prefs) {
      final newValue = prefs.getInt(_prefName);

      if (newValue != null) {
        print('found a saved value: $newValue');
        _changeValue(newValue);
      }
    });
  }

  void increase() => _changeValue(value + 1);

  void decrease() => _changeValue(value - 1);
}
