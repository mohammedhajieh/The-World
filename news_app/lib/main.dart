import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jiffy/jiffy.dart';
import 'package:news_app/controller/drawer.dart';
import 'package:news_app/controller/language_controller.dart';
import 'package:news_app/controller/network_connection.dart';
import 'package:news_app/controller/theme_custom.dart';
import 'package:news_app/model/dependency_injection.dart';
import 'package:news_app/model/language.dart';
import 'package:news_app/model/theme.dart';
import 'package:news_app/view/HomePage/myhome_page.dart';
import 'package:news_app/view/Language/language_page.dart';
import 'package:news_app/view/Notification/notification.dart';
import 'package:news_app/view/SplashScreen/splash_screen.dart';
import 'package:news_app/view/Theme/theme_mode.dart';
import 'package:news_app/view/onboarding/onboarding.dart';
import 'package:news_app/view/search/search_page.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences? sharedPref;
int? initScreen;
Future<void> main() async {
  Get.lazyPut(() => ConnectionManagerController());
  await GetStorage.init();
  Get.put<MyDrawerController>(MyDrawerController());
  ThemeController().onInit();
  WidgetsFlutterBinding.ensureInitialized();
  sharedPref = await SharedPreferences.getInstance();
  initScreen = sharedPref!.getInt("initScreen");
  Jiffy.setLocale(
    sharedPref!.getString("lang") == null
        ? Get.deviceLocale?.languageCode == "en"
            ? 'en'
            : 'ar'
        : Locale(sharedPref!.getString("lang")!).languageCode == "en"
            ? 'en'
            : 'ar',
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    LanguageController controller = Get.put(LanguageController());
    Get.put(ThemeController());
    return ResponsiveSizer(
      builder: (context, orientation, screenType) => GetMaterialApp(
        title: 'Flutter Demo',
        locale: controller.intilang,
        translations: LanguageService(),
        themeMode: ThemeMode.system,
        darkTheme: ThemeService().dark(),
        theme: ThemeService().light(),
        defaultTransition: Transition.topLevel,
        transitionDuration: const Duration(seconds: 1, milliseconds: 40),
        initialBinding: ControllerBinding(),
        getPages: [
          GetPage(
            name: '/OnBoarding',
            page: () => const OnBoarding(),
            transitionDuration: const Duration(seconds: 3),
            transition: Transition.circularReveal,
          ),
          GetPage(
            name: '/MyHome',
            page: () => const MyHomePage(),
            transitionDuration: const Duration(seconds: 2, milliseconds: 20),
            transition: Transition.fadeIn,
          ),
          GetPage(
            name: '/Notifications',
            page: () => const NotificationNews(),
          ),
          GetPage(
            name: '/LanguagePage',
            page: () => const LanguagePage(),
          ),
          GetPage(
            name: '/CustomThemeModeService',
            page: () => CustomThemeMode(),
          ),
          GetPage(
            name: '/SearchPage',
            page: () => SearchPage(),
          ),
        ],
        home: const SplashScreen(),
      ),
    );
  }
}
