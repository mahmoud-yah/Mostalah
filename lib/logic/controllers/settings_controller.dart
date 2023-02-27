import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mostalah/config/app_theme.dart';

class SettingsController extends GetxController {
  var themeIndex = 0.obs;
  var conversionIndex = 0.obs;
  final box = GetStorage();
  var isSyrian = true.obs;
  ThemeData? themeData;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    print('is dark: ${box.read('isDark')}');
    _restoreTheme();
    _restoreConversionType();
  }

  void changeTheme(int index) {
    themeIndex.value = index;
    if (index == 0) {
      Get.changeTheme(AppTheme.light);
      storeThemeSetting(false);
    } else {
      Get.changeTheme(AppTheme.dark);
      storeThemeSetting(true);
    }
    print(box.read('isDark'));
  }

  void _restoreTheme() {
    bool isDark =
        box.read('isDark') ?? false; // null check for first time running this
    if (isDark) {
      themeData = AppTheme.dark;
      themeIndex.value = 1;
    } else {
      themeData = AppTheme.light;
      themeIndex.value = 0;
    }
  }

  void storeThemeSetting(bool isDark) {
    box.write('isDark', isDark);
  }

  void changeType(int index) {
    conversionIndex.value = index;
    if (index == 0) {
      isSyrian.value = true;
      storeConversionType(true);
    } else {
      isSyrian.value = false;
      storeConversionType(false);
    }
  }

  void storeConversionType(bool isSyrian) {
    box.write('isSyrian', isSyrian);
  }

  void _restoreConversionType() {
    bool isSyrian =
        box.read('isSyrian') ?? false; // null check for first time running this
    if (isSyrian) {
      this.isSyrian.value = isSyrian;
      conversionIndex.value = 0;
    } else {
      this.isSyrian.value = isSyrian;
      conversionIndex.value = 1;
    }
  }
}
