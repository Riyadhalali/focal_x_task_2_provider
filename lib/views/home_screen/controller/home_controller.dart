import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  int count = 0;

  inc() {
    count++;
    update(); // update the screens from getx
  }

  void changeTheme() {
    if (Get.isDarkMode) {
      Get.changeTheme(ThemeData.light());
    } else {
      Get.changeTheme(ThemeData.dark());
    }
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
}
