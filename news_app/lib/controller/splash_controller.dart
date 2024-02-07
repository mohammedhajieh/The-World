import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/main.dart';

class SplashScreenController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;

  @override
  void onInit() {
    animationInitilization();
    super.onInit();
  }

  animationInitilization() {
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 8));
    animation = CurvedAnimation(
            parent: animationController, curve: Curves.easeInOutCubicEmphasized)
        .obs
        .value;
    animation.addListener(() => update());
    animationController.forward().whenComplete(() {
      initScreen == 0 || initScreen == null
          ? Get.offAllNamed('/OnBoarding')
          : Get.offAllNamed('/MyHome');
    });
  }
}
