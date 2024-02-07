import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:lottie/lottie.dart';
import 'package:news_app/controller/network_connection.dart';
import 'package:news_app/model/news_model.dart';
import 'package:news_app/model/responsiveui.dart';
import 'package:news_app/utils/custom_appbar.dart';
import 'package:news_app/utils/custom_internet.dart';
import 'package:news_app/utils/custom_tags.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsDetail extends StatelessWidget {
  const NewsDetail({super.key, required this.n});
  final NewsModel n;
  @override
  Widget build(BuildContext context) {
    final ConnectionManagerController controller =
        Get.find<ConnectionManagerController>();
    return Obx(
      () => controller.connectionType.value == 1 ||
              controller.connectionType.value == 2
          ? Stack(
              children: [
                CachedNetworkImage(
                  height: double.infinity,
                  width: double.infinity,
                  alignment: Alignment.center,
                  fit: BoxFit.fill,
                  imageUrl: n.urlToImage,
                  placeholder: (context, url) => Center(
                      child: CircularProgressIndicator(
                    color: Theme.of(context).iconTheme.color,
                  )),
                  errorWidget: (context, url, error) => Center(
                    child: Lottie.asset(
                      'assets/Lottie/Animation - 1704298513408.json',
                      height: 500,
                      width: 500,
                    ),
                  ),
                ),
                Scaffold(
                  backgroundColor: Colors.transparent,
                  appBar: CustomAppBar().appBar(
                    leading: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Container(
                        height: ResponsiveUi()
                            .getMediaQueryHeight(context: context, value: 30),
                        width: ResponsiveUi()
                            .getMediaQueryWidth(context: context, value: 30),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Theme.of(context)
                              .appBarTheme
                              .backgroundColor!
                              .withOpacity(0.22),
                        ),
                        child: IconButton(
                            onPressed: () => Get.back(),
                            icon: Icon(
                              Icons.arrow_back,
                              size: 28,
                              color: Theme.of(context).iconTheme.color,
                            )),
                      ),
                    ),
                    color: Colors.transparent,
                  ),
                  extendBodyBehindAppBar: true,
                  body: ListView(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(25),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                                height: ResponsiveUi().getMediaQueryHeight(
                                    context: context, value: 260)),
                            CustomTag(
                              backgroundColor: Colors.grey.withAlpha(160),
                              children: [
                                Icon(
                                  Icons.timer,
                                  color: Theme.of(context).iconTheme.color,
                                ),
                                SizedBox(
                                    width: ResponsiveUi().getMediaQueryWidth(
                                        context: context, value: 10)),
                                Text(
                                  textScaler: TextScaler.linear(
                                      ResponsiveUi().textScaleFactor(context)),
                                  Jiffy.parse(n.publishedAt.toString())
                                      .yMMMEdjm,
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ],
                            ),
                            SizedBox(
                                height: ResponsiveUi().getMediaQueryHeight(
                                    context: context, value: 10)),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                          ),
                          color: Get.isDarkMode ? Colors.black : Colors.white,
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                CustomTag(
                                  backgroundColor: Get.isDarkMode
                                      ? Colors.white
                                      : Colors.black,
                                  children: [
                                    CircleAvatar(
                                      radius: 12,
                                      backgroundImage:
                                          CachedNetworkImageProvider(
                                        n.urlToImage,
                                      ),
                                    ),
                                    SizedBox(
                                        width: ResponsiveUi()
                                            .getMediaQueryWidth(
                                                context: context, value: 10)),
                                    Text(n.source.name,
                                        textScaler: TextScaler.linear(
                                            ResponsiveUi()
                                                .textScaleFactor(context)),
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineLarge),
                                  ],
                                ),
                                const Spacer(),
                                InkWell(
                                  onTap: () {
                                    launchUrl(
                                      Uri.parse(n.url),
                                    );
                                  },
                                  child: CustomTag(
                                    backgroundColor: Colors.grey.shade200,
                                    children: [
                                      Text(
                                        'Read More'.tr,
                                        textScaler: TextScaler.linear(
                                            ResponsiveUi()
                                                .textScaleFactor(context)),
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge!
                                            .copyWith(color: Colors.black),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                    width: ResponsiveUi().getMediaQueryWidth(
                                        context: context, value: 10)),
                              ],
                            ),
                            SizedBox(
                                height: ResponsiveUi().getMediaQueryHeight(
                                    context: context, value: 20)),
                            Text(n.title,
                                textScaler: TextScaler.linear(
                                    ResponsiveUi().textScaleFactor(context)),
                                style:
                                    Theme.of(context).textTheme.headlineMedium),
                            SizedBox(
                                height: ResponsiveUi().getMediaQueryHeight(
                                    context: context, value: 20)),
                            Text(
                              textScaler: TextScaler.linear(
                                  ResponsiveUi().textScaleFactor(context)),
                              n.description,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                      height: ResponsiveUi()
                                          .getMediaQueryHeight(
                                              context: context, value: 1.5)),
                            ),
                            const SizedBox(height: 20),
                            GridView.builder(
                                shrinkWrap: true,
                                itemCount: 2,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: 1.25,
                                ),
                                itemBuilder: (context, index) {
                                  return Container(
                                    clipBehavior: Clip.hardEdge,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    width: MediaQuery.of(context).size.width *
                                        0.42,
                                    margin: const EdgeInsets.only(
                                        right: 5.0, bottom: 5.0),
                                    child: CachedNetworkImage(
                                      fit: BoxFit.fill,
                                      imageUrl: n.urlToImage,
                                      placeholder: (context, url) => Center(
                                          child: CircularProgressIndicator(
                                        color:
                                            Theme.of(context).iconTheme.color,
                                      )),
                                      errorWidget: (context, url, error) =>
                                          Center(
                                        child: Lottie.asset(
                                          'assets/Lottie/Animation - 1704298513408.json',
                                          height: 500,
                                          width: 500,
                                        ),
                                      ),
                                    ),
                                  );
                                })
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          : const CustomInternet(),
    );
  }
}
