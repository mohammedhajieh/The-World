import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class Hide extends GetxController {
  RxBool isVisible = true.obs; // Make isVisible observable
  final ScrollController scrollController = ScrollController();
  double previousScrollPosition = 0.0;

  @override
  void onInit() {
    super.onInit();
    scrollController.addListener(_handleScroll);
  }

  void _handleScroll() {
    if (scrollController.position.userScrollDirection ==
        ScrollDirection.reverse) {
      if (isVisible.value == true) {
        isVisible.value = false;
      }
    } else {
      if (scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        if (isVisible.value == false) {
          isVisible.value = true;
        }
      }
    }
  }
}
