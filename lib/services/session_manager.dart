import 'dart:io';
import 'package:changisha/services/localization_service.dart';
import 'package:changisha/services/preferences.dart';
import 'package:changisha/utils/components/app_toast.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:ipf_flutter_starter_pack/services.dart';

class SessionManager {
  SessionManager._();
  static final SessionManager _instance = SessionManager._();
  static SessionManager get instance => _instance;

  late String _deviceId;
  String get deviceId => _deviceId;

  late bool _themeData;
  bool get isDarkMode => _themeData;

  void setup() async {
    _deviceId = await _deviceInfoId;
    final _theme = await Preferences.instance.darkMode;
    _theme == true ? _themeData = true : false;
    // AppUtility.log("Device ID Set");
  }

  Future<String> get _deviceInfoId async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      String? deviceId = iosInfo.identifierForVendor;
      if (deviceId == null) throw Exception("Device ID not found");
      return deviceId;
    }
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      return androidInfo.id;
    }
    throw Exception("Device not supported");
  }

  static void handleError(Object exception) {
    _handleError(exception);
  }

  Future<void> changeTheme() async {
    final themeData = await Preferences.instance.darkMode;
    _themeData = themeData == true;

    print('Theme changed to ${themeData}');
  }

  static void showError(BuildContext context, Object exception) {
    _handleError(exception, context: context);
  }

  static void _handleError(Object exception, {BuildContext? context}) {
    String formattedError = exception.toString().replaceAll("Exception: ", "");
    AppUtility.log(formattedError);
    if (context == null) return;
    ImbejuToast.error(
      title: Strings.instance.error,
      description: formattedError,
    ).show(context);
  }
}
