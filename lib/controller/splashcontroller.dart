import 'dart:async';

import 'package:doctor/view/auth/login/login.dart';
import 'package:get/get.dart';

class SplashController extends GetxController{
  @override
  void onInit() {
     Timer(const Duration(seconds: 5), () {
      Get.to(() => LoginScreen());
    });
  }
}