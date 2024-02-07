import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'package:news_app/model/news_model.dart';
import 'package:news_app/model/responsiveui.dart';

class TickerNews extends StatelessWidget {
  const TickerNews({super.key, required this.n});
  final NewsModel n;
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        _wrapWithStuff(
          Marquee(
            textScaleFactor: ResponsiveUi().textScaleFactor(context),
            text: '${n.title}.',
            style: Theme.of(context).textTheme.bodyLarge,
            scrollAxis: Axis.horizontal,
            crossAxisAlignment: CrossAxisAlignment.center,
            blankSpace: 50.0,
            velocity: 80.0,
            startPadding: 10.0,
            accelerationCurve: Curves.linear,
            decelerationCurve: Curves.easeOut,
          ),
          context,
        ),
      ],
    );
  }

  Widget _wrapWithStuff(Widget child, BuildContext context) {
    return Container(
        height: ResponsiveUi().getMediaQueryHeight(context: context, value: 40),
        color: Colors.red,
        child: child);
  }
}
