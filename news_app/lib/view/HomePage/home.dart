import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/controller/bottomnavbar.dart';
import 'package:news_app/controller/drawer.dart';
import 'package:news_app/controller/hide_controller.dart';
import 'package:news_app/model/responsiveui.dart';
import 'package:news_app/utils/custom_appbar.dart';
import 'package:news_app/utils/custom_bottomnavbar.dart';
import 'package:news_app/view/Clock/clock.dart';
import 'package:news_app/view/News/home_news.dart';
import 'package:news_app/view/Weather/weather.dart';
import 'package:news_app/view/search/search.dart';

class MyHome extends GetView<MyDrawerController> {
  final ButtomNavBar controler = Get.put(ButtomNavBar());
  MyHome({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar().appBar(
        title: Obx(
          () => Text(
            CustomAppBar().title[controler.index.value].tr,
            textScaler: TextScaler.linear(
              ResponsiveUi().textScaleFactor(context),
            ),
          ),
        ),
        center: true,
        leading: IconButton(
          onPressed: controller.toggleDrawer,
          icon: const Icon(Icons.menu),
        ),
        action: [
          IconButton(
            onPressed: () {
              Get.toNamed('/Notifications');
            },
            icon: const Icon(Icons.notifications),
          )
        ],
      ),
      body: PageView(
        onPageChanged: controler.animateOnTap,
        controller: controler.pageController,
        children: [HomeNews(), Search(), Weather(), HomeClock()],
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: GetX<Hide>(
        init: Hide(),
        builder: (controller) => Visibility(
          visible: controller.isVisible.value,
          child: CustomBottomNavBar(),
        ),
      ),
    );
  }
}
