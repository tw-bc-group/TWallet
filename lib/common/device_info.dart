import 'package:device_info/device_info.dart';

class DeviceInfo {
  static AndroidDeviceInfo androidDeviceInfo;
  static IosDeviceInfo iosDeviceInfo;

  static Future<void> initialDeviceInfo() async {
    final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
    try {
      androidDeviceInfo = await deviceInfoPlugin.androidInfo;
    } catch (_) {}
    try {
      iosDeviceInfo = await deviceInfoPlugin.iosInfo;
    } catch (_) {}
  }

  static bool isIOS() {
    return iosDeviceInfo != null;
  }

  static bool isIphoneXSeries() {
    if (isIOS()) {
      final iphoneName = iosDeviceInfo.name;
      if (iphoneName.startsWith('iPhone X') ||
          iphoneName.startsWith('iPhone 1')) {
        return true;
      }
    }
    return false;
  }
}
