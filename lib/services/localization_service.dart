import 'package:flutter/material.dart';
import 'package:changisha/generated/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class Strings {
  Strings._();
  static final S _instance = S.current;
  static S get instance => _instance;

  static List<LocalizationsDelegate<dynamic>> get localizationDelegates {
    return [
      S.delegate,
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
    ];
  }

  static List<Locale> get supportedLocales => [
    const Locale('en', 'US'),
    const Locale('sw', 'TZ'),
  ];
}
