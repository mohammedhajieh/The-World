import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ButtomNavBar extends GetxController {
  late PageController pageController;
  RxInt index = 0.obs;

  void onTap(int page) {
    index.value = page;
    pageController.jumpToPage(page);
  }

  void animateOnTap(int page) {
    index.value = page;
    pageController.animateToPage(page,
        duration: const Duration(milliseconds: 200), curve: Curves.ease);
  }

  @override
  void onInit() {
    super.onInit();
    pageController = PageController(initialPage: 0);
  }

  @override
  void onClose() {
    super.onClose();
    pageController.dispose();
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }
}
