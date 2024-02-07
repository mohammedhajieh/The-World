import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:news_app/controller/splash_controller.dart';
import 'package:news_app/model/lottie.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: GetBuilder<SplashScreenController>(
        init: SplashScreenController(),
        builder: (controller) {
          return Container(
            color: Get.isDarkMode ? Colors.black : Colors.white,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Lottie.asset(
                      LottieImage.splashScreen,
                      width: controller.animation.value * 400,
                      height: controller.animation.value * 400,
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Text(
                      'The World App',
                      style: Theme.of(context).textTheme.displaySmall,
                      textScaler: TextScaler.noScaling,
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
