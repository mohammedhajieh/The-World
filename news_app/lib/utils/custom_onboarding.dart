import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/main.dart';
import 'package:news_app/model/responsiveui.dart';

class GetStartBtn extends StatefulWidget {
  const GetStartBtn({
    Key? key,
    required this.size,
    required this.textTheme,
  }) : super(key: key);

  final Size size;
  final TextTheme textTheme;

  @override
  State<GetStartBtn> createState() => _GetStartBtnState();
}

class _GetStartBtnState extends State<GetStartBtn> {
  bool isLoading = false;

  loadingHandler() async {
    await sharedPref!.setInt("initScreen", 1);
    setState(() {
      isLoading = true;
      Future.delayed(const Duration(seconds: 2)).then((value) {
        isLoading = false;
        Get.offAllNamed('MyHome');
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: loadingHandler,
      child: Container(
        margin: const EdgeInsets.only(top: 60),
        width: widget.size.width / 1.5,
        height: widget.size.height / 13,
        decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(15)),
        child: Center(
          child: isLoading
              ? Center(
                  child: SizedBox(
                    width: 30,
                    height: 30,
                    child: CircularProgressIndicator(
                      color: Theme.of(context).iconTheme.color,
                    ),
                  ),
                )
              : Text(
                  "Get Started now".tr,
                  style: widget.textTheme.headlineMedium,
                  textScaler: TextScaler.linear(
                      ResponsiveUi().textScaleFactor(context)),
                ),
        ),
      ),
    );
  }
}
