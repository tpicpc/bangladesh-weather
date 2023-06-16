import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeServices {
  final _box = GetStorage();

  final _kay = "isDarkmood";

  _saveThemeToBox(bool isDarkmood) => _box.write(_kay, isDarkmood);

  bool _loadThemeFormBox() => _box.read(_kay) ?? false;

  ThemeMode get theme => _loadThemeFormBox() ? ThemeMode.dark : ThemeMode.light;

  void switchTheme() {
    Get.changeThemeMode(_loadThemeFormBox() ? ThemeMode.light : ThemeMode.dark);
    _saveThemeToBox(!_loadThemeFormBox());
  }
}
