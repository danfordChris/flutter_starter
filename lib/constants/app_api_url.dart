import 'package:changisha/services/env_helper.dart';
import 'package:flutter/foundation.dart';

class AppApiUrl {
  AppApiUrl._();

  static final String apiBaseUrl = kDebugMode
      ? EnvHelper.localUrl
      : EnvHelper.stagingUrl;

  //auth api
  static final String login = '$apiBaseUrl/login';
  static final String register = '$apiBaseUrl/register';
}
