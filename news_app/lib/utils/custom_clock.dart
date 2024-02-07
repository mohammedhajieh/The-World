import 'package:flutter/material.dart';
import 'package:news_app/model/responsiveui.dart';
import 'package:news_app/utils/custom_analogclock.dart';

class CustomClock extends StatelessWidget {
  final DateTime? dateTime;
  const CustomClock({
    super.key,
    this.dateTime,
  });
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: AspectRatio(
            aspectRatio: 1,
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context)
                    .appBarTheme
                    .backgroundColor!
                    .withOpacity(0.18),
                shape: BoxShape.circle,
              ),
              child: AnalogClock(
                useMilitaryTime: false,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 2.0,
                    color: Theme.of(context).appBarTheme.backgroundColor!,
                  ),
                  color: Colors.transparent,
                  shape: BoxShape.circle,
                ),
                digitalClockColor: Theme.of(context).iconTheme.color!,
                secondHandColor: Colors.red,
                isLive: true,
                hourHandColor: Theme.of(context).iconTheme.color!,
                minuteHandColor: Theme.of(context).iconTheme.color!,
                showSecondHand: true,
                numberColor: Theme.of(context).iconTheme.color!,
                showNumbers: true,
                showAllNumbers: true,
                textScaleFactor: ResponsiveUi().textScaleFactor(context),
                tickColor: Colors.white60,
                showTicks: true,
                showDigitalClock: true,
                datetime: dateTime,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
