import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:package_info_plus/package_info_plus.dart';

class GlobalValues extends GetxController {
  var packageInfo = PackageInfo(
    appName: 'Unknown',
    packageName: 'Unknown',
    version: '0.0.0',
    buildNumber: 'Unknown',
    buildSignature: 'Unknown',
    installerStore: 'Unknown',
  ).obs;

  final _box = GetStorage();
  final _key = 'isDarkMode';
  final Rx<ThemeMode> themeMode = ThemeMode.system.obs;

  @override
  void onInit() {
    super.onInit();
    initPackageInfo();
    final savedTheme = _box.read(_key) ?? false;
    themeMode.value = savedTheme ? ThemeMode.dark : ThemeMode.light;
    Get.changeThemeMode(themeMode.value);
  }

  initPackageInfo() async {
    final info = await PackageInfo.fromPlatform();
    packageInfo.value = info;
  }

  void toggleTheme() {
    themeMode.value = themeMode.value == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;

    _box.write(_key, themeMode.value == ThemeMode.dark);

    Get.changeThemeMode(themeMode.value);
  }

  void setToSystem() {
    themeMode.value = ThemeMode.system;
    _box.remove(_key);
    Get.changeThemeMode(ThemeMode.system);
  }
}
