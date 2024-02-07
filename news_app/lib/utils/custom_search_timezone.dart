import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/model/responsiveui.dart';
import 'package:news_app/utils/custom_searchclockworld.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomTimeZone extends StatelessWidget {
  const CustomTimeZone({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showSearch(context: context, delegate: SearchClock());
      },
      child: Container(
        height: ResponsiveUi().getMediaQueryHeight(context: context, value: 50),
        margin: const EdgeInsets.all(16.0),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              blurRadius: 2.0,
              offset: const Offset(0.2, 0.2),
              color: Colors.grey[400]!,
            )
          ],
          color: Theme.of(context).appBarTheme.backgroundColor,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            const Icon(
              Icons.search,
              size: 25,
              color: Colors.grey,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Text("Search...".tr,
                    textScaler: TextScaler.linear(
                      ResponsiveUi().textScaleFactor(context),
                    ),
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(fontSize: 16.sp)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
