import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/utils/custom_appbar.dart';

class NotificationNews extends StatelessWidget {
  const NotificationNews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          CustomAppBar().appBar(title: Text('Notification'.tr), center: true),
      body: Center(
        child: Text('Notification'.tr),
      ),
    );
  }
}
