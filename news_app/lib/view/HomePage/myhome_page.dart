import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:news_app/controller/drawer.dart';
import 'package:news_app/controller/location_controller.dart';
import 'package:news_app/main.dart';
import 'package:news_app/view/HomePage/home.dart';
import 'package:news_app/view/drawermenu/drawer_menu.dart';

class MyHomePage extends GetView<MyDrawerController> {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => LocationController());
    return GetBuilder<MyDrawerController>(
      builder: (_) => ZoomDrawer(
        controller: _.zoomDrawerController,
        style: DrawerStyle.defaultStyle,
        menuScreen: const MenuScreen(),
        mainScreen: MyHome(),
        borderRadius: 24.0,
        showShadow: true,
        mainScreenScale: 0.2,
        drawerShadowsBackgroundColor:
            Get.isDarkMode ? Colors.black : Colors.white,
        menuBackgroundColor: Theme.of(context).scaffoldBackgroundColor,
        androidCloseOnBackTap: true,
        mainScreenTapClose: true,
        isRtl: sharedPref!.getString("lang") == null
            ? Get.deviceLocale?.languageCode == "en"
                ? false
                : true
            : Locale(sharedPref!.getString("lang")!).languageCode == "en"
                ? false
                : true,
        openCurve: Curves.linear,
        closeCurve: Curves.decelerate,
        slideWidth: MediaQuery.of(context).size.width * 0.70,
      ),
    );
  }
}
