// ignore_for_file: unused_local_variable, avoid_print

import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class LocationService {
  Future<Position> getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // تحقق من تفعيل خدمة الـ GPS
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('خدمة الموقع غير مفعلة');
    }

    // طلب صلاحية الموقع
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('تم رفض صلاحية الموقع');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error('تم رفض صلاحية الموقع نهائيًا');
    }

    // جلب الموقع الحالي
    return await Geolocator.getCurrentPosition();
  }

  Future<void> requestLocationPermission() async {
    var status = await Permission.location.request();
    if (status.isGranted) {
      // الصلاحية تم منحها
    } else if (status.isDenied) {
      // تم رفض الصلاحية
    } else if (status.isPermanentlyDenied) {
      // تم منع الصلاحية نهائيًا
      openAppSettings(); // يمكن فتح إعدادات التطبيق
    }
  }

  Future<void> fetchWeatherBasedOnLocation() async {
    try {
      Position position = await getCurrentLocation();
      double latitude = position.latitude;
      double longitude = position.longitude;

      // استدعاء API الطقس باستخدام إحداثيات الموقع
      // String apiUrl = 'https://api.weather.com/v3/wx/conditions/current?geocode=$latitude,$longitude&apiKey=YOUR_API_KEY';

    } catch (e) {
      print('حدث خطأ أثناء جلب الموقع: $e');
    }
  }
}