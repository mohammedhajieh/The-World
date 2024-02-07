import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/controller/bottomnavbar.dart';
import 'package:news_app/model/responsiveui.dart';

class CustomBottomNavBar extends StatelessWidget {
  CustomBottomNavBar({super.key});

  final ButtomNavBar controler = Get.put(ButtomNavBar());
  @override
  Widget build(BuildContext context) {
    List<IconData> data = [
      Icons.home_outlined,
      Icons.search,
      Icons.sunny_snowing,
      Icons.timer_sharp,
    ];
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical:
            ResponsiveUi().getMediaQueryHeight(context: context, value: 22),
        horizontal:
            ResponsiveUi().getMediaQueryWidth(context: context, value: 14),
      ),
      child: Material(
        elevation: 10,
        borderRadius: BorderRadius.circular(20),
        color: Theme.of(context).appBarTheme.backgroundColor,
        child: SizedBox(
          height:
              ResponsiveUi().getMediaQueryHeight(context: context, value: 60),
          width: ResponsiveUi()
              .getMediaQueryWidth(context: context, value: double.infinity),
          child: Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ...List.generate(
                  data.length,
                  (i) => GestureDetector(
                    onTap: () {
                      controler.onTap(i);
                    },
                    child: AnimatedContainer(
                      curve: Curves.easeIn,
                      duration: const Duration(milliseconds: 200),
                      width: ResponsiveUi()
                          .getMediaQueryWidth(context: context, value: 35),
                      decoration: BoxDecoration(
                        border: i == controler.index.value
                            ? Border(
                                top: BorderSide(
                                  width: ResponsiveUi().getMediaQueryWidth(
                                      context: context, value: 4),
                                  color: Theme.of(context).highlightColor,
                                ),
                              )
                            : null,
                        gradient: i == controler.index.value
                            ? LinearGradient(
                                tileMode: TileMode.mirror,
                                colors: [
                                  Colors.grey.shade800,
                                  Theme.of(context).indicatorColor
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter)
                            : null,
                      ),
                      child: Icon(
                        data[i],
                        size: 34,
                        color: i == controler.index.value
                            ? Theme.of(context).iconTheme.color
                            : Colors.grey.shade800,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
