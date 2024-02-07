import 'package:get/get.dart';
import 'package:news_app/model/lottie.dart';

class Items {
  final String img;
  final String title;
  final String subTitle;

  ///
  Items({
    required this.img,
    required this.title,
    required this.subTitle,
  });
}

List<Items> listOfItems = [
  Items(
    img: LottieImage.newsOnBoarding,
    title: "News in the world".tr,
    subTitle:
        "Al locus where you get chance to authenticate news\nto make impact on society"
            .tr,
  ),
  Items(
    img: LottieImage.weatherOnBoarding,
    title: "Weather in the world".tr,
    subTitle: "Discover the weather your city and plan\nyour day correctly".tr,
  ),
  Items(
    img: LottieImage.clockOnBoarding,
    title: "Time in the world".tr,
    subTitle: "Discover the time of all the world".tr,
  ),
];
