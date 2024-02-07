import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:news_app/controller/clock_controller.dart';
import 'package:news_app/controller/weather_controller.dart';
import 'package:permission_handler/permission_handler.dart';

class LocationController extends GetxController {
  // create various variables
  final RxBool _isLoading = true.obs;
  final RxDouble _lattitude = 51.5072.obs;
  final RxDouble _longitude = 0.1276.obs;
  final RxInt _currentIndex = 0.obs;
  final String lang = '';
  // instance for them to be called
  RxBool checkLoading() => _isLoading;
  RxDouble getLattitude() => _lattitude;
  RxDouble getLongitude() => _longitude;

  final clockLocation = ClockController().obs;
  final weatherNow = WeatherController().obs;
  ClockController getData() {
    return clockLocation.value;
  }

  WeatherController getDataWatherNow() {
    return weatherNow.value;
  }

  @override
  void onInit() {
    if (_isLoading.isTrue) {
      getLocationClock();
      getDataWatherNow();
      getLocationWeatherDay();
    } else {
      getIndex();
    }
    super.onInit();
  }

  getLocationClock() async {
    const permissionLocation = Permission.location;
    LocationPermission permission;
    permission = await Geolocator.checkPermission();
    final status = await permissionLocation.request();
    if (status == PermissionStatus.granted) {
      await Geolocator.getCurrentPosition();
    } else if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    } else if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // getting the currentposition
    return await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high)
        .then((value) {
      // update our lattitude and longitude
      _lattitude.value = value.latitude;
      _longitude.value = value.longitude;
      // calling our weather api
      return ClockController()
          .clockLocation(value.latitude, value.longitude)
          .then((value) {
        clockLocation.value = value as ClockController;
        _isLoading.value = false;
      });
    });
  }

  getLocationWeatherDay() async {
    const permissionLocation = Permission.location;
    LocationPermission permission;
    permission = await Geolocator.checkPermission();
    final status = await permissionLocation.request();
    if (status == PermissionStatus.granted) {
      await Geolocator.getCurrentPosition();
    } else if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    } else if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // getting the currentposition
    return await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high)
        .then((value) {
      // update our lattitude and longitude
      _lattitude.value = value.latitude;
      _longitude.value = value.longitude;
      // calling our weather api
      return WeatherController()
          .getWeatherNow1(lang, value.latitude, value.longitude)
          .then((value) {
        weatherNow.value = value as WeatherController;
        _isLoading.value = false;
      });
    });
  }

  RxInt getIndex() {
    return _currentIndex;
  }
}
