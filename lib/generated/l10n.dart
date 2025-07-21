// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Home Screen`
  String get homeScreen {
    return Intl.message('Home Screen', name: 'homeScreen', desc: '', args: []);
  }

  /// `Settings Screen`
  String get settingsScreen {
    return Intl.message(
      'Settings Screen',
      name: 'settingsScreen',
      desc: '',
      args: [],
    );
  }

  /// `Profile Screen`
  String get profileScreen {
    return Intl.message(
      'Profile Screen',
      name: 'profileScreen',
      desc: '',
      args: [],
    );
  }

  /// `Notifications Screen`
  String get notificationsScreen {
    return Intl.message(
      'Notifications Screen',
      name: 'notificationsScreen',
      desc: '',
      args: [],
    );
  }

  /// `Changisha Dashboard`
  String get homeScreenTittle {
    return Intl.message(
      'Changisha Dashboard',
      name: 'homeScreenTittle',
      desc: '',
      args: [],
    );
  }

  /// `Hi, {userName}! 👋`
  String hiMessage(Object userName) {
    return Intl.message(
      'Hi, $userName! 👋',
      name: 'hiMessage',
      desc: '',
      args: [userName],
    );
  }

  /// `welcome back!`
  String get welcomeMessage {
    return Intl.message(
      'welcome back!',
      name: 'welcomeMessage',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[Locale.fromSubtags(languageCode: 'en')];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
