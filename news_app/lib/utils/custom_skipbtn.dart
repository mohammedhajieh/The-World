import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/model/responsiveui.dart';

class SkipBtn extends StatelessWidget {
  const SkipBtn({
    Key? key,
    required this.size,
    required this.textTheme,
    required this.onTap,
  }) : super(key: key);

  final Size size;
  final TextTheme textTheme;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 60),
      width: size.width / 1.5,
      height: size.height / 13,
      decoration: BoxDecoration(
          border: Border.all(
            color: Theme.of(context).cardColor,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(15)),
      child: InkWell(
        borderRadius: BorderRadius.circular(15.0),
        onTap: onTap,
        splashColor: Theme.of(context).cardColor,
        child: Center(
          child: Text(
            "Skip".tr,
            style: textTheme.headlineMedium,
            textScaler:
                TextScaler.linear(ResponsiveUi().textScaleFactor(context)),
          ),
        ),
      ),
    );
  }
}
