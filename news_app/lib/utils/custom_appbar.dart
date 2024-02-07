import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppBar {
  List<String> title = ['News'.tr, 'Search'.tr, 'Weather'.tr, 'Clock'.tr];
  AppBar appBar(
          {Widget? title,
          bool? center,
          List<Widget>? action,
          Widget? leading,
          Color? color}) =>
      AppBar(
        backgroundColor: color,
        title: title,
        centerTitle: center,
        actions: action,
        leading: leading,
      );
}
